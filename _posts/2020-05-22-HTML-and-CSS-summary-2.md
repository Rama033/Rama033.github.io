---
layout: post
disqus_disabled: false
title: "[HTML5 & CSS3] 웹 공부 내용 정리 2 - HTML Tag"
date: 2020-05-22T16:35:00+09:00
author: Jo
categories: html-css-summary
tags: html html5 css css3 web text tag text-tag 
cover: "/assets/instacode.png"
---
## Text 관련 Tag 들
<br>
<br>

### 1. 단락 Tag
앞, 뒤로 빈 줄이 생겨서 하나의 덩어리로 만들어 주는 태그들  
<br>

#### \<h\> 태그 - 제목  
~~~html
<h1>h1 제목</h1>
<h2>h2 제목</h2>
<h3>h3 제목</h3>
<h4>h4 제목</h4>
<h5>h5 제목</h5>
<h6>h6 제목</h6>
~~~  
<h1>h1 제목</h1>
<h2>h2 제목</h2>
<h3>h3 제목</h3>
<h4>h4 제목</h4>
<h5>h5 제목</h5>
<h6>h6 제목</h6>

**h**eading 의 약자.  
각 웹 콘텐츠 영역에서 제목을 표시할 때 사용한다.  
h1 > h2 > h3 > h4 > h5 > h6 순으로 글자 크기가 작아진다.  
\<p\> 태그를 사용하면 글자 크기, 굵기 등에 상관 없이 그냥 텍스트로 인식되고, \<h\> 태그를 써야 웹 브라우저가 일반 텍스트가 아닌 제목으로 인식해서 그에 맞게 처리해줄 수 있다.  
<br>

#### \<p\> 태그 - 텍스트 단락  
~~~html
<p>가나다라마 </p>
~~~
<p>가나다라마 </p>

**p**aragraph 의 약자.  
\<p\> 태그 써주면 입력 내용 앞 뒤로 빈 줄이 생기면서 텍스트 단락이 만들어진다.  
<br>

#### \<br\> 태그 - 줄 변경
~~~html
<br>
~~~  
line **br**eak 의 약자.  
입력하면 줄을 바꿔준다.  
<br>
  
#### <blockquote> 태그 - 인용문  
~~~html
<blockquote>인용문</blockquote>
~~~  
<blockquote>인용문</blockquote>

\<p\> 태그를 사용한 텍스트보다 안으로 들여써진다.  
또한 웹 브라우저에서도 인용문임을 알고 그에 맞게 처리해줄 수 있다.  
<br>

#### <hr> 태그 - 분위기 전환 (수평선)
~~~html
<p>분위기 1</p>
<hr>
<p>분위기 2</p>
~~~  
<p>분위기 1</p>
<hr>
<p>분위기 2</p>

**h**orizontal **r**ule 의 약자.   
HTML4 까지는 그냥 수평선 그어주는 용도였지만 HTML5 부터는 여러 개의 텍스트 단락이 있을 때 분위기 전환을 위해서 사용된다.  
HTML5 에서도 수평선이 그어지긴 하지만 그 용도가 분위기 전환용으로 변경되었다.  
이 수평선은 CSS로 없앨수도 있다.  
<br>

#### <pre> 태그 - 입력한 그대로
~~~html
<pre>      공백 앞                             공백 뒤      </pre>
~~~  
<pre>      공백 앞                             공백 뒤      </pre>

**pre**formatted의 약자.  
입력한 그대로 표시해주는 태그이다.  
이 외의 태그를 사용하면 공백을 아무리 많이 넣어도 웹 브라우저 상에는 하나로 표시가 되는데, \<pre\> 태그를 사용하면 공백이 그대로 출력된다.  
탭이 많이 들어가는 소스 코드등을 표시할 때 주로 사용한다.
<br>
<br>  

### 2. 한 줄 Tag
묶음 태그와는 다르게 줄이 바뀌지 않는 태그들.  
\<p\>, \<h_n\> 등 다른 텍스트 태그들 안에 사용될 수 있다.
<br>
  
