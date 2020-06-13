---
layout: post
disqus_disabled: false
title: "URI, URL, URN"
date: 2020-06-13T22:57:00+09:00
author: Jo
categories: web
tags: web uri urn url 
cover: "/assets/instacode.png"
---

## URI (Uniform Resource Identifier)
~~~
scheme:[//[user[:password]@]host[:port]][/path][?query][#fragment]
~~~
통합 자원 식별자. 말 그대로 네트워크 상에서 자원을 식별해준다. <br>
URI 의 하위 개념으로 URL 과 URN 이 있다.<br>
URL이 가리키는게 자원, 즉 파일의 위치라면 URI 는 그보다 더 상위의 개념으로써 identifier 를 가리킨다고 볼 수 있다.<br>
따라서 Apache, IIS 등의 핸들러를 나타내기 위해서는 URL 이 아니라 URI 를 사용해야 하며 이 때문에 요즘에는 그냥 보통 URI 로 쓰는게 트렌드라고 한다.<br>
<br>

## URL(Uniform Resource Locator)
~~~
scheme:[//[user:password@]host[:port]][/]path[?query][#fragment]
~~~
네트워크 상에서 자원의 위치를 나타내는 주소. <br>
일반적으로 웹사이트 주소를 나타낸다고 생각하지만, 컴퓨터 네트워크 상의 자원은 모두 나타낼 수 있다.<br>
<br>

## URN(Uniform Resource Name)
~~~
<URN> ::= "urn:" <NID> ":" <NSS>
~~~
URN 은 특정 자원을 가리키는 불변의 이름을 말한다.<br>
URL 은 자원의 '위치' 를 나타내기 때문에 해당 파일이 어느 서버의 어떤 디렉토리에 있는 파일인지 전부 다 알아야 하며, 그 구조가 바뀌게 되면 해당 파일을 나타내기 위한 URL 또한 바뀌어야 한다.<br>
블로그만 봐도 포스트 파일 위치를 다른 디렉토리로 바꾸면 그 포스트는 기존 주소로는 접속할 수 없어진다. 검색 봇에 의해 다시 색인되기 전 까진 구글에서 검색도 되지만 접속해봤자 에러만 뜰 뿐이다.<br>
<br>
하지만 URN 의 경우 특정 자원을 가리키는 '불변'의 이름이기 때문에 저장 위치가 바뀌든 서버가 바뀌든 상관 없이 자원을 나타내줄 수 있다.<br>
URL 처럼 자원의 완전한 주소를 알 필요 없이 그저 이름만 알면 접근할 수 있는 것이다.<br>
다만 지금까진 개념적으로만 제안되었을 뿐이고 아직도 실제로 구현하기 위해 개발중이라고 한다.<br>