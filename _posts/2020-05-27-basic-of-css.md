---
layout: post
disqus_disabled: false
title: "[HTML5 & CSS3] CSS 기초 및 주요 선택자"
date: 2020-05-25T16:58:00+09:00
author: Jo
categories: html-css
tags: html html5 css css3 web design css style style-sheet selector 
cover: "/assets/instacode.png"
---

## 1. 스타일과 스타일 시트

### 1. 스타일? 스타일 시트?
* style: HTML 문서에서 자주 사용하는 글꼴, 색상, 정렬, 요소 배치 방법 등 문서 디자인에 대한 내용
<br>

* style sheet: 스타일들을 관리하기 쉽도록 모아둔 시트
<br>
<br>

### 2. 스타일을 사용하는 이유
style 을 사용함으로써 내용(HTML) 과 디자인(CSS) 을 분리해 디자인에 영향 없이 내용을 수정하거나, 내용은 건드리지 않고 디자인만 바꿀 수 있다.<br>
또한 내용은 동일한 상태로 프린터나 스마트폰 브라우저 등 다양한 기기에 맞는 레이아웃을 만들어 기기에 맞춰 탄력적으로 바뀌는 문서를 만들 수 있다.<br>
<br>
<br>

### 3. 스타일 사용 방법
~~~css
/* 'selector' { 'style attribute': 'attribute value';} */
p { text-align: center; }
~~~
* **selector**: { 와 } 사이에 정의한 스타일 규칙의 적용 대상. 위 예시의 경우는 \<p\> 태그
* **속성**과 **속성 값**: '속성: 속성값;' 형식으로 표현
<br>
<br>

### 4. 스타일 시트
스타일 시트는 HTML 문서 안에 함께 포함할 수도 있고 (내부 스타일 시트), 별도 CSS 파일로 분리되어 있을 수도 있다 (외부 스타일 시트).<br>

#### a. 내부 스타일 시트
~~~html
<!-- test.html -->
<head>
  <meta charset="utf-8">
  <title>내부 스타일 시트</title>
  <style>
    h1 { /* header 1 */
      color:red; /* 글자색: 빨강 */
    }
    ul.myUl { /* unordered list */
      color:blue; /* 글자색: 파랑 */
      list-style-type:squre; /* 불릿 형태: square */
    }
  </style>
</head>
<body>
  <h1>내부 스타일 시트 연습</h1>
  <ul>
    <li>안녕하세요</li>
    <li>Hello</li>
    <li>Здравствуйте</li>
  </ul>
</body>
~~~
<head>
  <meta charset="utf-8">
  <title>내부 스타일 시트</title>
  <style>
    h1 { /* header 1 */
      color:red; /* 글자색: 빨강 */
    }
    ul.myUl { /* unordered list */
      color:blue; /* 글자색: 파랑 */
      list-style-type:squre; /* 불릿 형태: square */
    }
  </style>
</head>
<body>
  <h1>내부 스타일 시트 연습</h1>
  <ul>
    <li>안녕하세요</li>
    <li>Hello</li>
    <li>Здравствуйте</li>
  </ul>
</body>

웹 문서 안에서 사용할 스타일들을 같은 문서 안에 정리해둔 것이다.<br>
모든 스타일 정보는 \<head\> ~ \</head\> 사이에 \<style\> ~ \<style\> 태그를 넣고, 그 안에 작성한다.<br>

#### b. 외부 스타일 시트
~~~css
/* stylesheet_test.css*/
ul {
  color:blue;
  list-style-type:square;
}
~~~
~~~html
<!-- test.html -->
<head>
  <meta charset="utf-8">
  <title>내부 스타일 시트</title>
  <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <ul>
    <li>내부</li>
    <li>스타일</li>
    <li>시트</li>
  </ul>
</body>
~~~

여러 웹 문서에서 사용할 스타일을 별도 파일로 저장해 놓고 필요할 때마다 파일에서 링크해서 사용하는 방법이다.<br>
\<style\> 태그 없이 \<link\> 태그를 사용해 미리 만들어둔 외부 스타일 시트 파일을 연결해서 해당 파일 내의 스타일들을 사용한다.<br>
<br>
<br>

### 5. 인라인 스타일
~~~html
<body>
  <h1>인라인 스타일</h1>
  <p style="color:red;">인라인 스타일 이용한 빨간색 글씨</p>
  <p>일반 글씨</p>
</body>
~~~

인라인 스타일을 사용하면 스타일 시트 없이 적용할 대상에 직접 표시해줄 수 있다.<br>
스타일을 적용할 태그에 style 속성을 사용해 
~~~html
<태그 style="속성: 속성 값;">
~~~
형태로 값을 줘서 적용할 수 있다.<br>
<br>
<br>