#### \<strong\> 태그 - 강조할 내용 볼드체
~~~html
<p>가나다라마 <strong>중요한 내용</strong> 아자차카타</p>
~~~  
<p>가나다라마 <strong>중요한 내용</strong> 아자차카타</p>

중요한 내용을 강조하기 위해 사용되며, 굵은 글씨로 표시된다.  
<br>

#### \<b\> 태그 - 단순 볼드체
~~~html
<p>가나다라마 <b>굵은 글씨</b> 아자차카타</p>
~~~  
<p>가나다라마 <b>굵은 글씨</b> 아자차카타</p>

**b**old 의 약자.  
글자를 단순히 굵게 표시하기 위해서 사용한다.  
화면 상으로는 \<strong\> 태그와 똑같이 표시되지만, 웹 브라우저는 \<strong\> 태그는 중요한 내용, \<b\> 태그는 단순히 굵은 글씨로 둘을 다르게 인식한다.  
<br>
  
#### \<em\> 태그 - 강조할 내용 이탤릭체
~~~html
<p>가나다라마 <em>강조 내용</em> 아자차카타</p>
~~~  
<p>가나다라마 <em>강조 내용</em> 아자차카타</p>

**em**phasize 의 약자.  
흐름상 특정 부분을 강조하기 위해서 사용되며, 이탤릭체로 표시된다.  
<br>

#### \<i\> 태그 - 단순 이탤릭체
~~~html
<p>가나다라마 <i>이탤릭체</i> 아자차카타</p>
~~~  
<p>가나다라마 <i>이탤릭체</i> 아자차카타</p>

**i**talic 의 약자.  
글자를 단순히 이탤릭체로 표시하기 위해서 사용한다.  
\<strong\>, \<b\> 태그의 관계 처럼 \<em\> 태그와 표시되는 형태는 같지만 웹 브라우저가 인식하는 내용이 다르다.  
<br>
  
#### \<q\> 태그 - 인용문
~~~html
<p>가나다라마 <q>인용구</q> 아자차카타</p>
~~~  
<p>가나다라마 <q>인용구</q> 아자차카타</p>

**q**uote 의 약자.  
\<blockquote\> 태그와 마찬가지로 인용문을 표시하기 위해 사용되지만, \<blockquote\> 와 달리 줄바꿈 없이 다른 내용과 한 줄에 표시되며 대신 인용문 앞뒤로 따옴표(" ") 가 들어간다.  
<br>
  
#### \<mark\> 태그 - 형광펜
~~~html
<p>가나다라마 <mark>형광색</mark> 아자차카타</p>
~~~  
<p>가나다라마 <mark>형광색</mark> 아자차카타</p>

형광펜으로 칠한것 처럼 노란색으로 강조해서 표시해준다.  
<br>
  
#### \<span\> 태그 - 인라인 영역 지정
~~~html
<p>가나다라마 <span> 인라인 영역 </span> 아자차카타</p>
~~~  

줄 안에서 영역을 지정해준다.  
이러한 영역은 텍스트 전체에서 아니면 웹 문서 내용상에서 특정 부분에다가 CSS 등으로 효과 추가해주고 싶을때 사용한다.  
<br>
  
#### \<div\> 태그 - 블록 영역 지정
~~~html
<div>
  <p>영역 1</p>
</div>
<div>
  <p>영역 2</p>
</div>
~~~  

단락 단위로 영역을 지정해준다.  
\<span\> 과 마찬가지 용도로 사용한다.  
<br>
  
#### \<ruby\> 태그 - 동아시아 글자에 윗주 표시
~~~html
<p>가나다라마 <ruby>아래<rt>위</rt></ruby> 아자차카타</p>
~~~  
<p>가나다라마 <ruby>아래<rt>위</rt></ruby> 아자차카타</p>

\<ruby\> ~ \</ruby\> 태그 사이에 \<rt\> ~ \</rt\> 태그를 사용해서 동아시아어의 윗주를 달아줄 수 있다.  
<br>
  
