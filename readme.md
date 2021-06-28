# feat1

> 다른 팀원들보다 더 단순한 기능들이니깐 구글링을 많이 해서 더 깊이 공부해보자



### 내가 해야하는 일



* 구현하고자 하는 기능 
  1. 회원가입 - 아이디,email, 비밀번호, 이름, 생일  
  2. 로그인 - 아이디찾기,비밀번호찾기
  3. 유저 검색 
  4. 팔로잉, 팔로워 
  5. 회원정보 수정 - 정보 변경 
  6. ~~가능하면?~~ *+회원프로필기능* 
     * +이메일인증
     * +비밀번호암호화
     * +네이버 아이디로 로그인



* db 설계하기
  * 단순 친구가 아닌 팔로우,팔로워 기능으로 생각하니깐 헷갈린다. :tired_face:
    * 아직 db에 대한 이해가 부족한 듯 



### 기록

* 0611
  * 오라클과  MySQL 사용법 차이 확인하기 

  * 데이터모델링 공부하는 중 (ER MASTER로 ER 다이어그램도 그려보는 중)

  * 프로젝트 설정 및 단순 구조 잡기(실습코드랑 다르게 해보려고 시도중) 

    

    * 결론 : ~~끝낸게 없음 ㅋㅋㅋㅋ~~ 겉핥기하지말고 하나씩 끝내자. 
      * 테스트코드도 작성해보자. `junit` `@test` 
      * 할일 많누

* 0615

  * MySQL 공부하고 Mybatis 복습;;(뭔가 더 넣으려면 복잡해)

  * 이메일 인증(`javax.mail`), 비밀번호 암호화(`sha256`) 실습

  * User vo, dao, service, jsp틀 1차 정리 끝 

    ​		

    * 결론 : 

      * test코드는 결국 작성 못해봄
      * 지금 내 코드에서 오류가 있는데 뭐가 문제인지 확인이 잘 안되는 상황
      * 이메일 인증이랑 비밀번호 암호화는 결과까지 구현이 안되었는데 아예 프로젝트에 옮겨서 다시 시작해봐야지.... 
      * 일단 순서도 뒤죽박죽이니깐 내일은 1차적으로 기본기능들을 토대로 구현이 되도록 하고 그 다음에 다시 이것저것 추가해야겠다.
      * ~~오늘도 끝낸게 없네....~~ 그래도 코드복붙은 절대 하지말자! 



* 0622 
  * 기존 교재 혹은 실습 코드를 사용하지 않고 無에서 구글링으로 새롭게 만들어보고 싶었으나 환경 세팅과 ajax가 발목을 잡으면서 일주일을 허비했다,,, 
  * 그래서 기존 코드에 의존하는 방식으로 다시 만들어야할듯하다 ㅠㅠ
  * 새롭게 프로젝트 생성해서 다시 회원가입 기능과 MYSQL연동까지만 완료 ㅠㅠ 내일 진짜 기본 기능 끝내서 깃헙에 올려둘 예정!

* 0624 
  * 내 프로토 타입으로 회원가입, 로그인까지는 구현
  * 동현이형 db, 프로젝트 임포트해서 비밀번호 암호화 구현
  
    
  
  

​	

* 0628

  * 회원가입(이메일, 닉네임 중복 확인) 로그인, 이메일 찾기 구현 

    

    +앞으로 해야 할일(수요일까지!)

    * 인터셉터?

    * 모든 페이지에 세션유지 및 로그아웃 구현

    * 비밀번호 암호화 추가하기 

    * 정규표현식 추가하기

      * `이메일` RegExp(/^[A-Za-z0-9_**\.\-**]+@[A-Za-z0-9**\-**]+**\.**[A-Za-z0-9**\-**]+/);_
      *  RegExp(/^[a-zA-Z0-9_**\.**]{4,14}$/); //알파벳 소문자 대문자 숫자 사용, 한글 사용 불가 (4글자에서 14자 사용가능)
      * `비밀번호`  RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~]);([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/); //영문 대소문자 숫자 특수문자 
      * `이름`  RegExp(/^[가-힣]+$/); //한글로만
      * `전화번호`  RegExp(/^\d{3}-\d{3,4}-\d{4}$/);

      

      

      여유가 되면 이메일 전송으로 PASSWORD 찾기 구현 및 이메일 인증!

      







