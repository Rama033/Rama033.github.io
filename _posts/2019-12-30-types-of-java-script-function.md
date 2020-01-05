---
layout: post
title: "자바 스크립트 함수 선언식, 함수 표현식, 익명 함수, 람다"
date: 2019-12-30T11:59:00+09:00
author: Jo
categories: java-script
tags: java-script function-declarations function-expressions anonymous-function arrow-function lambda lambda-expression 
cover: "/assets/instacode.png"
---

# 1. 함수 선언식
~~~javascript
// 매개변수 명시
function foo(arg1, arg2) {
	console.log(arg1 + arg2);
}  

// arguments[] 배열 사용
function bar() {
	console.log(arguments[0] + arguments[1]);
}

foo("Hello", "World");
bar("Good", "Bye");
~~~  

~~~
$ HelloWorld
$ GoodBye
~~~  

일반적인 스타일의 함수.  
함수 선언시 매개변수를 따로 명시하지 않아도 arguments[] 배열을 써서 매개변수 다룰 수 있다.  
  
# 2. 익명 함수
~~~javascript
// 콜백으로 전달
setTimeout(function() {
		console.log("Hello World!");
}, 0);
~~~

~~~
$ Hello World!
~~~  

이름 없는 함수.  
위에서와 같이 콜백으로 넘겨줄 때나 즉시 실행이 필요할 때 사용한다.  

# 3. 함수 표현식
~~~javascript
var foo = function(arg1, arg2) {
	console.log(arg1 + arg2);
}  

foo("Hello", "Everyone");
~~~  

~~~
$ HelloEveryone
~~~  

함수 리터럴로 생성한 함수를 변수에 할당하는 방식.  
익명함수인 `function(arg1, arg2) { console.log(arg1 + arg2); }` 를 변수 foo 를 통해서 호출한다.  

# 4. 화살표 함수 (람다 표현식)
~~~javascript
// 매개변수 없음
var foo = () => console.log('foo');  

// 매개변수 하나
var foo1 = arg => console.log(arg);  

//  매개변수 두개
var foo2 = (arg1, arg2) => console.log(arg1 + arg2);  

// 함수 여러줄
var foo3 = () => {
	console.log("Hello, World!");
	return "Good Bye!";
}
~~~  

ES6 부터 추가된 화살표 함수를 이용하여 람다 표현식을 나타낼 수 있다.
기본적으로 `()=>{}` 형태이며, 매개변수가 하나일 경우 () 를 생략할 수 있고 함수 내용이 한줄로 끝나면 {} 를 생략해도 된다.  
함수 선언, 표현식과는 다르게 arguments[] 배열을 사용할 수 없다.  

# + 함수 선언식과 호이스팅

자바스크립트에서 모든 변수 선언은 호이스팅 된다.  
여기서 호이스팅이란 코드에 선언된 변수 및 함수가 그 위치와는 상관없이 코드 상단으로 끌어올려지는 것을 말한다.  
따라서 자바스크립트에서는 코드 최하단에 선언해둔 변수도 코드 상단부에서 사용할 수 있다.  
호이스팅 될 때, 변수 선언은 할당과 분리된다. 변수 선언부만 코드 상단으로 끌어올려지고 할당은 그 자리에 그대로 남는다.  

이러한 원리로 함수 선언식 같은 경우 함수가 전부 호이스팅 되어 함수 선언 이전에도 해당 함수를 호출할 수 있다.  
하지만 함수 표현식, 화살표 함수 처럼 변수에 함수를 할당하는 경우에는 변수 선언만이 호이스팅 되고 함수의 할당은 그 자리에 남기 때문에 변수의 선언 및 함수 할당 부분 이전의 코드에서는 해당 함수를 호출할 수 없다.  
호이스팅으로 인해 함수 스코프가 꼬이고 문제가 발생하는 것을 막기 위해서 함수 선언식 보다는 표현식, 화살표 함수를 사용하는 것이 좋다고 한다.  