### 3. 리스트 Tag
리스트를 만들어 주는 태그들  
type 속성을 이용해서 항목 앞의 기호를 지정해줄 수 있다.  
<br>

#### \<li\> - 항목
~~~html
<li>항목</li>
~~~  

리스트의 각 항목으로 쓴다.  
<br>

#### \<ul\> - 순서 없는 리스트
~~~html
<ul>
  <li>항목1</li>
  <li>항목2</li>
  <li>항목3</li>
  <li type="disc">disc 항목</li>
  <li type="circle">circle 항목</li>
  <li type="square">squre 항목</li>
</ul>
<ul type="square">
  <li>항목A</li>
  <li type="circle">항목B</li>
</ul>
~~~  
<ul>
  <li>항목1</li>
  <li>항목2</li>
  <li>항목3</li>
  <li type="disc">disc 항목</li>
  <li type="circle">circle 항목</li>
  <li type="square">squre 항목</li>
</ul>
<ul type="circle">
  <li>항목A</li>
  <li type="square">항목B</li>
</ul>

\<ul\> 은 **u**nordered **l**ist 의 약자로, \<ul\> 태그로 리스트를 만들면 각 항목 앞에 동일한 기호가 붙는다.  
\<li\> 태그에 type 속성 값을 지정해서 검은 원, 빈 원, 검은 사각형을 각 항목별로 표시할 수 있다 (디폴트는 disc).
\<ul\> 태그에 type 값을 지정하면 전체 항목에 영향을 미친다.  
<br>
  
#### \<ol\> - 순서 리스트
~~~html
<ol type="1" start="10" reversed>
  <li>항목1</li>
  <li>항목2</li>
  <li value="20">항목3</li>
  <li>항목4</li>
</ol>
~~~  
<ol type="1" start="10" reversed>
  <li>항목1</li>
  <li>항목2</li>
  <li value="20">항목3</li>
  <li>항목4</li>
</ol>

\<li\> ~ \</li\> 안의 내용이 각각 항목이 되어서 \<ol\> ~ \<ol\> 리스트를 구성한다.  
\<ol\> 은 **o**rdered **l**ist 의 약자로, \<ol\> 태그로 리스트를 만들면 각 항목 앞에 숫자나 알파벳 등으로 순서가 표시된다.  
순서 표시 방식은 \<ol\> 태그에 다음과 같이 속성값을 지정해서 변경할 수 있다.  
* type 속성: 1, a, A, i, I 를 넣어서 각각 숫자, 소문자 알파벳, 대문자 알파벳, 로마자로 순서를 표시
* start 속성: 지정한 번호부터 시작
* reversed 속성: 역순으로 표시  
\<li\> 태그에는 value 속성을 이용해서 그 항목부터 새로운 값으로 시작하도록 할 수 있다.  
<br>
  
### \<dl\>, \<dt\>, \<dd\> - 정의 리스트
~~~html
<dl>
  <dt>정의 제목1</dt>
  <dd>정의 설명1</dd>
  <dd>정의 설명2</dd>
  <dt>정의 제목1</dt>
  <dd>정의 설명1</dd>
  <dd>정의 설명2</dd>
  <dd>정의 설명3</dd>
</dl>
~~~  
<dl>
  <dt>정의 제목1</dt>
  <dd>정의 설명1</dd>
  <dd>정의 설명2</dd>
  <dt>정의 제목1</dt>
  <dd>정의 설명1</dd>
  <dd>정의 설명2</dd>
  <dd>정의 설명3</dd>
</dl>

\<dl\> 은 **d**efinition **l**ist 의 약자로, 정의 리스트의 시작과 끝을 나타낸다.  
\<dt\> 는 **d**efinition **t**itle 의 약자로, 정의 제목을 나타낸다.  
\<dd\> 는 **d**efinition **d**escription 의 약자로, 정의에 대한 설명을 나타낸다.  
<br>
<br>
  
### 4. 테이블 Tag
HTML 로 테이블을 만들 때 사용하는 태그들  
표 예시는 다음과 같다.

