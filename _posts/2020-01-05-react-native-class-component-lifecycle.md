---
layout: post
title: "React Native 클래스 컴포넌트 라이프사이클 API - with TypeScript"
date: 2020-01-05T17:43:00+09:00
author: Jo
categories: react-native
tags: react-native typescript class-component compoent lifecycle
cover: "/assets/instacode.png"
---

클래스 컴포넌트는 함수형 컴포넌트와 달리 기본적으로 라이프 사이클 API 들이 있다.  

간단한 예제를 통해 어떤 API 들이 있고, 각각 어떠한 역할을 하는지 알아볼 것이다.  
다음은 인삿말, 이름을 Props 로 받아서 인삿말이 'Hello' 이면 "Hello, World! count is {count}" 를 출력하고 아닌 경우엔 "{인삿말}, {이름}! count is {count}" 를 출력하는 예제이다.  
텍스트를 터치하면 count 가 올라가며, count 가 5가 되면 터치를 해도 더이상 숫자가 올라가지 않는다.  
~~~TypeScript
import React from 'react';
import  { Text, SafeAreaView, TouchableOpacity } from 'react-native';

// Props interface 정의
interface Props {
	greetings?: string;
	initName: string;
}

// State interface 정의
interface State {
  name: string;
  count: number;
	error: Boolean;
}

// 클래스 컴포넌트
class HelloWorld extends React.Component<Props, State> {
  // 클래스 생성자
  constructor(props: Props) {
    super(props);
    console.log('constructor');

    this.state = {
      name: props.initName,
      count: 0,
      error: false,
    };
  }

  // 화면 렌더링 함수
  render() {
    console.log('render');

    const { greetings } = this.props;
    const { name, count, error } = this.state;

    return (
      <SafeAreaView>
        {!error && (
          <>
            <TouchableOpacity onPress={()=>{this.setState({ count: count + 1 })}}>
              <Text>{greetings}, {name}! count is {count}</Text>
            </TouchableOpacity>
          </>
        )}
      </SafeAreaView>
    );
  }

  // Props 와 State 동기화 함수
  static getDerivedStateFromProps(nextProps: Props, prevState: State) {
    console.log('getDerivedStateFromProps');
    if (nextProps.greetings === 'Hello') {
      return { name: 'World' };
    } else {
      return null;
    }
  }

  // 클래스 컴포넌트 마운트시 호출되는 함수
  componentDidMount() {
    console.log('componentDidMount');
  }

  // 리렌더링 여부 결정 함수
  shouldComponentUpdate(nextProps: Props, nextState: State) {
    console.log('shouldComponentUpdate');
    if (nextState.count > 6) {
      return false;
    } else {
      return true;
    }
  }

  // render 함수 호출시 화면 갱신 직전에 호출되는 함수
  getSnapshotBeforeUpdate(prevProps: Props, prevState: State) {
    console.log('getSnapshotBeforeUpdate');
    return {
      testData: true,
    };
  }

  // render 함수 호출시 getSnapshotBeforeUpdate 다음으로 호출되는 함수
  componentDidUpdate(nextProps: Props, prevState: State, snapshot: null) {
    console.log('componentDidUpdate');
    return true;
  }

  // 해당 컴포넌트가 unmount 될 때 호출되는 함수
  componentWillUnmount() {
    console.log('componentWillUnmount');
  }

  // 컴포넌트 렌더링에서의 예외 처리 함수
  componentDidCatch(error: Error, info: React.ErrorInfo) {
    this.setState({
      error: true,
    });
  }
}

export default HelloWorld;
~~~  

### 1. constructor()
~~~typescript
  constructor(props: Props) {
    super(props);
    console.log('constructor');

    this.state = {
      name: props.initName,
      count: 0,
      error: false,
    };
  }
~~~  
클래스 컴포넌트에서는 함수형과는 다르게 생성자가 존재한다. 다만 State 를 사용하지 않아서 초기값을 설정할 필요가 없다면 생략해도 된다.
생성자 함수에서는 항상 super(props) 를 사용하여 먼저 부모 컴포넌트인 React.Component 의 생성자를 호출해야 한다.  
또한 생성자 함수에서만 this.state 를 사용하여 state 의 값을 직접 지정할 수 있고, 나머지 부분에서는 this.setState 를 사용하여야 한다.  

