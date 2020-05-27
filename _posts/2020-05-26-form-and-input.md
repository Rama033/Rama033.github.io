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
  <input type="text" title="입력" name="input" id="autofocus-textbox" autofocus>
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

### 3. \<fieldset\> 태그 - 영역 묶기
~~~html
<fieldset>
  <legend>영역 제목</legend>
    <ul>
      <li>
        <label for="input1">입력 1</label>
        <input type="text" id="input1">
      </li>
      <li>
        <label for="input2">입력 2</label>
        <input type="text" id="input2">
      </li>
    </ul>
</fieldset>
~~~
<fieldset>
  <legend>영역 제목</legend>
    <ul>
      <li>
        <label for="input1">입력 1</label>
        <input type="text" id="input1">
      </li>
      <li>
        <label for="input2">입력 2</label>
        <input type="text" id="input2">
      </li>
    </ul>
</fieldset>

\<fieldset\> 태그는 \<fieldset\> ~ \</fieldset\> 사이의 form 요소를 하나의 그룹으로 묶는 태그이다.<br>
\<legend\> 태그는 \<fieldset\> 으로 묶은 구역에 제목을 붙여주는 태그이다.<br>
<br>
<br>

## 2. Input
입력과 관련한 태그 및 속성들
<br>
<br>

### 1. \<input\> 태그 - 사용자 입력
라디오 버튼, 체크 박스, 입력창 등 사용자가 입력하는 부분은 거의 다 \<input\> 태그를 사용한다.<br>
다음과 같이 type 속성값을 지정해서 원하는 형태의 입력을 받을 수 있다.<br>

#### a. 텍스트
기본적으로 텍스트가 입력가능한 타입들로, 비밀번호, 이메일 등 특정 목적에 따라 나뉘어 각각 추가 기능이 존재<br>
size 속성으로 화면에 보일 문자 길이를, maxlength 속성으로 입력 가능한 최대 문자 길이를, value 로 초기값을 설정할 수 있다.<br>
※ password 타입의 경우 value 속성 사용 불가<br>
* **text**: 한 줄짜리 텍스트를 입력할 수 있는 텍스트 상자<br>
  ~~~html
  <input type="text" name="my-text" size="10" maxlength="30" value="텍스트 상자">
  ~~~
  <input type="text" name="my-text" size="10" maxlength="30" value="텍스트 상자">
  * 주로 아이디나 이름, 주소 등 텍스트를 입력
* **password**: 비밀번호 입력 필드<br>
  ~~~html
  <input type="password" name="my-password" size="5" maxlength="20">
  ~~~
  <input type="password" name="my-password" size="5" maxlength="20">
  * 사용자가 입력하는 내용이 '*' 또는 '•' 로 표시됨
  * value 속성은 사용 불가
* **search**: 검색 상자<br>
  ~~~html
  <input type="search" name="my-search" size="5" maxlength="20">
  ~~~
  <input type="search" name="my-search" size="5" maxlength="20">
  * 텍스트 필드와 거의 비슷하지만 추가적으로 검색 창에 x 표시가 떠서 간단하게 검색어를 삭제할 수 있음
* **url**: URL 주소 입력 필드<br>
  ~~~html
  <input type="url" name="my-url" size="30" maxlength="100">
  ~~~
  <input type="url" name="my-url" size="30" maxlength="100">
  * 브라우저가 지원하면 서버로 전송할 때 유효한 주소 맞는지 체크
* **email**: e-mail 주소 입력 필드<br>
  ~~~html
  <input type="email" name="my-email" size="30" maxlength="100">
  ~~~
  <input type="email" name="my-email" size="30" maxlength="100">
  * 브라우저가 지원하면 서버로 전송할 때 메일 주소 형식 맞는지 체크
* **tel**: 전화번호 입력 필드<br>
  ~~~html
  <input type="tel" name="my-tel" size="11" maxlength="11">
  ~~~
  <input type="tel" name="my-tel" size="11" maxlength="11">
  * url, email 과 달리 사용자 입력을 따로 체크하지는 않음
<br>

#### b. 숫자
숫자 입력과 관련된 타입들<br>
min, max 속성으로 최소, 최대값, value 속성으로 초기값을 지정할 수 있다.<br>
* **number**: 숫자 조절 화살표 필드<br>
  ~~~html
  <b>수량: </b> <input type="number" min="0" max="10" value="1">
  ~~~
  <b>수량: </b> <input type="number" min="0" max="10" value="1">
  * 브라우저가 지원하지 않는 경우 스핀 박스로 표시됨
