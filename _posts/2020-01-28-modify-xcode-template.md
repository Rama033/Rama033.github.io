---
layout: post
disqus_disabled: false
title: "Xcode 언어별 기본 생성 파일 템플릿 수정 방법"
date: 2020-01-28T14:53:00+09:00
author: Jo
categories: mac-os-x
tags: mac-os-x xcode file template hpp
cover: "/assets/instacode.png"
---

~~~
$ cd /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates/Source/
~~~
위 경로로 이동하면 C\ File.xctemplate, Objective-C\ File.xctemplate 등 Xcode 상에 존재하는 다양한 기본 템플릿 파일들이 존재한다.  
  
수정하고 싶은 언어 또는 프로젝트의 xctemplate 파일을 찾아 들어가면 \_\_\_FILEBASENAME\_\_\_.h 처럼 앞뒤로 언더바가 세 개씩 붙은 파일들이 있다.  
이 파일들을 수정하면 Xcode 에서 새 파일 생성할 때 수정한 대로 만들어진다.  

예를들어, Xcode 에서 C++ 파일을 새로 생성할 경우 헤더 파일 자동생성 옵션을 켜면 .hpp 파일로 생성이 된다.  
.hpp 대신 .h 파일이 만들어지게 하려면 /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates/Source/C++\ File.xctemplate/WithHeader 경로로 이동하여 \_\_\_FILBASENAME\_\_\_.hpp 파일을 수정해야 한다.  
먼저 super user 권한으로 파일을 열어 .hpp 로 되어있는 부분을 모두 .h 로 수정한다.

~~~cpp
//___FILEHEADER___

#ifdef ___FILEBASENAMEASIDENTIFIER___h
#define ___fILEBASENAMEASIDENTIFIER___h

#include <stdio.h>

#endif /* ___FILEBASENAMEASIDENTIFIER___h */
~~~
  
다음으로 \_\_\_FILEBASENAME\_\_\_.hpp 파일의 이름도 마찬가지로 .hpp 대신 .h 로 수정한다. 물론 이 때도 super user 권한이 필요하다.  
이제 새로운 C++ 파일을 생성하면 (header 파일도 생성 옵션 설정했을 경우) .hpp 대신 .h header 파일이 자동으로 생성된다.  
만약 헤더 파일에서 기본적으로 stdlib.h 나 unistd.h 등을 인클루드 하게 하고싶다면 ```#inlcude <stdlib.h>```, ```#include <unistd.h>``` 를 템플릿 파일에 넣으면 된다.  

이런 방식으로 Xcode 에서 새 파일 생성시 선택할 수 있는 템플릿들을 원하는 대로 수정하여 사용할 수 있다.  