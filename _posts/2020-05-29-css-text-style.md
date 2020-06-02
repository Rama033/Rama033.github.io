---
layout: post
disqus_disabled: false
title: "[HTML5 & CSS3] CSS 텍스트 스타일"
date: 2020-05-29T09:03:00+09:00
author: Jo
categories: html-css
tags: html html5 css css3 web design css style style-sheet text text-style
cover: "/assets/instacode.png"
---

## 1. 글꼴 관련 스타일 속성
<br>

### 1. font-family - 폰트 설정
~~~css
  body {
    font-family:'맑은 고딕', "돋움", 궁서;
  }
~~~
웹 문서에서 사용할 글꼴을 지정하는 속성이다.<br>
\<body\> 태그를 비롯해 \<p\>, \<h\> 태그처럼 텍스트를 사용하는 요소들에 적용할 수 있다.<br>
font-family 속성은 상속이 가능하기 때문에 \<body\> 에 적용시키면 문서 전체에 적용된다.<br>
지정한 글꼴이 없을 경우를 대비해 쉼표(,)로 구분해서 두 번째, 세 번째 글꼴까지 지정할 수 있다.<br>
또한 글꼴 이름이 두 개 이상의 단어로 이루어져 있을 경우 꼭 큰 따옴표(") 혹은 따옴표(') 로 묶어줘야 한다.<br>
한 개의 단어로 이루어져 있으면 해줘도 되고 안해줘도 된다.<br>
<br>

### 2. @font-face - 웹 폰트 설정
~~~html
<style>
  @font-face {
    font-family: 'trana'; /* 직접 준비한 폰트 이름 */
    src: local('trana'),
        url('trana.eot'),
        url('trana.woff') format('woff'),
        url('trana.ttf') format('truetype');
  }

  p {
    font-family: 'trana', sans-serif;
  }
</style>
~~~
@font-face 를 사용하면 웹 문서 안에 글꼴 정보도 함께 저장했다가 사용자가 웹 문서에 접속하면 글꼴을 사용자 시스템으로 다운로드시켜서 사용할 수 있다.<br>
위 예시 처럼 @font-face { ~ } 안에 font-family 속성으로 직접 준비한 폰트 이름을 지정하고, src 속성에 글꼴 정보를 넣어준다.<br>
src 속성의 맨 처음 것부터 차례대로 시도하게 되며, 따라서 가장 먼저 local() 함수로 사용자의 시스템에 이미 해당 글꼴이 있는지 확인한다.<br>
있을 경우에는 넘어가고, 없을 경우에는 url() 로 넣은 값을 다운로드 받아서 사용하게된다.<br>
<br>

### 3. 구글 웹 폰트
~~~html
<style>
  /* 구글 웹 폰트 주소 */
  @import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
  .my-font {
    font-family: 'Jeju Hallasan', cursive;
  }
</style>
<body>
  <p>기본 글꼴</p>
  <p>제주 한라산</p>
</body>
~~~
<style>
  /* 구글 웹 폰트 주소 */
  @import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
  .my-font {
    font-family: 'Jeju Hallasan', cursive;
  }
</style>
<body>
  <p>기본 글꼴</p>
  <p class="my-font">제주 한라산</p>
</body>

@font-face 를 사용해서 웹 폰트를 적용할 수도 있지만 구글 웹 폰트를 사용하면 더욱 간편하게 적용할 수 있다.<br>
@import url() 안에 구글 웹 폰트 주소를 넣으면 다른 처리를 해 줄 필요 없이 웹 개발자의 PC에 없는 폰트도 적용시킬 수 있다.<br>
<a href="https://fonts.google.com/earlyaccess">구글 웹 폰트</a>에 들어가서 원하는 폰트를 찾은 다음 link 를 import 하면 된다.<br>
아직 얼리엑세스라 폰트 종류가 많지는 않지만 매우 편리하게 사용할 수 있어서 좋다.<br>
<br>

### 4. font-size - 글자 크기
~~~css
font-size: <절대 크기> | <상대 크기> | <숫자> | <백분율>
~~~
이름 그대로 글자 크기를 조절하는 속성이다.<br>
절대 크기, 상대 크기, 숫자, 백분율 중 하나로 지정할 수 있으며, 기본 값은 절대 크기 medium 이다.<br>
font-size 속성은 상속 된다.<br>
* **절대 크기**: 브라우저에서 지정한 글자 크기. 다음 크기 중 선택
  * xx-smal
  * x-smal
  * small
  * medium
  * large
  * x-large
  * xx-large
* **상대 크기**: 부모 요소의 font-size 를 기준으로 더 크게, 또는 작게 표시. 다음 두 가지 중 선택
  * larger: 부모 요소보다 크게
  * smaller: 부모 요소보다 작게
* **숫자**: 글자 크기를 직접 지정. 단위는 다음과 같다
  * em: 해당 글꼴에서의 대문자 M의 너비를 기준으로 크기를 조절
  * ex: 해당 글꼴에서의 소문자 x의 높이를 기준으로 크기를 조절
  * px: 픽셀 단위. 모니터에 따라 상대적 크기가 됨.
  * pt: 포인트 단위. 일반 문서에서 많이 사용<br>
<br>
<br>

## 2. 텍스트 스타일
### 1. color - 글자 색
~~~html
<style>
  .color-test {
    color:rgb(0, 200, 0);
  }
</style>

<h2 class="color-test">글자 색 바꾸기</h2>
~~~
<style>
  .color-test {
    color:rgb(0, 200, 0);
  }
</style>

<h2 class="color-test">글자 색 바꾸기</h2>

16진수 값, rgb 값, hsl 값, 색상 이름 중 하나를 사용해서 글자의 색을 지정한다.<br>
<br>

### 2. text-decoration - 선 긋기
~~~html
<style>
  .deco-none {
    text-decoration: none;
  }
  .deco-underline {
    text-decoration: underline;
  }  
  .deco-overline {
    text-decoration: overline;
  }
  .deco-line-through {
    text-decoration: line-through;
  }
</style>

<p class="deco-none">아무것도 안함</p>
<p class="deco-underline">밑줄 표시</p>
<p class="deco-overline">윗줄 표시</p>
<p class="deco-line-through">취소선 표시</p>
~~~
<style>

  .deco-none {
    text-decoration: none;
  }
  .deco-underline {
    text-decoration: underline;
  }  
  .deco-overline {
    text-decoration: overline;
  }
  .deco-line-through {
    text-decoration: line-through;
  }
</style>

<p class="deco-none">아무것도 안함</p>
<p class="deco-underline">밑줄 표시</p>
<p class="deco-overline">윗줄 표시</p>
<p class="deco-line-through">취소선 표시</p>
<a href="https://www.google.com" class=".deco-none">밑줄 없는 하이퍼링크</a>

텍스트에 줄을 그을 때 사용하는 속성이다.<br>
none 은 쓸모가 없어보일 수도 있는데, 이 속성값을 사용해서 하이퍼링크의 밑줄을 없앨 수가 있다.<br>
<br>

### 3. text-shadow - 그림자 넣기
~~~html
<style>
  .shadow-test {
    /* 가로거리, 세로거리, 번짐정도, 색상 */
    text-shadow: 2px -3px 10px #f00;
  }
</style>

<p class="shadow-test">안녕하세요</p>
~~~
<style>
  .shadow-test {
    /* 가로거리, 세로거리, 번짐정도, 색상 */
    text-shadow: 2px -3px 10px #f00;
  }
</style>

<p class="shadow-test">안녕하세요</p>

텍스트에 그림자 효과를 추가해준다.<br>
속성값은 최대 네 개가 들어갈 수 있는데, 순서대로 가로거리, 세로거리, 번짐정도, 색상을 지정해주는 값이다.<br>
가로, 세로 거리는 필수 값이며, 나머지는 굳이 넣어주지 않아도 된다.<br>
<br>

### 4. white-space - 공백
~~~css
.normal {
  white-space: normal;
}
.nowrap {
  white-space: nowrap;
}
.pre {
  white-space: pre;
}
.pre-line {
  white-space: pre-line;
}
.pre-wrap {
  white-space: pre-wrap;
}
~~~

공백을 처리하는 방법을 지정할 수 있다.<br>
속성값은 다음과 같다.<br>
* **normal**: 연속하는 공백을 하나로 처리. default 값
* **nowrap**: 연속하는 공백을 하나로 처리하고, 줄을 바꾸지 않음
* **pre**: 연속하는 공백을 소스 그대로 표시하고, 소스에서 줄을 바꾼 부분만 줄바꿈을 표시하며 자동 줄바꿈은 안됨
* **pre-line**: 연속하는 공백은 하나로 취급하고, 소스에서 줄을 바꾼 부분은 줄바꿈을 표시하며 영역 너비 넘어간 부분 자동 줄바꿈 됨
* **pre-wrap**: 연속하는 공백을 소스 그대로 표시하고, 소스에서 줄을 바꾼 부분은 줄바꿈을 표시하며 영역 너비 넘어간 부분 자동 줄바꿈 됨<br>
<br>

### 5. letter-spacing, word-spacing - 글자, 단어사이 간격
~~~html
<style>
  .letter1 {
    letter-spacing: 0.2em;
  }
  .letter2 {
    letter-spacing: 1.0em;
  }

  .word1 {
    word-spacing: 0.5em;
  }
  .word2 {
    word-spacing: 3.0em;
  }
</style>

<p class="letter1">가나다라마바사</p>
<p class="letter2">가나다라마바사</p>
<p class="word1">가나다라 마바사</p>
<p class="word2">가나다라 마바사</p>
~~~
<style>
  .letter1 {
    letter-spacing: 0.2em;
  }
  .letter2 {
    letter-spacing: 1.0em;
  }

  .word1 {
    word-spacing: 0.5em;
  }
  .word2 {
    word-spacing: 3.0em;
  }
</style>

<p class="letter1">가나다라마바사</p>
<p class="letter2">가나다라마바사</p>
<p class="word1">가나다라 마바사</p>
<p class="word2">가나다라 마바사</p>

각각 자간과 어간을 조절한다.<br>