---
layout: post
disqus_disabled: false
title: "[HTML5 & CSS3] CSS 기초 및 주요 선택자"
date: 2020-06-02T17:00:00+09:00
author: Jo
categories: html-css
tags: html html5 css css3 web design css style style-sheet selector 
cover: "/assets/instacode.png"
---

## 1. 연결 선택자
selector 와 selector 를 연결해 적용 대상을 한정하는 selector<br>
combination selector 라고도 한다.<br>

### 1. Descendant Selector - 하위 선택자
~~~html
<head>
  <style>
    body h1.desc {
      color:darkgreen;
    }
  </style>
</head>
<body>
  <div id="parent">
    <h1 class="desc">하위 요소 1</h1>
    <div>
      <h1 class="desc">하위 요소 2</h1>
    </div>
  </div>
</body>
~~~
<head>
  <style>
    body h1.desc {
      color:darkgreen;
    }
  </style>
</head>
<body>
  <div id="parent">
    <h1 class="desc">하위 요소 1</h1>
    <div>
      <h1 class="desc">하위 요소 2</h1>
    </div>
  </div>
</body>

descendant selector 는 "상위 요소" "하위 요소" 의 형태로 정의한다.<br>
부모 요소에 포함된 모든 하위 요소에 스타일이 적용된다.<br>
자식의 자식, 손자의 손자 요소 등 "상위 요소" 에 포함되는 모든 "하위 요소"에 적용된다.<br>
<br>

### 2. Child Selector - 자식 선택자
~~~html
<head>
  <style>
    #parent>#child {
      color:brown;
    }
  </style>
</head>
<body>
  <div id="parent">
    <h2 id="child">자식요소</h2>
  </div>
</body>
~~~
<head>
  <style>
    #parent>#child {
      color:brown;
    }
  </style>
</head>
<body>
  <div id="parent">
    <h2 id="child">자식요소</h2>
  </div>
</body>

자식 요소에 스타일을 적용하는 selector 이다.<br>
두 요소 사이에 '>' 를 표시해 부모, 자식 요소를 구분한다.<br>
descendant selector 와 달리 바로 자식 요소에만 적용이 된다.<br>
<br>

### 3. Adjacent Sibling Selector - 인접 형제 선택자
~~~html
<style>
  h1 + h3 {
    color: rgb(200, 60, 60);
  }
</style>
<section id="parent">
  <h1>형</h1>
  <h3>동생 1</h3>
  <h3>동생 2</h3>
  <h3>동생 3</h3>
</section>
~~~
<style>
  h1 + h3 {
    color: rgb(200, 60, 60);
  }
</style>
<section id="parent">
  <h1>형</h1>
  <h3>동생 1</h3>
  <h3>동생 2</h3>
  <h3>동생 3</h3>
</section>

같은 부모를 가진 형제 요소 중 첫 번째 동생 요소에만 스타일을 적용시킨다.<br>
두 요소 사이에 '+' 를 넣어서 형과 동생을 구분한다.<br>
<br>

### 4. Attribute Selector - 속성 선택자
~~~html
<style>
  a.href[href] {
    background: yellow;
  }
  p.p[align] {
    color: rgb(200, 200, 0);
  }
</style>
<a class="href" href="https://www.google.com">링크</a>
<p class="p" align="center">지정한 속성 가진 요소에 적용</p>
~~~
<style>
  a.href[href] {
    background: yellow;
  }
  p.p[align] {
    color: rgb(200, 200, 0);
  }
</style>
<a class="href" href="https://www.google.com">링크</a>
<p class="p" align="center">지정한 속성 가진 요소에 적용</p>

대괄호([])로 지정한 속성을 가진 요소를 찾아서 스타일을 적용시킨다.<br>
속성값도 함께 지정하면 요소들중 속성값까지 일치하거나, 포함하는 경우에만 적용하게 할 수 있다.<br>
* **[attribute-name="value"]**: 속성값이 "value"와 정확히 일치
* **[attribute-name\|="value"]**: 속성값이 "value"와 일치하거나 "value-" 로 시작
* **[attribute-name~="value"]**: 속성값이 "value"를 포함. 단어 기준
* **[attribute-name*="value"]**: 속성값이 "value"를 포함.  문자열 기준
* **[attribute-name^="value"]**: 속성값이 "value"로 시작. 문자열 기준
* **[attribute-name$="value"]**: 속성값이 "value"로 끝. 문자열 기준
<br>
<br>

## Pseudo Class
Pseudo Class는 단순한 selector로는 표현할 수 없는 것을 선택하는 selector 이다.<br>
마우스를 올려놓았을 때, 클릭 했을 때 등 규칙에 따라 상태가 바뀌는 요소를 선택할 때 사용한다.<br>
<br>

### 1. Dynamic pseudo-class - 동작에 반응하는 가상 클래스
~~~html
<style>
  .navi a:link {
    color: #0000ff;
  }

  .navi a:visited {
    color: #ff0000;
  }

  .navi a:hover, .noavi a:focus {
    text-shadow: 0px 2px 2px #000;
    color: #00ff00;
  }

  .navi a:active {
    color: yellow;
  }
</style>

<nav class="navi">
  <ul>
    <li><a href="https://www.naver.com">네이버</a></li>
    <li><a href="https://www.daum.net">다음</a></li>
    <li><a href="https://www.nate.com">네이트</a></li>
  </ul>