### 2. render()
~~~typescript
  render() {
    console.log('render');

    const { greetings } = this.props;
    const { name, count, error } = this.state;

    return (
      <SafeAreaView>
        {!error && (
          <>
            <TouchableOpacity onPress={()=>{this.setState({ count: count + 1 })}}>
              <Text>{greetings}, {name}! count is {count}</Text>
            </TouchableOpacity>
          </>
        )}
      </SafeAreaView>
    );
  }
  ~~~  
render 함수는 클래스 컴포넌트가 렌더링 되는 부분을 정의한다.  
화면에 컴포넌트를 렌더링 할 때 이 함수가 호출되어 반환값이 화면에 표시되게 된다.  
render 함수는 부모로 부터 받은 Props 값이 변경되거나 this.setState 로 State 값이 변경되어 화면 갱신이 필요해지면 호출된다.  
따라서 render 함수에서 this.setState 로 State 값을 변경할 경우 무한 루프에 빠질 수도 있으므로 주의해야 한다.  

### 3. getDerivedStateFromProps()
  ~~~typescript
  static getDerivedStateFromProps(nextProps: Props, prevState: State) {
    console.log('getDerivedStateFromProps');
    if (nextProps.greetings === 'Hello') {
      return { name: 'World' };
    } else {
      return null;
    }
  }
  ~~~  
gerDerivedStateFromProps 함수는 Props 와 State 를 동기화 할 때 사용된다.  
부모로부터 받은 Props 값으로 State 값을 설정하거나, Props 값에 의존하여 State 값을 결정할 때 해당 함수에서 관련 로직을 짜주면 된다.  
로직에 따라 결정된 값을 반환하면 State 값이 설정된다.  
만약 동기화할 State 가 없을 경우나 생성자에서 설정한 값을 그대로 쓰고싶을 경우엔 null 을 반환하면 된다.  
이 함수는 컴포넌트가 생성될 때 한번 호출되어 동기화를 진행하고, 이후 Props 값이 변경될 때마다 호출하여 Props 와 State 간 동기화를 수행한다.  
이 예제에서는 Props 의 greetings 값이 만약 'Hello' 일 경우 State 의 name 을 'World' 로 바꾸도록 한다.  
그 외의 경우에는 null 을 리턴하여 initName 으로 생성자에서 설정한 name 값이 유지되도록 한다.  

### 4. componentDidMount()
  ~~~typescript
  componentDidMount() {
    console.log('componentDidMount');
  }
~~~  
componentDidMount 함수는 클래스 컴포넌트가 마운트된 후, 즉 화면에 처음 표시된 후에 딱 한번만 호출된다.  
따라서 ajax 를 통해 데이터를 읽어들이거나 다른 자바스크립트 라이브러리와 연동을 수행하기에 적합하다.  

### 5. shouldComponentUpdate()
~~~typescript
  shouldComponentUpdate(nextProps: Props, nextState: State) {
    console.log('shouldComponentUpdate');
    if (nextState.count > 6) {
      return false;
    } else {
      return true;
    }
  }
~~~  
shouldComponentUpdate 함수를 이용하여 렌더링을 제어할 수 있다.  
앞서 말한 바와 같이 클래스 컴포넌트는 Props 나 State 값이 변경될 경우 리렌더링 되는데, 이 함수를 사용하여 리렌더링 여부를 결정할 수가 있다.
이 함수에서 true 를 반환하면 리렌더링이 수행되고, false 를 반환하면 리렌더링을 하지 않는다.  
렌더링은 리액트 컴포넌트 중에 가장 비용을 많이 차지하는 부분이기 때문에 이를 이용하여 꼭 필요한 경우에만 렌더링을 하도록 하여 앱을 최적화할 수 있다.  
이 예제의 경우 State count 값이 6 이상이면 false 를 반환하여 더이상 리렌더링 하지 않도록 하였다.  
따라서 아무리 텍스트를 눌러봐도 count 값은 5 이상으로 증가하지 않는것 처럼 보이게 된다.  

### 6. getSnapshotBeforeUpdate()
~~~typescript
  getSnapshotBeforeUpdate(prevProps: Props, prevState: State) {
    console.log('getSnapshotBeforeUpdate');
    return {
      testData: true,
    };
  }
