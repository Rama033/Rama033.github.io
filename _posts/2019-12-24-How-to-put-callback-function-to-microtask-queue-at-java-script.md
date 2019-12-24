---
layout: post
title: "Java Script ¿¿¿ ¿¿ api ¿¿¿"
date: 2019-12-24T13:56:00+09:00
author: Jo
categories: java-script
tags: javascript java script callback microtask queue function
cover: "/assets/instacode.png"
---

Java script ¿ ¿¿ ¿¿¿¿¿ ¿¿ ¿¿¿ ¿¿ ¿¿¿ ¿¿¿¿ ¿¿ ¿¿¿¿¿ ¿¿¿ ¿¿¿ ¿¿¿.
¿¿¿¿ callback ¿¿¿¿ event queue(¿¿ callback queue, task queue ¿¿) ¿ enqueue ¿¿ call stack ¿ ¿¿ ¿¿ ¿¿¿ dequeue ¿¿ call stack ¿ ¿¿¿ ¿¿¿¿¿ ¿¿. (event queue ¿¿¿ microtask queue, job queue ¿¿¿ ¿¿¿¿ ¿¿¿ ¿¿¿ ¿¿¿¿ ¿¿¿ ¿¿¿¿ ¿¿.)

¿ ¿¿¿¿ ¿¿¿¿ ¿¿ ¿¿¿ ¿¿¿¿¿¿ ¿¿¿¿ Time, Ajax ¿¿ Web API ¿¿ ¿¿¿ ¿¿¿ ¿¿¿¿¿.
¿¿¿¿¿ ¿¿ callback ¿¿¿ ¿¿¿¿¿ event queue ¿ ¿¿¿¿¿ ¿¿¿ ¿ ¿¿¿ ¿ api ¿¿ ¿¿ ¿¿¿ ¿¿ enqueue ¿¿¿ ¿¿ ¿¿¿¿.
¿¿ microqueue¿ ¿¿¿ ¿¿¿¿¿¿ ¿¿¿¿¿ ¿¿¿ ¿¿¿.

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

¿¿ ¿¿ ¿¿ ¿¿ ¿¿ ¿¿¿¿ ¿¿ ¿¿¿ ¿¿ ¿¿¿ ¿¿¿.

~~~
foo
foofoo
bar
~~~

~~~javascript
function foo(callback) {
	console.log("foo");
	
	if (typeof callback == "function") {
		queueMicrotask(callback);
	}
}

function bar() {
	console.log("bar);
}


foo(function() {
	console.log("foofoo");
});

bar();
~~~

¿¿ ¿¿ callback()¿ ¿¿ ¿¿¿¿ ¿¿ queueMicrotask() ¿ ¿¿¿¿ callback ¿¿¿ microtask queue ¿ enqueue ¿ ¿¿ ¿¿¿¿ ¿¿ ¿¿¿ ¿¿¿.

~~~
foo
bar
foofoo
~~~

¿ ¿¿ ¿¿¿ foo() ¿¿ ¿¿¿ ¿¿ callback ¿¿¿ ¿¿¿¿¿ ¿¿¿ ¿¿ ¿¿¿¿¿ console.log("foofoo") ¿¿ ¿¿¿¿¿.
¿¿ ¿ ¿¿ ¿¿¿ queueMicrotask() ¿¿¿ ¿¿¿¿ callback ¿¿¿ microtask queue ¿ enqueue ¿¿¿ ¿¿¿ call stack ¿ ¿ ¿¿¿¿¿ ¿¿¿ ¿¿¿¿ ¿¿¿. ¿¿¿ ¿ ¿¿ bar() ¿¿¿¿ ¿ ¿¿¿¿ call stack ¿¿ ¿¿¿¿ ¿¿¿ ¿¿¿¿¿ dequeue ¿¿ foofoo ¿ ¿¿¿¿ ¿¿ ¿¿¿.

¿¿ ¿¿ ¿¿ ¿¿ microtask queue ¿ event queue, job queue ¿¿ ¿¿¿ ¿¿¿ ¿¿ ¿¿¿¿ ¿¿¿ ¿¿¿.
¿¿¿ ¿¿¿ ¿¿  ¿¿ ¿¿¿ ¿¿¿  ¿¿¿ ¿¿  ¿¿¿¿
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

¿¿¿ ¿¿¿ ¿¿

~~~
foo
bar
foofoo
foofoofoo
event queue
~~~

¿¿¿ microtask queue ¿ ¿¿ ¿¿¿ ¿¿ ¿ ¿¿¿ ¿ ¿¿¿¿ setTimeout ¿ ¿¿ event queue ¿ ¿¿¿ ¿¿¿ ¿¿¿¿ ¿¿ ¿ ¿ ¿¿. ¿ ¿¿ ¿¿¿ ¿ ¿¿¿ ¿¿¿ ¿¿¿¿¿ ¿ ¿¿¿¿...

microtask ¿ ¿¿¿ ¿¿, job ¿ ¿¿ ¿¿¿ microtask, event, job queue ¿ ¿¿ ¿¿ ¿¿¿ ¿¿ ¿¿¿ ¿¿ ¿¿¿¿ ¿¿¿ ¿ ¿¿¿ ¿ ¿¿.


ps. <http://latentflip.com/loupe>
¿ ¿¿¿¿ ¿¿¿¿ call stack ¿ web api, callback queue ¿ ¿¿ ¿¿¿ ¿¿¿¿ ¿ ¿¿¿¿¿ ¿¿¿ ¿ ¿¿.