~~~html
<table>
  <figure>
    <figcaption>제목</figcaption>
  </figure>
  <colgroup>
    <col>
    <col style="background-color:yellow">
  </colgroup>
  <col style="background-color:yellow">
  
  <tr>
    <th>1열</th>
    <th>2열</th>
    <th>3열</th>
    <th>4열</th>
  </tr>
  <tr>
    <td>1, 1</td>
    <td>1, 2</td>
    <td>1, 3</td>
    <td>1, 4</td>
  </tr>
  <tr>
    <td>2, 1</td>
    <td>2, 2</td>
    <td>2, 3</td>
    <td>2, 4</td>
  </tr>
  <tr>
    <td>3, 1</td>
    <td>3, 2</td>
    <td>3, 3</td>
    <td>3, 4</td>
  </tr>
</table>
~~~
<table>
  <colgroup>
    <col>
    <col style="background-color:yellow">
  </colgroup>
  <col style="background-color:yellow">
  
  <tr>
    <th>1열</th>
    <th>2열</th>
    <th>3열</th>
    <th>4열</th>
  </tr>
  <tr>
    <td>1, 1</td>
    <td>1, 2</td>
    <td>1, 3</td>
    <td>1, 4</td>
  </tr>
  <tr>
    <td>2, 1</td>
    <td>2, 2</td>
    <td>2, 3</td>
    <td>2, 4</td>
  </tr>
  <tr>
    <td>3, 1</td>
    <td>3, 2</td>
    <td>3, 3</td>
    <td>3, 4</td>
  </tr>
</table>
<br>

### \<table\> - 테이블 생성
~~~html
<table border="1">
  ...
</table>
~~~  
테이블의 시작과 끝을 나타내는 태그이다.  
이 안에 \<tr\>, \<td\> 태그 등을 넣어서 표를 만든다.  
기본적으로 HTML 테이블은 테두리가 표시되지 않기 때문에 \<table\> 태그에 border 속성을 줘서 표현할 수 있다.  
보통은 border 속성 대신 CSS 이용해서 테두리나 기타 테이블 스타일을 표현해준다.
<br>

### \<tr\> - 행
~~~html
<table border="1">
  <tr height=100>
    ...
  </tr>
  <tr width=50%>
    ...
  </tr>
</table>
~~~
**t**able **r**ow 의 약자로, 가로 행 하나의 시작과 끝을 나타내는 태그이다.  
이 안에 \<td\> 태그 등을 넣어서 셀들을 만들 수 있다.  
width, height 속성을 사용해서 행의 너비, 높이를 지정해줄 수 있다.  (pixel 단위 또는 % 단위)  
<br>

### \<td\> - 열
~~~html
<table border="1">
  <tr>
    <td rowspan="3">1, 2, 3행 1열</td>
    <td>1행 2열</td>
    <td>1행 3열</td>
  </tr>
  <tr>
    <td colspan="2">2행 2, 3열</td>
  </tr>
  <tr>
    <td>3행 2열</td>
    <td>3행 3열</td>
  </tr>
</table>
~~~  
<table border="1">
  <tr>
    <td rowspan="3">1, 2, 3행 1열</td>
    <td>1행 2열</td>
    <td>1행 3열</td>
  </tr>
  <tr>
    <td colspan="2">2행 2, 3열</td>
  </tr>
  <tr>
    <td>3행 2열</td>
    <td>3행 3열</td>
  </tr>
</table>

**t**able **d**ata 의 약자로, 셀을 만들어주는 태그이다.  
HTML 에서 따로 칼럼을 만들어 주는 태그는 없고, \<td\> 태그를 이용해서 셀을 만들어서 사용한다.  
\<tr\> 태그와 마찬가지로 width, height 속성으로 셀의 크기를 지정할 수 있으며, rowspan, colspan 속성으로 각각 행, 열을 합칠 수 있다.  
<br>

