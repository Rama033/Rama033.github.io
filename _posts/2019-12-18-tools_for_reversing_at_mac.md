Mac OS X 에서 malware 분석시 사용할만한 툴들
=====================================

### 1. 코드 서명 확인
~~~
codesign -dvvvv -r - [app_name.app/]
~~~
codesign 내용을 출력해준다.
bundle Identifier와 TeamIdentifier(Apple Developer Signing Certificate)는 탐지 소프트웨어에서 사용될 수 있기 때문에 분석 초기에 확인해서 기록해놓는 것이 좋다.


### 2. 개발자 인증서 유효성 확인
~~~
spctl --verbose=4 --assess --type execute [app_name.app]
~~~
파일의 code signature가 더이상 유효하지 않은 경우 **CSSMERR_TP_CERT_REVOKED** 가 출력된다.
가짜 및 불량 개발자 계정으로 서명할 수도 있기 때문에 code signature 자체에는 큰 의미가 없지만, app을 실행하려고 하면 Gatekeeper와 XProtect에 의해 체크되기 때문에 bypass 하여 실행하지 않는 한 위조 서명은 걸러진다.


### 3. Info.plist 확인
~~~
plutil -p Info.plist
~~~
샘플을 실행할 최소 Mac OS 요구 버전, malware 작성자가 빌드시 사용한 Mac OS 버전 및 빌드 번호 등 유횽한 정보를 얻을 수 있다.


### 4. 파일의 메타 데이터 수집
~~~
file [file_name]
~~~
해당 파일이 어떤 파일인지 알려준다.
ex) Mach-O 64-bit executable x86_64, ASCII text 등등

~~~
ls -al@ [file_name]
~~~
파일의 확장된 속성 및 권한을 나열해준다.

~~~
xattr -l [file_name]
~~~
ls -al~과 유사한 역할을 한다.

~~~
mdls [file_name]
~~~
Spotlight 및 Finder가 보유한 메타 데이터를 나열해 준다. 