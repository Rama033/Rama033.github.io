---
layout: post
title: "React Native 컴포넌트, Props, State, Context - with TypeScript"
date: 2020-01-04T16:12:00+09:00
author: Jo
categories: react-native
tags: react-native typescript component props state context
cover: "/assets/instacode.png"
---

### 1. 컴포넌트
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
* 클래스 컴포넌트  

~~~typescript
// <Props, State> 는 생략해도 됨
class classComp extends React.Component<Props, State> {
  render() {
    return (
      <Text>Hello {this.props.name}</Text>
	);
  }
}
~~~  
컴포넌트 라이프사이클 API ([React Native 클래스 컴포넌트 라이프사이클 API - with TypeScript](https://sungunjo.github.io/react-native/2020/01/05/react-native-class-component-lifecycle.html) 참조) 를 사용하거나 state, props 를 사용할 수 있다.  
  
* 함수형 컴포넌트  

~~~typescript
// 함수 선언식으로 만들 수도 있고
function funcComp(props) {
  return (
    <Text>Hello, {props.name}</Text>		
  )
}

// 또는 화살표 함수 사용해서 만들수도 있다.
const arrowFuncComp = (props) => {
  return (
    <Text>Hello, {props.name}</Text>
  );
}
~~~  

클래스형 컴포넌트보다 상대적으로 가벼워 첫 마운팅 속도가 7~11% 빠르다고 한다.  
대신 클래스형과는 다르게 라이프사이클 API 나 state 를 사용할 수 없다.  
따라서 간단하게 props 만 넘겨줘서 처리할 수 있을 때 등의 경우에 사용하면 된다.  
(*React Hooks 을 사용하면 클래스 컴포넌트에서 할 수 있는 것들을 모두 동일하게 사용할 수 있다*)  
  
> react native 의 경우 리액트 훅의 useState 를 사용하면 함수형 컴포넌트에서도 State 를 사용할 수 있다.  
`import { useState } from 'react'` 로 import 하며, 형식은 다음과 같다.  
~~~typescript
// const [변수명, 변수를 변경할 set 함수] = useState<State의 타입>(초기값);
const [x, setX] = useState<Any>(initX);
~~~  
이렇게 만든 변수 x 는 값을 수정하지 못하며, setX 를 통하여 값을 변경하여야 한다.  
State 는 컴포넌트 내에서도 값을 변경할 수 있음에도 불구하고 이런 방식으로 값을 변경하도록 되어있는 이유는 State 의 변수값을 직접 변경하면서 발생할 수 있는 오류를 줄이고 리액트의 가상 DOM 을 활용하여 변경된 부분만 화면을 갱신하도록 하기 위해서라고 한다.  
  
> 리액트 네이티브의 버전 0.60 부터는 함수형 컴포넌트가 기본 컴포넌트가 되었다.  
이전까지는 함수형 컴포넌트에서 State 를 사용할 수 없다는 제약으로 인해 State 를 가지는 컴포넌트는 클래스형으로, 단순히 Props 받아서 화면에 표시하는 컴포넌트는 함수형으로 만들었다.  
그러다 React Hooks 가 등장하여 함수형 컴포넌트에서도 State 를 사용할 수 있게 되어 많은 사람들이 함수형 컴포넌트를 선호하기 시작하였고, 0.60.0 버전 부터는 아예 함수형 컴포넌트가 메인이 되었다.  
> > 리액트 훅은 위에서 살펴본 useState 를 포함하여 useEffect, useContext  등을 통하여 함수형 컴포넌트에서 사용할 수 없었던 State,  라이프사이클 API 등을 쓸 수 있게 해준다. 
  
  
### 2. Props 와 State
#### Props, State 의 공통 특징
* 비동기적으로 업데이트될 수 있다.
* 데이터의 흐름은 상위 컴포넌트에서 하위 컴포넌트로만 향한다.
* 변경이 감지되면 render() 가 수행되어 변경 결과가 화면에 반영된다.  
  
  
#### Props
Properties 의 약자로, 부모 컴포넌트로부터 자식 컴포넌트로 전달되는 데이터이다.  
자식 컴포넌트에서는 변경이 불가능하며, 이는 컴포넌트의 속성(Properties) 와 같음을 나타낸다.  
  
~~~typescript
interface Props {
  arg: string;
  func: () => void;
}

const Comp =  ({ arg, func }: Props) => {
  ...
}
~~~  
위의 예시와 같이 매개변수로 Props 를 받아와서 사용하면 된다.  
type script 에서는 실수를 막고 오류를 줄이기 위해서 위에서처럼 interface 를 사용하여 미리 Props 의 형식을 정의할 수 있다.

#### State
한 컴포넌트 안에서 유동적인 데이터를 다룰 때 사용되며, 컴포넌트 내에서 데이터를 변경할 수 있다.  
즉, State 는 컴포넌트의 상태(State) 를 의미한다고 볼 수 있다.  
클래스 컴포넌트의 경우에는 바로 사용할 수 있으며, 함수형 컴포넌트의 경우에는 앞서 설명한 바와 같이 useState 를 사용해야 한다.  
State 값을 변경하려면 setState 를 호출해야 한다.  

### 3. Context
Props 와 State 는 부모 컴포넌트와 자식 컴포넌트 또는 한 컴포넌트 내에서 데이터를 다룰 때 사용된다.  
따라서 이 둘을 사용하면 데이터가 부모 컴포넌트에서 자식 컴포넌트의 한 방향으로만 데이터가 흐른다.  
Context 는 이와 다르게 전역적으로 사용되는 데이터를 다루기 때문에 부모 -> 자식 컴포넌트의 데이터 흐름과 상관 없이 해당 데이터를 필요로 하는 컴포넌트에서 불러와서 사용할 수 있다.  