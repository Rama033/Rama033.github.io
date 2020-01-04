---
layout: post
title: "React Native 기본적인거 몇가지 - (작성중)"
date: 2020-01-04T16:12:00+09:00
author: Jo
categories: react-native
tags: react-native component props state
cover: "/assets/instacode.png"
---

# 1. 컴포넌트
컴포넌트는 UI 를 독립적이고 재사용 가능하도록 기능 단위별로 나눠놓은 조각으로, 화면의 구성 요소들은 여러가지 컴포넌트들로 이루어져 있다.  
함수형 컴포넌트와 클래스형 컴포넌트 등이 있다.  
* 클래스형 컴포넌트
~~~typescript
const classComp = () => {
	return (
		<h1>Hello, {props}</h1>
	);
}
~~~   
컴포넌트 라이프사이클 API 를 사용하거나 state, props 를 사용할 수 있다.  
  
* 함수형 컴포넌트
~~~typescript
function funcComp(props) {
	return (
		<h1>Hello, {props}</h1>		
	)
}
~~~  
클래스형 컴포넌트보다 상대적으로 가벼워 첫 마운팅 속도가 7~11% 빠르다고 한다.  
대신 클래스형과는 다르게 라이프사이클 API 나 state 를 사용할 수 없다.  
따라서 간단하게 props 만 넘겨줘서 처리할 수 있을 때 등의 경우에 사용하면 된다.
  
# 2. Props
Properties 의 약자로, 부모 컴포넌트로부터 자식 컴포넌트로 전달되는 데이터이다.  
자식 컴포넌트에서는 변경이 불가능하며, 이는 컴포넌트의 속성(Properties) 와 같음을 나타낸다.  
  
# 3. State
한 컴포넌트 안에서 유동적인 데이터를 다룰 때 사용되며, 컴포넌트 내에서 데이터를 변경할 수 있다.  
즉, State 는 컴포넌트의 상태(State) 를 의미한다고 볼 수 있다.  
  


*내용 추가예정*