### \<caption\> - 테이블 제목
~~~html
<caption>표 제목</caption>
<table border="1">
  <tr>
    <td>1행 1열</td>
    <td>1행 2열</td>
    <td>1행 3열</td>
  </tr>
  <tr>
    <td>2행 1열</td>
    <td>2행 2열</td>
    <td>2행 3열</td>
  </tr>
  <tr>
    <td>3행 1열</td>
    <td>3행 2열</td>
    <td>3행 3열</td>
  </tr>
</table>
~~~
<caption>표 제목</caption>
<table border="1">
  <tr>
    <td>1행 1열</td>
    <td>1행 2열</td>
    <td>1행 3열</td>
  </tr>
  <tr>
    <td>2행 1열</td>
    <td>2행 2열</td>
    <td>2행 3열</td>
  </tr>
  <tr>
    <td>3행 1열</td>
    <td>3행 2열</td>
    <td>3행 3열</td>
  </tr>
</table>

\<table\> 태그 위에 \<caption\>표제목\<caption\> 을 넣어서 테이블의 제목을 표시해줄 수 있다.  
\<caption\> 태그는 테이블당 하나밖에 달 수 없다.  
<br>

### \<figcaption\> - \<figure\> 태그 이용한 테이블 제목
~~~html
<figure>
  <figcaption>표 제목1</figcaption>
  <table border="1">
    <tr>
      <td>1행 1열</td>
      <td>1행 2열</td>
      <td>1행 3열</td>
    </tr>
    <tr>
      <td>2행 1열</td>
      <td>2행 2열</td>
      <td>2행 3열</td>
    </tr>
    <tr>
      <td>3행 1열</td>
      <td>3행 2열</td>
      <td>3행 3열</td>
    </tr>
  </table>
  <figcaption>표 제목2</figcaption>
</figure>
~~~
<figure>
  <figcaption>표 제목1</figcaption>
  <table border="1">
    <tr>
      <td>1행 1열</td>
      <td>1행 2열</td>
      <td>1행 3열</td>
    </tr>
    <tr>
      <td>2행 1열</td>
      <td>2행 2열</td>
      <td>2행 3열</td>
    </tr>
    <tr>
      <td>3행 1열</td>
      <td>3행 2열</td>
      <td>3행 3열</td>
    </tr>
  </table>
  <figcaption>표 제목2</figcaption>
</figure>

\<caption\> 태그 말고 \<figure\> 와 \<figcaption\> 태그를 이용해 표의 제목을 표시해줄 수도 있다.  
\<figure\> 태그는 표나 동영상, 이미지 등 특정한 캡션을 부틸 수 있는 영역을 만들어주는 태그인데, 테이블 전체를 \<figure\> ~ \</figure\> 태그로 묶어준 다음 캡션을 붙이고 싶은 위치에 \<figcaption\> 태그를 넣어서 캡션을 달아줄 수 있다.  
\<caption\> 과 다르게 여러군데에 캡션을 달아줄 수 있다.  
<br>

### \<thead\>, \<tbody\>, \<tfoot\> - 제목, 본문, 요약 영역
~~~html
<table border="1">
  <thead>
    <tr>
      <td>1열</td>
      <td>2열</td>
      <td>3열</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1행 1열</td>
      <td>1행 2열</td>
      <td>1행 3열</td>
    </tr>
    <tr>
      <td>2행 1열</td>
      <td>2행 2열</td>
      <td>2행 3열</td>
    </tr>
    <tr>
      <td>3행 1열</td>
      <td>3행 2열</td>
      <td>3행 3열</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td rowspan="3">요약</td>
    </tr>
  </tfoot>
</table>
~~~
<table border="1">
  <thead>
    <tr>
      <td>1열</td>
      <td>2열</td>
      <td>3열</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1행 1열</td>
      <td>1행 2열</td>
      <td>1행 3열</td>
    </tr>
    <tr>
      <td>2행 1열</td>
      <td>2행 2열</td>
      <td>2행 3열</td>
    </tr>
    <tr>
      <td>3행 1열</td>
      <td>3행 2열</td>
      <td>3행 3열</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td rowspan="3">요약</td>
    </tr>
  </tfoot>
</table>

