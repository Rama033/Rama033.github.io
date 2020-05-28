---
layout: post
disqus_disabled: false
title: "[HTML5 & CSS3] CSS 와 cascading"
date: 2020-05-28T13:58:00+09:00
author: Jo
categories: html-css
tags: html html5 css css3 web design css style style-sheet cascading 
cover: "/assets/instacode.png"
---

## 1. Cascading Style Sheet(CSS)
### 1. Cascadnig 이란?
위에서 아래로 흐른다는 뜻으로, CSS 의 경우 스타일 시트에서 selector 에 여러 스타일이 적용될 때 스타일 충돌을 막기 위해 '위에서 아래로 흐르며 적용되는' 방법을 사용하는 것을 말한다.<br>
스타일 시트에서 캐스캐이딩은 가장 기본적인 개념이기 때문에 보통 스타일 시트라고 하면 Cascading Style Sheet(CSS) 를 의미한다.<br>
<br>

### 2. 캐스캐이딩의 원칙
  1. **스타일 우선순위**<br>
  스타일 규칙의 중요도, 적용 범위에 따라 우선순위가 결정되고, 그 우선순위에 따라 위에서 아래로 스타일이 적용된다.
  2. **스타일 상속**<br>
  태그들의 포함 관계에 따라 부모 요소의 스타일을 자식 요소로, 위에서 아래로 전달

#### 1. 스타일 우선 순위
##### 1. 중요도에 따라
<img src="/assets/img/css_cascading/css_priority.png">

dsf