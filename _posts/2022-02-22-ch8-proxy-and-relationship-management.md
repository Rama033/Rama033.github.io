---
layout: post
disqus_disabled: false
title: "[자바 ORM 표준 JPA 프로그래밍] 8장. 프록시와 연관관계 관리"
date: 2022-02-22T21:35:00+09:00
author: Jo
categories: jpa-study
tags: jpa proxy lazy-loading loading lifecycle transitive persistence orphan
cover: "/assets/instacode.png"
---

# 8장. 프록시와 연관관계 관리 

<br/>
<br/>
<br/>

# 8.1 프록시
- 엔티티 조회 시 연관된 엔티티가 항상 사용되는 것은 아님
- 따라서 JPA는 엔티티가 실제 사용될 때까지 DB 조회를 지연시키는 방법을 제공 ==> **지연 로딩(lazy loading)**
- 지연 로딩 기능을 위해 실제 엔티티 객체 대신 DB 조회를 지연시키는 가짜 객체를 사용 ==> **프록시 객체**
  
<br/>
<br/>

## 8.1.1 프록시 기초
- JPA에서 ```EntityManager.find()``` 사용하여 엔티티 조회하면 바로 DB에서 조회해 옴
- DB 조회를 엔티티 사용 시점까지 지연시키려면 ```EntityManager.getReference()``` 메소드 사용하면 됨 
  - 실제 엔티티 대신 DB 접근을 위임받은 프록시 개체가 반환되어 엔티티 사용시점에 조회할 수 있음

<br/>

#### 프록시의 특징
- **실제 클래스를 상속받아 만들어져서** 실제 클래스와 겉 모습 동일
- 사용하는 입장에서 진짜 객체인지 프록시 개체인지 구분할 필요 X
- 프록시 객체는 **실제 객체에 대한 참조(traget)** 를 보관
- 프록시 객체의 메소드를 호출하면 프록시 객체는 실제 객체의 메소드를 호출

<img src="/assets/img/jpa_study/ch.8/pic-8-1.png">

- 프록시 구조

<br/>

<img src="/assets/img/jpa_study/ch.8/pic-8-2.png">

- 프록시 위임

<br/>

### 프록시 객체의 초기화
- 프록시 객체는 ```member.getName()```처럼 실제 사용 시 DB 조회해서 실제 엔티티 객체 생성 => **프록시의 초기화**

<details>
<summary style="color:rgb(200, 50, 50)"><b>코드 확인</b></summary>
<div markdown="1">

```java
// MemberProxy 반환
Member member = em.getReference(Member.class, "id1");
member.getName();   // 1. getName();

...

class MemberProxy extends Member {
  Member target = null;   // 실제 엔티티 참조
  public String getName() {
    if (target == null) {
      // 2. 초기화 요청
      // 3. DB 조회
      // 4. 실제 엔티티 생성 및 참조 보관
      this.target = ...;
    }

    //5. target.getName();
    return target.getName();
  }
}
```

</div>
</details>

<img src="/assets/img/jpa_study/ch.8/pic-8-3.png">

1. **getName():** 프록시 객체에 ```member.getName()``` 호출하여 실제 데이터 조회
2. **초기화 요청:** 실제 엔티티 생성되어 있지 않으면 영속성 컨테스트에 실제 엔티티 생성을 요청
3. **DB 조회:** 영속성 컨텍스트가 DB 조회해서 실제 엔티티 객체 생성
4. **실제 엔티티 생성:** 프록시 객체는 생성된 실제 엔티티 객체의 참조를 Member target 멤버 변수에 보관
5. **target.getName():** 프록시 객체가 실제 엔티티 객체의 getName() 호출하여 결과 반환

<br/>

### 프록시의 특징
- 처음 사용할 때 한 번만 초기화 됨
- 프록시 객체 초기화해도 프록시객체가 실제 엔티티로 바뀌지 않음
  - 프록시 객체 초기화되면 프록시 객체 통해 실제 엔티티 접근 가능
- 프록시 객체는 원본 엔티티를 상속받은 객체이므로 타입 체크시 주의
- 영속성 컨텍스트에 찾는 엔티티 이미 있을 경우 DB 조회 X
  - ```em.getReference()``` 호출시에도 프록시가 아닌 실제 엔티티를 반환
  - 초기화는 영속성 컨텍스트의 도움 받아야 함
    - 따라서 준영속 상태 프록시 초기화시 문제 발생(ex. 하이버네이트에서는 ```org.higbernate.LazyInitialzationException```)

<br/>

<br/>
<br/>

## 8.1.2 프록시와 식별자
- 엔티티를 프록시로 조회 시 식별자 값을 파라미터로 전달하는데(ex. ```em.getReverenmce(Entity.class, "pk1")```) 프록시 객체는 이 값을 보관
- 엔티티 접근 방식을 프로퍼티(```@Access(AccessType.PROPERTY)```) 로 설정한 경우 식별자 값 조회하는 메소드(ex. ```Entity.getId()```) 호출해도 프록시 초기화 X
- 엔티티 접근 방식을 필드(```@Access(AccessType.FIELD)```) 로 설정 시 식별자 값 조회하는 메소드 호출시에도 프록시 객체를 초기화 함
- 연관관계르 설정할 때는 식별자 값만 사용하기 때문에 프록시를 사용하면 DB 접근 횟수 줄일 수 있음
  - 따라서 연관관계 설정 시 프록시 유용하게 사용
  - 연관관계 설정할 때는 엔티티 접근망식 필드여도 프록시 초기화 안함

<br/>
<br/>

## 8.1.3 프록시 확인
- JPA가 제공하는 ```PersistenceUnitUtil.isLoaded(Object entity) 메소드 사용시 프록시 인스턴스의 초기화 여부 확인 가능
  - 아직 초기화 안되었으면 false
  - 초기화 완료되었거나 프록시 인스턴스 아니면 true
- 조회한 엔티티가 진짜 엔티티인지 프록시로 조회한 것인지 확인하려면 클래스 명 충력해보면 됨
-   클래스 명 뒤에 javassist 라 되어있으면 프록시임
-   이건 프록시 생성 라이브러리에 따라 좀 달라질 수 있음

> **프록시 강제 초기화** <br/>
> 하이버네이트의 ```initialize()```메소드로 프록시 강제 초기화 가능 <br/>
> ```org.hibernate.Hibernate.initilaize(order.getMember());   // 프록시 초기화``` <br/>
> JPA 표준에는 프록시 강제 초기화 메소드 없으므로 프록시 메소드 직접 호출해서 초기화하도록 해야 함

*작성중...(2022-02-22 8.1장까지 함)*
