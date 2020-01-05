---
layout: post
title: "자바 스크립트 비동기 콜백 함수 api 만들기"
date: 2019-12-24T13:56:00+09:00
author: Jo
categories: java-script
tags: java-script callback microtask microtask-queue function
cover: "/assets/instacode.png"
---

Java script 는 싱글 스레드로 작동한다고 하였는데 대체 어떻게 콜백 함수들은 비동기적으로 처리되는지 너무 궁금해져서 좀 찾아봤다.  


callback 함수는 setTimeout() 같은 비동기 함수 에 의해 event queue(또는 callback queue, task queue 라고도 함) 에 enqueue 되어 대기하다가 call stack 이 완전히 비었을 때 dequeue 되어 call stack 에 올라가 수행된다.  
call stack 이 비었을 때 queue 에서 꺼내와 call stack 에 올리는 것은 이벤트 루프에 의해서 수행된다.(event queue 외에도 microtask queue, job queue 등이 있어서 이벤트 루프가 실행하는 순서가 다르다고 한다.)  

그다음으로 궁금해진 것은 어떻게 하면 Time, Ajax 같은 Web API 처럼 callback 함수를 event queue 에 넣을수 있을까 였다.  
아직 event queue 에 enqueue 하는 방법은 못찾았고 대신 microtask queue 에 넣어 비동기적으로 처리할 수 있는 방법은 찾았다.  
(Web API 들에서 event queue 에 enqueue 하는 법은 모르겠지만 그냥 `setTimeout(function(){}, 0)` 이런 식으로 해서 event queue 에 넣어도 될 것 같다.)  

~~~javascript
function foo(callback) {
	console.log("foo");

	if (typeof callback == "function") {
		callback();
	}
}

function bar() {
	console.log("bar");
}


foo(function() {
	console.log("foofoo");
});

bar();
~~~

위의 코드의 결과는 다음과 같다.  

~~~
$ foo
$ foofoo
$ bar
~~~


비동기적인 처리 없이 순차적으로 수행된다.  

~~~javascript
function foo(callback) {
	console.log("foo");
	
	if (typeof callback == "function") {
		queueMicrotask(callback);
	}
}

function bar() {
	console.log("bar");
}


foo(function() {
	console.log("foofoo");
});

bar();
~~~

아까 전 코드처럼 callback() 을 바로 호출하는 대신, queueMicrotask() 를 호출하여 callback 함수를 microtask queue 에 enqueue 하면 다음과 같은 결과가 나온다.  

~~~
$ foo
$ bar
$ foofoo
~~~

먼저 foo 함수가 call stack 에 올라가 수행되어 "foo" 가 출력된다.  
그 다음 queueMicrotask() 가 호출되어 callback 함수를 microtask queue 에 enqueue 한다. 이 함수는 이제 call stack 이 완전히 비워질 때까지 대기하게 된다.  
foo 함수는 이제 더이상 callback 함수에 대해 신경 쓰지 않고 실행을 마친 후 call stack 에서 지워진다.  
바로 다음 줄로 넘어가 bar() 가 호출되어 "bar" 가 출력된 후 call stack 에서 bar 도 지워진다.  
이제 call stack 이 완전히 비었기 때문에 드디어 microtask queue 에서 callback 함수가 dequeue 되어 call stack 에 올라가고, "foofoo" 를 출력하게 된다.  


앞서 말한 것 처럼 microtask queue 와 event queue, job queue 는 이벤트 루프에 의해 수행되는 순서가 다르다고 한다.  
이것도 한번 실험해 보기 위해 다음과 같은 코드를 짜보았다. 여기서 foo() 는 queueMicrotask() 함수를 사용하는 버전이다.  

~~~javascript

setTimeout(function() {
	console.log("event queue");
}, 0);

foo(function() {
	console.log("foofoo");
});

foo(function() {
	console.log("foofoofoo");
});

bar();
~~~

이 코드를 실행하면

~~~
$ foo
$ bar
$ foofoo
$ foofoofoo
$ event queue
~~~

microtask queue 에 있는 작업들이 모두 다 수행된 다음에 event queue 에 있는 작업(setTimeout 의 콜백 함수)이 call stack 에 올라가 수행되는 것을 볼 수 있다.  
이처럼 microtask 는 일반 task (단순한 스크립트, event queue 에 들어가는 callback 등) 보다 높은 우선순위를 가지기 때문에 call stack 이 완전히 비워지면 먼저 microtask queue 에서 순서대로 dequeue 하여 실행하게 되고, call stack, microtask queue 모두가 비어있을 때에야 event queue 에서 dequeue 해서 수행한다.  


**ps.**  아래 사이트에 들어가면 call stack 과 web api, callback queue 가 어떻게 동작하는지 시각적으로 확인해볼 수 있다.  
<http://latentflip.com/loupe>  