\<thead\> 는 제목 셀, \<tbody\> 는 본문 셀, \<tfoot\> 은 요약 셀 부분을 의미하는 영역으로 묶어주는 태그들이다.  
이렇게 묶는 것은 화면 판독기로 화면을 읽을 때 표의 어떤 부분인지 알 수 있어 시각장애인의 이해를 도와 웹 접근석을 높일 수 있으며, 또한 이렇게 나눠두면 각각 다르게 스타일링 할 때 편리하다.  
예를들어 본문 부분이 길어지면 자바스크립트를 이용해서 제목, 요약 부분은 고정하고 \<tbody\> ~ \</tbody\> 로 둘러쌓인 본문 부분만 스크롤링 되게 할 수 있다.
<br>

### \<col\>, \<colgroup\> - 칼럼 묶기
~~~html
<table border="1">
  <colgroup>
    <col>
    <col style="background-color:yellow" span="2">
    <col style="background-color:blue">
  </colgroup>
  
  <tr>
    <th>1열</th>
    <th>2열</th>
    <th>3열</th>
    <th>4열</th>
  </tr>
  <tr>
    <td>1, 1</td>
    <td>1, 2</td>
    <td>1, 3</td>
    <td>1, 4</td>
  </tr>
  <tr>
    <td>2, 1</td>
    <td>2, 2</td>
    <td>2, 3</td>
    <td>2, 4</td>
  </tr>
  <tr>
    <td>3, 1</td>
    <td>3, 2</td>
    <td>3, 3</td>
    <td>3, 4</td>
  </tr>
</table>
~~~  
<table border="1">
  <colgroup>
    <col>
    <col style="background-color:yellow" span="2">
    <col style="background-color:blue">
  </colgroup>
  
  <tr>
    <th>1열</th>
    <th>2열</th>
    <th>3열</th>
    <th>4열</th>
  </tr>
  <tr>
    <td>1, 1</td>
    <td>1, 2</td>
    <td>1, 3</td>
    <td>1, 4</td>
  </tr>
  <tr>
    <td>2, 1</td>
    <td>2, 2</td>
    <td>2, 3</td>
    <td>2, 4</td>
  </tr>
  <tr>
    <td>3, 1</td>
    <td>3, 2</td>
    <td>3, 3</td>
    <td>3, 4</td>
  </tr>
</table>

\<col\> 은 한 칼럼에 있는 모든 셀에 같은 스타일을 적용하려고 할 때 사용하는 태그이며, 닫는 태그 없이 단독으로 사용된다.  
\<colgroup\> ~ \</colgroup\> 태그 안에 \<col\> 태그들을 넣어서 사용할 수도 있으며, 이렇게 \<colgroup\> 태그 안에서, 혹은 독립적으로 쓰인 \<col\> 태그들의 개수는 테이블의 칼럼의 개수와 같아야 한다.  
또한 \<col\>, \<colgroup\> 태그들은 \<caption\> 뒤, \<tr\>, \<td\> 앞에서 사용되어야 한다.
\<col\> 태그에 span 속성을 사용해서 여러 칼럼을 묶을 수도 있다.
<br>
<br>

### 5. ETC
> **태그의 의미와 웹 접근성** \<h\> 과 \<p\>, \<strong\> 과 \<b\>, \<em\> 과 \<i\> 처럼 화면상 표현은 같지만 웹 브라우저가 인식하는 것이 다른 태그들은 텍스트 낭독기나 기타 웹 브라우저, 기기별 기능 등의 경우 태그의 사용 목적에 따라 다르게 표현될 수 있다.  
예를 들면 스크린 리더를 사용하는 경우 음성 합성 도구가 페이지를 읽을 때 \<strong\> 태그는 중요한 내용이므로 강조해서 읽고, \<b\> 태그는 평범하게 읽는 등 시각 장애인 들도 그 의미를 이해할 수 있도록 해주어 웹 접근성을 높인다.  
\<hr\> 태그가 HTML5 에서 단순 수평선 긋는 용도가 아닌 분위기 전환용으로 바뀐 것도 마찬가지 맥락이다.  
  