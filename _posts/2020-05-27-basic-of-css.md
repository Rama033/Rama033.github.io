---
layout: post
disqus_disabled: false
title: "[HTML5 & CSS3] CSS 기초 및 주요 선택자"
date: 2020-05-25T16:58:00+09:00
author: Jo
categories: html-css-summary
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

### 4. 내부/외부 스타일 시트
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
    ul { /* unordered list */
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
    ul { /* unordered list */
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
~~~
~~~html
<!-- test.html -->
~~~
universal selector