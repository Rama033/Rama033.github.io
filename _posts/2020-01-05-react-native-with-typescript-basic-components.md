---
layout: post
title: "Reacat Native Styled Components 정리 - with TypeScript"
date: 2020-01-05T14:45:00+09:00
author: Jo
categories: react-native
tags: react-native typescript styled-component component element props
cover: "/assets/instacode.png"
---

# Styled Components
* 공식 홈페이지: <https://www.styled-components.com>  

Styled Components 는 리액트와 리액트 네이티브의 스타일링 적용을 도와주는 오픈 소스 라이브러리로, 인라인 또는 StyleSheet 를 사용하여 스타일을 적용하는 방법에 비해 다음과 같은 장점들이 있다.
* 리액트 및 리액트 네이티브 양 쪽에서 동일한 스타일 코드를 사용할 수 있다.
* 리액트 네이티브에서 기본적으로 스타일은 오브젝트 형식을 사용하기 때문에 text-align 을 textAlign 으로 사용하지만 Styled Components 에서는 웹과 동일하게 text-align 포맷을 사용할 수 있다.
* Styled Components 는 자체적으로 Props 를 사용할 수 있기 때문에 동적으로 변경하는 스타일을 관리하기 쉽게 해준다.
  
위와 같은 장점들이 존재하는 반면, 배포 파일 용량이 커진다는 등의 단점 또한 존재한다.  

Styled Components 를 사용하려면 다음과 같이 라이브러리를 설치하여야 한다.  
~~~
$ npm install --save styled-components
$ npm install --save-dev @types/styled-components
~~~
  
라이브러리를 설치하였으면 다음과 같이 import 해서 사용하면 된다.
~~~typescript
import Styled from 'styled-components/native'
~~~  


### 1. View
~~~typescript
const MyView = Styled.View`
  flex: 1;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  background-color: ${Colors.white};
  margin-top: 8px;
  padding-horizontal: 24px;
`;
~~~  
  
### 2. Text
~~~typescript
constMyText = Styled.Text`
  // 위쪽 여백
  margin-top: 8px;
  // 글씨 크기
  font-size: 18px;
  // 글씨 굵기. 숫자 값 말고 font-weight: bold 처럼 사용해도 됨
  font-weight: 400;
  // 글씨 색
  color: ${Colors.dark};
`;
~~~  
  
### 3. Image

*내용추가 예정* 
