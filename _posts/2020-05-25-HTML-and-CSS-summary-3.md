---
layout: post
disqus_disabled: false
title: "[HTML5 & CSS3] 웹 공부 내용 정리 3 - 이미지와 하이퍼링크"
date: 2020-05-25T16:58:00+09:00
author: Jo
categories: html-css-summary
tags: html html5 css css3 web image img hyperlink 
cover: "/assets/instacode.png"
---

## 1. 이미지
웹에서는 gif, jpg/jpef, png 세 종류의 이미지 파일만 사용할 수 있다.  
먼저 gif 같은 경우 최대 256 의 색상까지 밖에 표현할 수 없지만 대신 파일 사이즈가 작아서 아이콘, 불릿 등으로 많이 사용된다.  
사진의 경우에는 더 많은 색상수를 표현할 수 있어야 하기 때문에 jpg/jpeg, png 를 주로 사용한다.  
특히 png 의 경우 투명 배경이 가능해서 웹에서 많이 사용된다.  
<br>

### 1. \<img\> 태그 - 이미지 삽입
~~~html
<img src="/img/road_image.jpg" alt="도로 사진" width="50%">
~~~
<img src="/img/road_image.jpg" alt="도로 사진" width="50%">

\<img\> 태그를 사용해서 웹 페이지에 이미지 파일을 삽입할 수 있다.  
다음과 같이 속성값을 지정해서 이미지 파일 경로, 대체 텍스트, 이미지 크기 지정을 할 수 있다.  

* src: 이미지 파일 경로
- 웹 문서 파일의 위치를 기준으로 이미지 경로를 지정
- 웹 사이트에 있는 이미지도 주소를 알아내서 src 속성값으로 사용할 수 있음

* alt: 이미지를 설명하는 대체 텍스트
- 대체 텍스트를 화면 낭독기가 읽어줌 (웹 접근성 향상)
- 이미지를 표시할 수 없는 경우 대신 대체 텍스트를 표시

* width, height: 이미지 크기 조정
- 속성 사용 안하면 원래 이미지 크기대로 표시
- 속성 사용해서 화면 이미지 크기를 조절할 수 있지만, 파일의 용량은 변하지 않는다.  
<br>

### 2. \<figure\>, \<figcaption\> - 이미지 캡션(설명글) 추가
~~~html
<figure>
  <img src="/img/road_image.jpg" alt="도로 사진" width="50%">
  <figcaption>도로 사진입니다.</figcaption>
</figure>
~~~
<figure>
  <img src="/img/road_image.jpg" alt="도로 사진" width="50%">
  <figcaption>도로 사진입니다.</figcaption>
</figure>

\<figure\> 태그는 표나 동영상, 이미지 등 특정한 캡션을 붙일 수 있는 영역을 만들어주는 태그인데, 테이블에 캡션을 달아줄 때와 마찬가지로 이미지 전체를 \<figure\> ~ \</figure\> 태그로 묶어준 다음 캡션을 붙이고 싶은 위치에 \<figcaption\> 태그를 넣어서 캡션을 달아줄 수 있다.  
\<figcaption\> 태그는 alt 속성처럼 화면 낭독기가 읽어줄 수 있다. 이미지를 표시 못하는 상황에서 \<figcpation\> 태그의 캡션을 대체 텍스트로 표시해주는 것도 alt 속성과 동일하다.  
<br>
<br>

## 2. 하이퍼링크
* 다른 문서, 혹은 다른 사이트로 바로 연결해 주는 기능

* 외부 사이트나 외부 페이지로도 연결할 수 있음

* 메뉴 뿐만 아니라 원하는 곳에 링크를 만들 수 있음
<br>

### 1. \<a\> 태그 - 하이퍼링크 생성
~~~html
<!-- 텍스트에 링크 생성 -->
<a href="https://www.google.com" target="_blank" >
~~~
====

Anchor, Hyper reference
<a> 태그, href 속성
<a href="링크할 주소" [속성="속성 값"]> 텍스트 </a>				-> 텍스트에 링크 생성
<a href="링크할 주소" [송성="속성 값"]><img src="이미지 파일 경로> </a>		-> 이미지에 링크 생ㅅ엉
반드시 href 송성 함게 사용해서 어던 대상으로 연결하느닞 알려줘야함

속성:
* href 링크한 문서나 사이트 주소 입력
* target 링크한 내용이 표시될 위치(현재 창 또는 새 창) 지정
* download 링크한 내용 보여주는것이 안리ㅏ 다운로드
* rel 현재 문서와 링크한 문서의 고나계 안려줌
* hreflang 링크한 문서의 언어를 지정
* type 링크한 문서의 파이ㄹ 유형 알려줌


ㅅtarget 속성 -
다른 사이트로 링크하거나 현재 페이지 유지한 상태에서 링크 페이지 표시할 때

현재 페이지는 그대로 유지하면서 새 창ㅇ이나 새 탭에 표시

사용할 수 있는 값
_blank 링크 내ㅛㅇ이 새 창이나 새 탭에서 열림
_self target 속성의 기본값으로, 링크가 있느 화면에서 열림
_parent 프레임을 사용햇ㅇㄹ 때 링크 내용을 부모 프레임에 표시
_top 프레임을 사용햇을 때 프레임을 벗어나 링크 내용으 ㄹㅊ전체화면에 표시


한 페이지 안에서 점프ㄱ하기 - 앵커
앵커 사용하려면 우선 이동하고 싶은 위치마다 id 속성을 이용해 앵커를 만듬

a 태그의 href 송성 사용해서 링크함
단 앵커 이름 앞에 # 붙여 앵커 표시
<태그 id="앵커 이름"> 텍스트 또는이미ㅣ</태그
<a href ="#앵커이름"> txt or img < /a>





<area> 태그, usemap 속성 - 이미지맵
이미지맵: 한 이미지상에 여러 다른 링크 만드는 것
<map name="맵이름>
  <area>
  <area>
</map>

<img src="이미지파일" usemap="#맵이름">


alt 대체 텍스트 지정
coords 링크로 사용할 영역을 시작 좌표, 끝 좌표를 이ㅣ용해 지정
download 링크 클릭시 링크 문서 다운
href 링크 문서 경로 지정
media 링크 문서를 어떤 미디어에 최적화시킬지 지정
rel 현재 문서와 링크 문서 사이 관계 지정 - iternate, bookmark, help license next, nofollow noreferer prefetch prev search tag
shape 링크로 사용할 영역의 형태를 지정 - default rect circle poly
target 링크를 표시할 대상을 지정 - _blank, _parent, _self _top, 프레임 이름
type 링크 문서의 미디어 유형을 지정