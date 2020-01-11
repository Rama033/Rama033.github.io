---
layout: post
title: "npm command line 명령어 정리"
date: 2020-01-11T14:22:00+09:00
author: Jo
categories: java-script
tags: java-script npm install option commandline-tool cmd commandline
cover: "/assets/instacode.png"
---

### 1. install 관련 옵션
~~~
$ npm install
~~~  
* -P, --save-prod: package.json 의 dependencies 에 패키지를 등록한다. default 설정  
* -D, --save-dev: package.json 의 devDependencies 에 패키지를 등록한다.  
* -O, --save-optional: pacakge.json 의 optionalDependencies 에 패키지를 등록한다.  
* --no-save: dependencies 에 패키지를 등록하지 않는다.
  
> dependencies, devDependencies, optionalDependencies 의 차이?:  
> * dependencies: 기술 스펙으로 사용되어야 할 모듈들로 런타임에도 계속 쓰이는 경우.  
> * devDependencies: 개발 시에 필요한 모듈들로 프로젝트 컴파일 타임에만 필요한 경우.  
> * optionalDependencies: 사용을 원하는 모듈이지만 없거나 설치에 실패하더라도 전체 npm 패키지 설치 과정이 중단되지 않길 원하는 경우.  
  
*추가 예정*
