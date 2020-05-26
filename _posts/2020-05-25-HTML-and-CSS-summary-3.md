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
<img src="/assets/img/road_image.jpg" alt="도로 사진" width="50%" id="road_img">
~~~
<img src="/assets/img/road_image.jpg" alt="도로 사진" width="50%">

\<img\> 태그를 사용해서 웹 페이지에 이미지 파일을 삽입할 수 있다.  
다음과 같이 속성값을 지정해서 이미지 파일 경로, 대체 텍스트, 이미지 크기 지정을 할 수 있다.  

* **src**: **s**ou**rc**e. 이미지 파일 경로
- 웹 문서 파일의 위치를 기준으로 이미지 경로를 지정
- 웹 사이트에 있는 이미지도 주소를 알아내서 src 속성값으로 사용할 수 있음

* **alt**: **alt**ernative. 이미지를 설명하는 대체 텍스트
- 대체 텍스트를 화면 낭독기가 읽어줌 (웹 접근성 향상)
- 이미지를 표시할 수 없는 경우 대신 대체 텍스트를 표시

* **width, height**: 이미지 크기 조정
- 속성 사용 안하면 원래 이미지 크기대로 표시
- 속성 사용해서 화면 이미지 크기를 조절할 수 있지만, 파일의 용량은 변하지 않는다.  
<br>

### 2. \<figure\>, \<figcaption\> - 이미지 캡션(설명글) 추가
~~~html
<figure>
  <img src="/assets/img/road_image.jpg" alt="도로 사진" width="50%">
  <figcaption>도로 사진입니다.</figcaption>
</figure>
~~~
<figure>
  <img src="/assets/img/road_image.jpg" alt="도로 사진" width="50%">
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
<a href="https://www.google.com" target="_blank"><p>텍스트 링크</p></a>
<!-- 이미지에 링크 생성 -->
<a href="https://www.google.com" target="_top"><img src="/assets/img/road_image.jpg"></a>
~~~
<a href="https://www.google.com" target="_blank"><p>텍스트 링크</p></a>

<a href="https://www.google.com" target="_top"><img src="/assets/img/road_image.jpg"></a>

**A**nchor 의 약자로, 다른 요소에 하이퍼링크를 만들어줄 수 있다.  
\<a href="링크 주소"\> ~ \</a\> 사이에 텍스트나 이미지등 다른 요소를 넣으면 href 속성에 넣은 주소의 하이퍼링크가 생긴다.  
\<a\> 태그에서 사용할 수 있는 속성은 다음과 같다.  

* **href**: **h**yper **r**eference. 링크할 문서나 사이트 주소 지정
- \<a\> 태그를 사용할 때 href 속성을 꼭 넣어줘야 링크를 사용할 수 있다.  

* **target**: 링크한 내용이 표시될 위치(현재 창 또는 새 창 등) 지정
- 다음과 같은 속성값을 사용할 수 있다. 
  **_self**: target 속성의 기본값으로, 링크가 있는 화면 (현재 창) 에서 열림
  **_blank**: 링크 내용이 새 창이나 새 탭에서 열림
  **_parent**: 프레임을 사용했을 때 링크 내용을 부모 프레임에 표시
  **_top**: 프레임을 사용했을 때 링크가 있는 프레임을 벗어나 링크 내용을 전체화면에 표시

- _blank, _parent, _self, _top, 프레임 이름
* **download**: 링크한 내용을 화면에 표시하는 대신에 다운로드

* **rel**: **rel**ationship. 현재 문서와 링크한 문서의 관계를 알려줌
- 다음과 같은 속성값 사용 가능
  **iternate, bookmark, help, license, next, nofollow, noreferer, prefetch, prev, search, tag**  

* **hreflang**: **h**yper **ref**erence **lang**uage. 링크한 문서의 언어를 지정

* **type**: 링크한 문서의 파일 유형을 알려줌

* **media**: 링크 문서를 어떤 미디어에 최적화시킬지 지정

> 한 페이지 안에서 점프하기 - 앵커  
\<a\> 를 이용한 링크는 외부 문서뿐만 아니라 같은 문서 내의 다른 태그로도 이동할 수 있다.  
이러한 경우에는 주소 대신 이동하고 싶은 태그의 id 속성값을 넣어주는데, id 값 앞에 # 을 붙여줘야 한다.  
~~~html
<a href="#road_img"><p>도로 사진으로 이동</p></a>
~~~
<a href="#road_img"><p>도로 사진으로 이동</p></a>  
<br>

### 2. \<map\>, \<area\> 태그, usemap 속성 - 이미지맵
~~~html
<img src="/assets/img/road_image.jpg" usemap="#my_map">
<map name="my_usemap">
  <area shape="rect" coords="10, 10, 100, 100" href="https://www.google.com" target="_blank">
  <area shape="circle" coords="100, 100, 200, 200" href="https://www.naver.com" target="_blank">
</map>
~~~
<img src="/assets/img/road_image.jpg" usemap="#my_usemap">
<map name="my_map">
  <area shape="rect" coords="10, 10, 100, 100" href="https://www.google.com" target="_blank">
  <area shape="circle" coords="100, 100, 200, 200" href="https://www.naver.com" target="_blank">
</map>

\<map\>, \<area\> 태그와 usemap 속성을 이용하여 이미지맵 (한 이미지상에 링크 있는 것) 을 만들 수 있다.  
먼저 \<map\> ~ \</map\> 사이에 \<area\> 태그를 넣어서 맵을 만들어 준다.  
\<map\> 의 속성으로는 name="맵이름" 을 넣어줘야 하고, \<area\> 에는 다음과 같은 속성들을 이용하여 이미지상 원하는 위치에 원하는 형태, 크기로 링크를 걸어줄 수 있다.  

* **alt**: **alt**ernative. 대체 텍스트 지정

* **coords**: **coord**inate**s**. 링크로 사용할 영역의 시작 좌표, 끝 좌표 지정

* **shape**: 링크로 사용할 영역의 형태를 지정 
- 속성값으로 **default, rect, circle, poly** 사용 가능  

이 외에도 href, type 등 \<a\> 태그의 속성 사용해서 하이퍼링크의 속성을 지정해줄 수 있다.  
다음으로 \<img\> 에 속성으로 usemap="#맵이름" 을 넣어주면 해당 이름을 가진 맵을 이미지맵으로 사용한다.  
이 때 맵 이름의 앞에 #을 붙여줘야 한다.  