~~~  
getSnapshotBeforeUpdate 함수는 Props 또는 State 가 변경되어 화면을 다시 그리기 위해 render 함수가 호출된 후에 화면 갱신 직전에 호출된다.  
이 함수의 반환 값은 다음으로 호출되는 componentDidUpdate 함수의 세 번째 매개변수인 snapshot 으로 전달된다.  
잘 사용되지는 않으며, 주로 화면을 갱신하는 동안 수동으로 스크롤의 위치를 고정하는 경우 등에 사용한다고 한다.  

### 7. componentDidUpdate()
~~~typescript
  componentDidUpdate(nextProps: Props, prevState: State, snapshot: null) {
    console.log('componentDidUpdate');
    return true;
  }
  ~~~  
  componentDidUpdate 함수는 Props 또는 State 의 변경으로 화면 리렌더링 시 getSnapshotBeforeUpdate 함수 다음으로 호출된다.  
  컴포넌트가 처음 화면에 렌더링 될 때는 이 함수 대신 componentDidMount 함수가 호출되고, 그 이후로 렌더링이 발생할 때 componentDidMount 는 두 번 다시 호출되지 않고 componentDidUpdate 가 호출된다.  
  이 함수도 getSnapshotBeforeUpdate 와 마찬가지로 잘 사용되지는 않으며, getSnapshotBeforeUpdate 와 함께 사용해서 스크롤을 수동으로 고정시키거나 할 때 사용된다고 한다.  
  또한 render 와 마찬가지로 this.setState 를 이 안에서 호출했다가는 무한 루프에 빠질 수 있다.

### 8. componentWillUnmount()
~~~typescript
  componentWillUnmount() {
    console.log('componentWillUnmount');
  }
  ~~~  
componentWillUnmount 함수는 component 가 화면에서 완전히 사라진 후 호출된다.  
component 가 해제되는 과정에서 호출되기 때문에 보통 componentDidMount 에서 연동한 자바스크립트 라이브러리르 해제하거나 setTimeout, setInterval 등의 타이머를 각각 clearTimeout, clearInterval 로 해제할 때 사용된다.  
이 함수는 컴포넌트가 화면상에서 사라진 후 호출되기 때문에 여기서 this.setState 를 호출하면 갱신하려는 컴포넌트가 사라진 상태에서 리렌더링을 시도하게 되므로 메모리 leak 등의 문제가 발생할 수 있다.  

### 9. componentDidCatch()
  ~~~typescript
  componentDidCatch(error: Error, info: React.ErrorInfo) {
    this.setState({
      error: true,
    });
  }
  ~~~  
componentDidCatch 함수는 컴포넌트 렌더링 시의 예외 처리를 해주는 함수이다.  
render 함수의 return 부분에서 에러가 발생하면 componentDidCatch 함수가 실행된다.  
이 예제의 경우 render 함수에서 
~~~typescript
{!error && (
  <>
    <TouchableOpacity onPress={()=>{this.setState({ count: count + 1 })}}>
      <Text>{greetings}, {name}! count is {count}</Text>
    </TouchableOpacity>
  </>
)}
~~~  
위와 같이 error 가 false 일 경우에만 출력하도록 해두었다.  
componentDidCatch 함수가 호출되면 error 값이 true 로 바뀐 다음 리렌더링 되므로(this.setState 로 error 값을 변경하기 때문에 리렌더링아 수행된다) 문제가 발생한 경우 자식 컴포넌트를 표시하지 않음으로써 비정상 종료되는 것을 막을 수 있다.

### 라이프 사이클 API 호출 순서

* 컴포넌트 생성시: constructor -> getDerivedStateFromProps -> render -> componentDidMount  

* 컴프넌트의 Props 변경시: getDerivedStateFromProps -> shouldComponentUpdate -> render -> getSnapshotBeforeUpdate -> componentDidUpdate  

* 컴포넌트의 State 변경시: shouldComponentUpdate -> render -> getSnapshotBeforeUpdate -> componentDidUpdate  

* 컴포넌트 렌더링 중 에러 발생시: componentDidCatch  

* 컴포넌트 제거시: componentWillUnmount  