</nav>
~~~
<style>
  .navi a:link {
    color: #ff0000;
  }

  .navi a:visited {
    color: #0000ff;
  }

  .navi a:hover, .noavi a:focus {
    text-shadow: 0px 2px 2px #000;
    color: #00ff00;
  }

  .navi a:active {
    color: yellow;
  }
</style>

<nav class="navi">
  <ul>
    <li><a href="https://www.naver.com">네이버</a></li>
    <li><a href="https://www.daum.net">다음</a></li>
    <li><a href="https://www.nate.com">네이트</a></li>
  </ul>
</nav>

* **:link**: 방문하지 않은 링크에 스타일 적용
* **:visited**: 방문한 링크에 적용
* **:active**: 웹 요소를 활성화했을 때 적용
* **:hover**: 웹 요소에 마우스 커서 올려놓을 때 적용
* **:focus**: 웹 요소에 초점이 맞춰졌을 때 적용<br>
<br>

### 2. UI Element states pseudo-class - UI 상태에 따른 가상 클래스
~~~html
<style>
  .name:disabled {
    background: #dddddd;
    border: 1px #cccccc solid;
  }

  .loc:checked + span {
    color: red;
  }
</style>
<label>
  상세 주소를 입력해 주세요
  <input class="name" type="text" disabled>
</label>

<label>
  <input class="loc" type="radio" name="loc-radio" value="seoul"><span>서울</span>
</label>
<label>
  <input class="loc" type="radio" name="loc-radio" value="gyeonggi"><span>경기</span>
</label>
<label>
  <input class="loc" type="radio" name="loc-radio" value="chungcheong"><span>충청</span>
</label>
<label>
  <input class="loc" type="radio" name="loc-radio" value="jeolla"><span>전라</span>
</label>
<label>
  <input class="loc" type="radio" name="loc-radio" value="gyeongsang"><span>경상</span>
</label>
<label>
  <input class="loc" type="radio" name="loc-radio" value="gangwon"><span>강원</span>
</label>
~~~
<style>
  .name:disabled {
    background: #dddddd;
    border: 1px #cccccc solid;
  }

  .loc:checked + span {
    color: red;
  }
</style>
<label>
  상세 주소를 입력해 주세요
  <input class="name" type="text" disabled>
</label>

<label>
  <input class="loc" type="radio" name="loc-radio" value="seoul"><span>서울</span>
</label>
<label>
  <input class="loc" type="radio" name="loc-radio" value="gyeonggi"><span>경기</span>
</label>
<label>
  <input class="loc" type="radio" name="loc-radio" value="chungcheong"><span>충청</span>
</label>
<label>
  <input class="loc" type="radio" name="loc-radio" value="jeolla"><span>전라</span>
</label>
<label>
  <input class="loc" type="radio" name="loc-radio" value="gyeongsang"><span>경상</span>
</label>
<label>
  <input class="loc" type="radio" name="loc-radio" value="gangwon"><span>강원</span>
</label>

* **:enabled**: 요소를 사용할 수 있을 때 스타일 적용
* **:disabled**: 요소를 사용할 수 없을 때 적용
* **checked**: 라디오 박스나 체크 박스에서 항목을 선택했을 때 적용<br>
<br>

### 3. Structural pseudo-class - 구조적 가상 클래스
~~~html
<style>
  table.structural tr:nth-child(2n+1) {
    background: lightgray;
    color:black;
  }
</style>

<table class="structural" border="1">
  <tr><td>미국</td></tr>
  <tr><td>영국</td></tr>
  <tr><td>독일</td></tr>
  <tr><td>프랑스</td></tr>
  <tr><td>캐나다</td></tr>
  <tr><td>일본</td></tr>
  <tr><td>이탈리아</td></tr>
</table>
~~~
<style>
  table.structural tr:nth-child(2n+1) {
    background: lightgray;
    color:black;
  }
</style>

<table class="structural" border="1">
  <tr><td>미국</td></tr>
  <tr><td>영국</td></tr>
  <tr><td>독일</td></tr>
  <tr><td>프랑스</td></tr>
  <tr><td>캐나다</td></tr>
  <tr><td>일본</td></tr>
  <tr><td>이탈리아</td></tr>
</table>

* **:nth-child(n)**: 앞에서부터 n 번째 자식 요소에 스타일 적용. 위치를 나타낼 때 an + b 처럼 수식을 사용할 수도 있으며, 이 때 n 값은 0부터 시작한다.
* **:nth-last-child(n)**: 뒤에서부터 n 번째 자식 요소에 적용
* **:first-child**: 첫 번째 자식 요소에 적용
* **:last-fhilcd**: 마지막 자식 요소에 적용
* **:first-of-type(n)**: 형제 요소들 중 첫 번째 요소에 적용
* **last-of-type(n)**: 형제 요소들 중 마지막 요소에 적용
* **:only-child**: 부모 요소 안에 자식 요소가 유일하게 하나만 존재할 때 적용
* **:only-of-type**: 자신이 유일한 요소일 때 적용<br>
<br>
<br>

## Pseudo Element
pseudo element 는 document tree 에 존재하지 않는 것을 생성할 때 사용한다.<br>
<br>

* **::first-line**: 특정 요소의 첫 번째 줄에 스타일 적용
* **::first-letter**: 특정 요소의 첫 번째 글자에 적용
* **::before**: 특정 요소의 앞에 지정한 내용을 추가
* **::after**: 특정 요소의 뒤에 지정한 내용을 추가<br>
