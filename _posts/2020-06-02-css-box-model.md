---
layout: post
disqus_disabled: false
title: "[HTML5 & CSS3] CSS 박스 모델"
date: 2020-06-02T14:51:00+09:00
author: Jo
categories: html-css
tags: html html5 css css3 web design css style style-sheet box model box-model
cover: "/assets/instacode.png"
---
### 블록 레벨 요소
요소를 삽입했을 때 혼자 한 줄을 전부 차지하는 요소로, 다른 요소와 한 줄에 존재할 수 없다.<br>
ex) \<div\>, \<p\> 등<br>
<br>

### 인라인 레벨 요소
줄을 차지하지 않는 요소로, 표시되는 콘텐츠만큼의 영역만 차지하여 나머지 공간에는 다른 요소가 올 수 있다.<br>
ex) \<img\>, \<strong\>, \<span\> 등<br>
<br>

### 박스 모델
<img src="/assets/img/css_box_model/box_model.png">
CSS 에서 박스는 실제 콘텐츠가 들어가는 **contents**, 콘텐츠와 테두리 사이의 **padding**, 박스의 테두리인 **border**, 요소 간의 거리를 나타내는 **margin** 으로 구성되어있다.<br>
contents 영억은 width, height 속성으로 크기를 지정할 수 있으며, 나머지 영역은 padding, border, margin 을 속성으로 해서 각각 크기를 지정해줄 수 있다.<br>
<br>

#### width, height 속성
실제 콘텐츠 영역의 크기를 지정한다.<br>
박스의 전체 너비 = width + 좌우 padding + 좌우 border
박스의 전체 높이 = height + 상하 padding + 상하 border
* **<크기>**: 너비나 높이 값을 px, cm 등의 단위와 함께 수치로 지정
* **<백분율>**: 해당 박스를 포함하는 부모 요소를 기준으로 너비나 높이 값을 백분율로 지정
* **auto**: 콘텐츠 양에 따라 자동으로 결정. default 값<br>
<br>

#### display 속성
요소를 어떻게 표시할지에 대한 속성이다.<br>
주로 다음과 같은 속성값을 사용한다.<br>
* **block**: 해당 요소를 블록 레벨로 지정
* **inline**: 해당 요소를 인라인 레벨로 지정
* **inline-block**: 해당 요소를 인라인 레벨로 배치하지만, 내용에는 블록 레벨 속성을 지정
* **none**: 해당 요소를 화면에 표시하지 않고, 공간도 차지하지 않음<br>
<br>

이 외에도 다음과 같이 다양한 속성값을 사용할 수 있다.<br>
* **inherit**: 상위 요소의 display 속성을 상속받음
* **table**: 블록 레벨 표로 만듬
* **inline-table**: 인라인 레벨 표로 만듬 (\<table\> 처럼)
* **table-row**: 표의 행으로 만듬 (\<tr\> 처럼)
* **table-row-group**: 표의 행 그룹으로 만듬 (\<tbody\> 처럼)
* **table-header-group**: 표의 제목 영역 그룹으로 만듬 (\<thead\> 처럼)
* **table-footer-group**: 표의 요약 영역 그룹으로 만듬 (\<tfoot\> 처럼)
* **table-column**: 표의 열로 만듬 (\<col\> 처럼)
* **table-column-group**: 표의 열 그룹으로 만듬 (\<colgroup\> 처럼)
* **table-cell**: 표에서 하나의 셀로 만듬 (\<td\> 나 \<th\> 처럼)
* **table-caption**: 표의 캡션으로 만듬 (\<caption\> 처럼)
* **list-item**: 목록의 항목을 표시할 수 있도록 기본적인 블록 박스(항목의 내용 표시되는 부분) 과 표시자 박스(불릿이 표시되는 부분) 을 만듬 (\<li\> 처럼)<br>
<br>