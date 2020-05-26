---
layout: post
disqus_disabled: false
title: "[HTML5 & CSS3] Form 과 input"
date: 2020-05-25T16:58:00+09:00
author: Jo
categories: html-css-summary
tags: html html5 css css3 web form input tag
cover: "/assets/instacode.png"
---

## 1. Form
* 사용자가 웹 사이트로 정보를 보낼 수 있는 요소들은 모두 form<br>

* 폼과 관련된 대부분의 작업들은 정보를 저장, 검색, 수정 하는 일<br>

* 이런 작업은 모두 DB 를 기반으로 함<br>

* 아이디를 입력하는 text field, button 같은 form 의 형태를 만드는 것은 HTML tag,<br>
form 에 입력한 사용자 정보를 처리하는 것은 ASP, PHP 등의 서버<br>
<br>
<br>

### 1. \<form\> 태그 - 폼 생성
~~~html
<!-- 기본 형태 -->
<form> ...form 요소... </form>

<!-- 텍스트 입력창 예시 -->
<form action="/assets/etc/input_test.php" method="post">
  <input type="text" title="입력" name="input">
  <input type="submit" value="입력">
</form>
~~~
<form action="/assets/etc/input_test.php" method="post" name="input">
  <input type="text" title="입력" name="input">
  <input type="submit" value="입력" name="input">
</form>

form을 만드는 기본 태그.<br>
\<form\> ~ \</form\> 사이에 원하는 form 요소를 삽입하여 폼을 만들 수 있다.<br>
\<form\> 태그에서는 다음과 같은 속성들을 사용한다.<br>
* **method**: 사용자가 입력한 내용들을 어떤 방식으로 서버쪽에 넘겨줄지 지정<br>
    * **get**: 사용자가 입력한 내용이 주소 표시줄에 그대로 나타남<br>
    256~4096 byte까지만 전송 가능
    * **post**: 사용자의 입력을 standard input 으로 넘겨주어 입력 길이 제한이 없고, 입력 내용도 드러나지 않음<br>

* **name**: form 의 이름을 지정. 한 문서 내에 \<form\> 태그가 여러개 있을 경우 구분하기 위해 사용<br>

* **action**: \<form\> 태그 안의 내용들을 처리해줄 서버 상의 프로그램을 지정<br>

* **target**: \<action\> 태그에서 지정한 스크립트 파일을 열 위치를 지정<br>
속성값은 \<a\> 의 target 옵션과 동일<br>
<br>

위의 텍스트 입력창 예시의 경우<br>
1. 입력한 내용이 웹 서버의 input.php 파일로 전송<br>
2. 서버에서 input_test.php 파일을 실행<br>
3. 실행 결과를 웹브라우저로 전달<br>
4. 결과를 화면에 표시<br>

와 같은 과정을 거치게 된다
<br>
<br>

### 2. \<label\> 태그 - 레이블 생성
~~~html
<!-- 레이블 태그 안에 폼 요소 넣는 방법 -->
<label>레이블1<input type="text"></label>

<!-- 폼 요소의 id 를 이용해서 레이블 태그를 붙이는 방법 -->
<label for="my-input">레이블2</label>
<input type="text" id="my-input">
~~~
<label>레이블1<input type="text"></label>

<label for="my-input">레이블2</label>
<input type="text" id="my-input">

폼 요소에 레이블을 붙이는 태그.<br>
일반 텍스트 대신 레이블을 쓰는 이유는 텍스트가 안보이거나 폼 요소와 따로 노는 경우에도 둘이 연관되어 있다는 것을 확실히 하기 위해서이다.<br>
라디오 버튼이나 체크 박스에 레이블을 붙이면 레이블 부분을 클릭해도 버튼이 선택된다.<br>
레이블 태그를 사용할 때 다음과 같이 두 가지 방법이 있다.<br>

1. \<label\> ~ \<label\> 사이에 연결할 폼 요소를 삽입<br>

2. \<label\> 의 for 속성값으로 연결할 폼 요소의 id 를 지정<br>
<br>
<br>

### 3. \<fieldset\> 태그