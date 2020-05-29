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

## 1. 글꼴 관련 스타일
<br>

### 1. font-family
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

### 2. @font-face
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