## 2. 주요 selector
### 1. Universal Selector - 전체 선택자
~~~css
* {
  margin:0;
  padding:0;
}
~~~

Universal selector 는 모든 HTML 요소를 선택해서 스타일을 적용시킨다.<br>
주로 다른 selector 와 함께 모든 하위 요소에 한꺼번에 스타일을 적용하려 할 때 사용한다.<br>
<br>

### 2. Type Selector - 태그 선택자
~~~css
h2 {
  color:blue;
}
p {
  font-size:12px;
  margin-left:20px;
  color:red;
}
~~~

Type selector 는 특정 태그를 사용한 모든 요소에 스타일을 적용시킨다.<br>
위의 예시 같은 경우 \<h2\> 요소들은 전부 파란색이 되고, \<p\> 요소들은 12포인트, 좌측 마진 20, 빨간색이 된다.<br>
<br>

### 3. Class Selector - 클래스 선택자
~~~html
<head>
  <title>클래스 선택자</title>
  <style>
    h1.class1 {
      color:blue;
    }
    .class2 {
      color:red;
    }
  </style>
</head>
<body>
  <h1>그냥 h1</h1>
  <h1 class="class1">h1 class1</h1>
  <h1 class="class2">h1 class2</h1>
  <p>그냥 p</p>
  <p class="class1">p class1</p>
  <p class="class2">p class2</p>
</body>
~~~
<head>
  <title>클래스 선택자</title>
  <style>
    h2.class1 {
      color:blue;
    }
    .class2 {
      color:red;
    }
  </style>
</head>
<body>
  <h2>h2</h2>
  <h2 class="class1">h2 class1</h2>
  <h2 class="class2">h2 class2</h2>
  <p>p</p>
  <p class="class1">p class1</p>
  <p class="class2">p class2</p>
</body>

class selector 는 특정 태그 중에서도 일부에만 스타일을 적용할 수 있다.<br>
태그."클래스 이름" 형식으로 사용하며, 해당 태그 중에서도 class 속성이 "클래스 이름" 인 요소들에만 스타일을 적용하겠다는 뜻이다.<br>
태그를 쓰지 않고 ."클래스 이름" 만 쓰는 경우에는 모든 태그 타입 중에서 "클래스 이름" 을 class 속성 값으로 가지는 요소들에 적용할 수 있다.<br>
<br>

### 4. id Selector - 아이디 선택자
~~~html
<head>
  <title>아이디 선택자</title>
  <style>
    #hello {
      color:yellow;
    }
    #world {
      color:brown;
    }
  </style>
</head>
<body>
  <h1 id="hello">Hello</h1>
  <h2 id="world">World!</h2>
</body>
~~~
<head>
  <title>아이디 선택자</title>
  <style>
    #hello {
      color:yellow;
    }
    #world {
      color:brown;
    }
  </style>
</head>
<body>
  <h1 id="hello">Hello</h1>
  <h2 id="world">World!</h2>
</body>

id selector 는 요소의 id 속성값을 가지고 선택적으로 스타일을 적용해준다.<br>
#"id 값" 을 selector 로 사용하면 되며, 이렇게 만든 스타일은 해당 "id 값" 을 id 속성값으로 가지는 요소에 대해서만 스타일을 적용한다.<br>
만약 동일한 id 값 가지는 요소가 여러개라면 해당 요소들 전부에 스타일이 적용되겠지만, 서로 다른 요소에 대해 동일한 id 값을 사용하는것은 좋지 않기 때문에 보통 문서 내에서 한 번만 사용되는 스타일에 대해서 id selector 를 쓴다.<br>
<br>

### 4. Group Selector - 그룹 선택자
~~~html
<head>
  <title>그룹 선택자</title>
  <style>
    h5, h6, h4.myH4 {
      color:yellow;
    }
  </style>
</head>
<body>
  <h4 class="myH4">Group Selector Test</h4>
  <h5 id="hello">Hello</h1>
  <h6 id="world">World!</h2>
</body>
~~~
<head>
  <title>그룹 선택자</title>
  <style>
    h5, h6, h4.myH4 {
      color:cyan;
    }
  </style>
</head>
<body>
  <h4 class="myH4">Group Selector Test</h4>
  <h5>Hello</h5>
  <h6>World!</h6>
</body>

여러개의 selector 들에 대해 동일한 스타일을 적용해 주고 싶다면 group selector 를 사용하면 된다.<br>
위 예시와 같이 selector 들을 콤마(,) 로 구분해서 나열해주면 되며, 서로 다른 selector 타입을 섞어서 사용해도 된다.<br>