* **range**: 숫자 조절 슬라이드 막대<br>
  ~~~html
  <b>수량: </b> <input type="range" min="0" max="10" value="0">
  ~~~
  <b>수량: </b> <input type="range" min="0" max="10" value="0">
  * 슬라이드 막대를 이용해 숫자 입력
<br>

#### c. 선택
몇 가지 항목 중 선택하는 타입들<br>
value 속성으로 지정한 값이 해당 항목 선택시 서버로 전송되는 값으로, 필수적으로 넣어줘야 한다.<br>
checked 속성을 사용하면 해당 항목은 기본적으로 선택된 상태로 표시된다.<br>
* **checkbox**: 주어진 항목에서 2개 이상 선택 가능한 체크박스<br>
  ~~~html
  <label><input type="checkbox" name="cb1" value="cb1">1번</label>
  <label><input type="checkbox" name="cb2" value="cb2">2번</label>
  <label><input type="checkbox" name="cb3" value="cb3" checked>3번</label>
  ~~~
  <label><input type="checkbox" name="cb1" value="cb1">1번</label>
  <label><input type="checkbox" name="cb2" value="cb2">2번</label>
  <label><input type="checkbox" name="cb3" value="cb3" checked>3번</label>
  * 여러 항목을 복수 선택할 수 있기 때문에 구분을 위해 name 속성값을 다 다르게 만들어야 함
* **radio**: 주어진 항목에서 1개만 선택 가능한 라디오 버튼<br>
  ~~~html
  <label><input type="radio" name="rd" value="rd1">1번</label>
  <label><input type="radio" name="rd" value="rd2" checked>2번</label>
  <label><input type="radio" name="rd" value="rd3">3번</label>
  ~~~
  <label><input type="radio" name="rd" value="rd1">1번</label>
  <label><input type="radio" name="rd" value="rd2" checked>2번</label>
  <label><input type="radio" name="rd" value="rd3">3번</label>
  * 여러 항목중 하나의 항목만 선택할 수 있기 때문에 같은 그룹 끼리는 동일한 name 속성값 사용해야 함
* **color**: 색상표<br>
  ~~~html
  <label><input type="color" value="#0000ff">색상 선택</label>
  ~~~
  <label><input type="color" value="#0000ff">색상 선택</label>
  * 색을 고를 수 있도록 색상표 창 뜸
  * value 속성값에 #으로 시작하는 6자리 16진수 색상값 (#RRGGBB) 를 입력하여 디폴트 색상을 지정할 수 있음
<br>

#### d. 날짜
날짜를 입력하기 위한 타입들<br>
모두 동일하게 min, max 속성값으로 최소, 최대 값을, step 속성으로 날짜, 시간 조절 단위를, value 로 초기값을 지정할 수 있다.<br>
시간을 표시하는 경우 기본적으로 24시간제이며, 날짜 다음에 T 키워드를 쓰고 그 뒤로 시간을 지정해주면 된다.<br>
* **date**: 사용자 지역 기준 날짜(연, 월, 일) 입력 필드<br>
  ~~~html
  <input type="date">
  ~~~
  <input type="date" min="2019-01-01" max="2020-05-31" step="2" value="2020-05-27">
  * yyyy-mm-dd 형식 날짜 선택 창 뜸
* **month**: 사용자 지역 기준 날짜(연, 월) 입력 필드<br>
  ~~~html
  <input type="month">
  ~~~
  <input type="month">
  * yyyy-mm 형식 날짜 선택 창
* **week**: 사용자 지역 기준 날짜(연, 주) 입력 필드<br>
  ~~~html
  <input type="week">
  ~~~
  <input type="week">
  * 연도와 주(week) 선택하는 창 뜸
* **datetime**: 국제 표준시(UTC) 로 설정된 날짜, 시간 입력 필드<br>
  ~~~html
  <input type="datetime">
  ~~~
  <input type="datetime">
  * UTC 날짜, 시간(연, 월, 일, 시, 분, 초, 분할 초) 을 입력하는 창이 뜸
  * 시간은 24시간제, 날짜 뒤에 T 키워드 붙이고 그 뒤로 시간 입력
* **datetime-local**: 사용자가 있는 지역 기준 날짜, 시간 입력 필드<br>
  ~~~html
  <input type="datetime-local">
  ~~~
  <input type="datetime-local">
  * 지역 기준 날짜, 시간(연, 월, 일, 시, 분, 초, 분할 초) 을 입력하는 창이 뜸
  * 시간은 24시간제, 날짜 뒤에 T 키워드 붙이고 그 뒤로 시간 입력
