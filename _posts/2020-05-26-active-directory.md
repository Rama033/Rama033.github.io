---
layout: post
disqus_disabled: false
title: "Active Directory"
date: 2020-05-26T14:52:00+09:00
author: Jo
categories: microsoft
tags: microsoft ms solution groupware active-directory ldap windows 
cover: "/assets/instacode.png"
---

### 1. Active Directory 란?

* 네트워크상의 모든 리소스에 관한 정보(사용자 및 컴퓨터, 그룹 등)을 논리적 계층 구조로 중앙 저장소(일종의 데이터베이스)에 저장하여 네트워크상에서 인증을 통해 언제 어디서든 해당 리소스를 검색, 엑세스 할 수 있게 해주는 Directory Service<br>
=> Directory Service?: 분산된 네트워크 관련 자원 정보를 중앙 저장소에 통합시켜 사용자가 중앙 저장소를 통해 원하는 네트워크 자원에 대한 정보를 자동으로 취득하여 접근할 수 있는 서비스 개념, Acive Directory 는 이러한 개념을 Windows Server 에서 실제로 구현한 것이다.<br>
<br>

* 데이터베이스로 저장한다고 하는데 RDBMS 는 아니고 File DB 같은 형태로 저장돼서 사용<br>
    * 단순한 셀렉트, 쿼리 용으로 RDB 는 느리기 때문에 다른 방식을 사용<br>
<br>

* Active Directory 를 관리하기 위해서 별도의 콘솔(MMC) 들을 사용한다.<br>
    * Active Directory 관리 센터, Acive Directory 도메인 및 트러스트, Acive Directory 사용자 및 컴퓨터, Active Directory 사이트 및 서버스, ADSI 편집, DNS, 그룹 정책 관리 등<br>
<br>

* MS 제품을 포함해 많은 서비스들이 Active Directory 를 사용<br>
    * 그룹웨어 시스템의 중심

* DNS(Domain Name System) 을 통해 이름 해석 기능, 해당 개체 위치 정보를 제공<br>
    * AD 를 사용하려면 DNS 는 꼭 있어야함<br>

* 디렉토리 개체와 도메인 자원에 접근할 때 적용되는 모든 권한이 정책을 기반으로 관리<br>

* 사용자 인증과 접근 권한 제어를 통해 보안 기능<br>
    * 사용자 인증은 중앙에서 관리<br>
    * 접근 권한 제어는 AD 의 각 개체뿐 아니라 각 속성에서도 정의 가능<br>
<br>
<br>

### 2. Active Directory 용어

1. 계정관리<br>
AD 에 포함된 다양한 기능중 가장 중요한것이 계정관리<br>

2. 도메인<br>
AD의 기본이 되는 단위로, 관리를 하기 위한 하나의 큰 단위의 범위를 표현하며, 세부 단위로 구분 가능
도메인 가입: 도메인에 가입한 PC 는 하나부터 열까지 다 조절할 수 있음(시작 프로그램, 화면 보호기 등)
AD Domain 에 대한 단위는 Forest > Tree > Domain > OU > Object 로 구성

3. Domain Controller (DC)<br>
로그인, 이용 권한 확인, 새로운 사용자 등록, 암호 변경 그룹 등을 처리하는 기능을 하는 서버
Domain 에 대한 정책 할당, 객체 관리 등의 목적으로 AD 에는 하나 이상의 DC 가 구성되어있어야 함

4. Read Only Domain Controller (RODC)<br>
주 DC 로 부터 AD 관련 데이터 전송받아 저장후 Read Only 로 사용<br>
    * RODC 에서는 데이터 추가, 변경 안함

5. Tree<br>
도메인의 집합

6. Forest<br>
서로 다른 AD 를 묶어서 유기적으로 사용할 수 있게 구성해주는 개념

7. Trust<br>
도메인 또는 Forest 사이에 신뢰할지 여부에 대한 관계를 나타냄
네트워크 트래픽을 줄이고 거쳐가는 Domain Controller 의 부하를 줄이기 위해 사용될 수도 있음
같은 포리스트 안의 도메인 사이에는 상호 양방형 전이 트러스트를 가짐
    * 한쪽 방향의 신뢰 관계만 맺는 경우: 단방향 전이 트러스트
Trust 를 통해 Forest 를 구성. Forest (Trust) > Tree > Domain > OU > Object
계정 정보는 서로 공유할 필요가 있는데 AD 를 별도 구성해야하는 경우 등 사용

8. Global Catalog(GC)<br>
AD Trust 내의 도메인들에 포함된 object 에 대한 정보를 수집하여 저장하는 통합 저장소

9. Object<br>
User, Group, Contact, Desktop, Server, Printer 등으로 AD 를 구성하는 최소 단위
Object 별로 정책 설정 가능
User 는 여러 Group 에 소속할 수 있음 (ex. 홍길동(user) 은 인사팀(group), 대리(group) 등에 속하며, 각각 group 의 정책 설정의 영향을 받음

10. Organization Unit (OU, 조직 구성 단위)<br>
Object 를 관리할 목적으로 만들어진 그룹화된 단위
OU 도 정책 설정 가능
<br>
<br>

### 3. Active Directory 인증 관련 기능
1. 인증 서비스 (LDAP 인증방식)<br>
AD 에서 인증 다 받아서 처리해줌<br>
    * 다른 서비스에서 인증 필요할 때 아이디 패스워드 AD 로 보내면 맞다 틀리다 반환<br>
    * LDAP?: 조직이나 개체, 인터넷, 인트라넷 등 네트워크 상의 파일이나 장치들과 같은 자원 등의 위치를 찾을 수 있게 해주는 SW Protocol

2. 인증서 서비스<br>
AD 가 사설 인증서 발급, 관리하는 인증기관 역할 수행 가능