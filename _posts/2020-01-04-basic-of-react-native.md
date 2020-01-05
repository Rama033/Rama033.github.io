---
layout: post
title: "React Native 컴포넌트, Props, State, Context - (작성중)"
date: 2020-01-04T16:12:00+09:00
author: Jo
categories: react-native
tags: react-native typescript component props state context
cover: "/assets/instacode.png"
---

# 1. 컴포넌트
컴포넌트는 UI 를 독립적이고 재사용 가능하도록 기능 단위별로 나눠놓은 조각으로, 화면의 구성 요소들은 여러가지 컴포넌트들로 이루어져 있다.  
React Native 에는 
* View
* Text
* Image
* TextInput
* ScrollView
* StyleSheet  

와 같은 basic component 들이 있으며, 이 외에도 custom component 를 만들어 사용할 수 있다.  
컴포넌트는 다음과 같이 클래스형, 함수형 두 가지가 존재한다.  
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
  
> react native 의 경우 리액트 훅의 useState 를 사용하면 함수형 컴포넌트에서도 State 를 사용할 수 있다.  
`import { useState } from 'react'` 로 import 하며, 형식은 다음과 같다.  
~~~typescript
// const [변수명, 변수를 변경할 set 함수] = useState<State의 타입>(초기값);
const [x, setX] = useState<Any>(initX);
~~~  
이렇게 만든 변수 x 는 값을 수정하지 못하며, setX 를 통하여 값을 변경하여야 한다.  
State 는 컴포넌트 내에서도 값을 변경할 수 있음에도 불구하고 이런 방식으로 값을 변경하도록 되어있는 이유는 State 의 변수값을 직접 변경하면서 발생할 수 있는 오류를 줄이고 리액트의 가상 DOM 을 활용하여 변경된 부분만 화면을 갱신하도록 하기 위해서라고 한다.  

  
# 2. Props 와 State
### Props, State 의 공통 특징
* 비동기적으로 업데이트될 수 있다.
* 데이터의 흐름은 상위 컴포넌트에서 하위 컴포넌트로만 향한다.
* 변경이 감지되면 render() 가 수행되어 변경 결과가 화면에 반영된다.  
  
  
### Props
Properties 의 약자로, 부모 컴포넌트로부터 자식 컴포넌트로 전달되는 데이터이다.  
자식 컴포넌트에서는 변경이 불가능하며, 이는 컴포넌트의 속성(Properties) 와 같음을 나타낸다.  
  
### State
한 컴포넌트 안에서 유동적인 데이터를 다룰 때 사용되며, 컴포넌트 내에서 데이터를 변경할 수 있다.  
즉, State 는 컴포넌트의 상태(State) 를 의미한다고 볼 수 있다.  
  


*내용 추가예정*