* **time**: 사용자 지역 기준 시간(시, 분, 초, 분할 초) 입력 필드<br>
  ~~~html
  <input type="datetime-local">
  ~~~
  <input type="datetime-local">
  * 지역 기준 시간(시, 분, 초, 분할 초) 을 입력하는 창이 뜸
<br>

#### e. 전송
입력한 내용 전송, 삭제 관련 타입들
* **submit**: 서버로 전송하는 버튼<br>
  ~~~html
  <form action="/assets/etc/input_test.php" method="post">
    <label>입력창<input type="text"></label>
    <input type="submit" value="전송">
  </form>
  ~~~
  <form action="/assets/etc/input_test.php" method="post">
    <label>입력창<input type="text" name="my-text-input"></label>
    <input type="submit" value="전송">
  </form>
  * 입력한 내용을 서버로 전송
  * form 에서 지정한 method 와 action 대로 전송되며, 서버에서는 입력창에 쓴 name 값을 이용해서 해당 값을 받을 수 있음
* **reset**: 리셋 버튼<br>
  ~~~html
  <form action="/assets/etc/input_test.php" method="post">
    <label>입력창<input type="text"></label>
    <input type="reset" value="다시 입력">
  </form>
  ~~~
  <form action="/assets/etc/input_test.php" method="post">
    <label>입력창<input type="text" name="my-text-input"></label>
    <input type="reset" value="다시 입력">
  </form>
  * 입력한 내용 전부 삭제
* **image**: submit 버튼 대신 사용할 이미지<br>
  ~~~html
  <form action="/assets/etc/input_test.php" method="post">
    <label>입력창<input type="text"></label>
    <input type="image" src="/assets/img/img_btn_submit.png">
  </form>
  ~~~
  <form action="/assets/etc/input_test.php" method="post">
    <label>입력창<input type="text"></label>
    <input type="image" src="/assets/img/img_btn_submit.png" width="80" height="40">
  </form>
  * submit 버튼으로 src 속성값으로 지정한 이미지를 사용
<br>

#### f. 기타
* **file**: 파일 첨부 버튼<br>
  ~~~html
  <input type="file">
  ~~~
  <input type="file">
  * 첨부파일 선택하는 창 뜸
* **button**: 일반 버튼<br>
  ~~~html
  <input type="button" value="그냥 버튼">
  ~~~
  <input type="button" value="그냥 버튼">
  * 일반 버튼
* **hidden**: 사용자에게는 보이지 않지만 서버로 넘겨지는 값<br>
  ~~~html
  <input type="hidden" name="my-hidden" value="서버로 전송할 값">
  ~~~
  * 화면 상의 form 에서는 보이지 않음
  * form 을 서버로 전송할 때 서버로 함께 전송됨
<br>
<br>

### 2. \<input\> 태그 속성들
#### a. autofocus
~~~html
<label type="text" autofocus>
~~~

페이지를 불러오자마자 autofocus 속성 가진 form 요소에 마우스 커서가 표시됨<br>
이 글의 <a href="#autofocus-textbox">첫 번째 텍스트 박스</a>가 autofocus 사용된 예시
<br>

#### b. placeholder
~~~html
<input type="email" placeholder="id@email.com">
~~~
<input type="email" placeholder="id@email.com">

입력란에 어떤 걸 입력해야 하는지에 대한 힌트를 표시
<br>

#### c. readonly
~~~html
<input type="text" value="입력 불가 텍스트 박스" readonly>
~~~
<input type="text" value="입력 불가 텍스트 박스" readonly>

readonly 속성 사용한 폼 요소는 내용을 볼 수만 있고 입력할 수 없음
<br>

#### d. required
~~~html
<input type="tel" required>
~~~
<form action="/assets/etc/input_test.php" method="post">
  <input type="tel" name="my-tel-input" required>
  <input type="submit" value="전송">
</form>

required 속성을 사용한 폼 요소는 필수적으로 내용을 입력해야 submit 할 수 있음<br>
입력 안하고 전송하려고 하면 에러 메시지가 뜸

#### e. min, max, step
* 날짜 관련(date, datetime, datetime-local, month, week, time) 또는 숫자 관련(range, number) 타입인 경우에 사용
* max, min: 해당 필드의 최대, 최소값
* step: 허용된 범위 내의 숫자 간격

#### f. size, minlength, maxlength
* 텍스트 관련 타입인 경우에 사용
* size: 화면에 몇 글자 보이게 할 지 지정
* maxlength, minlength: 최대 입력 가능 문자 길이를 지정