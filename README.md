## yullmastergram
### ✔프로젝트 설명
- 실제 SNS인 인스타그램과 같은 기능을 하는 웹사이트 제작
- 회원가입, 로그인 뿐만 아니라 게시글 작성, 댓글 쓰기, 좋아요 누르기와 같은 기능 구현

### 1️⃣설계하기
- UI 설계
  - https://ovenapp.io/view/pK0nAxYWUEGYfwSJ8wk6TGyWPmK15HoV/
- DB, URL 설계
  - https://docs.google.com/spreadsheets/d/17rnyMpgm0htnxmh0RTFVT8lxPmiSIjr4hA0-EpX20Dc/edit?usp=sharing
  
### 2️⃣기능 맛보기
- 회원가입 및 로그인
  - package: [com.yullmaster.gram.user.*](https://github.com/syr96/yullmastergram/tree/develop/src/main/java/com/yullmaster/gram/user)
  - 회원가입 view: [/WEB_INF/jsp/user/signup.jsp](https://github.com/syr96/yullmastergram/blob/develop/src/main/webapp/WEB-INF/jsp/user/signup.jsp)
  - 로그인 view: [/WEB_INF/jsp/user/signin.jsp](https://github.com/syr96/yullmastergram/blob/develop/src/main/webapp/WEB-INF/jsp/user/signin.jsp)
- 후기작성 및 후기보기
  - package: [com.yullmaster.gram.post.*](https://github.com/syr96/yullmastergram/tree/develop/src/main/java/com/yullmaster/gram/post)
  - 타임라인 view: [/WEB_INF/jsp/post/timeline.jsp](https://github.com/syr96/yullmastergram/blob/develop/src/main/webapp/WEB-INF/jsp/post/timeline.jsp)

### ♻출처
- Tomcat: [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) 
- Mysql: [GPLv2 or proprietary](https://www.gnu.org/licenses/gpl-3.0)
- Spring framework: [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)  
- Mybatis: [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
- Bootstrap: [MIT License](https://opensource.org/licenses/MIT)
- jQuery: [MIT License](https://opensource.org/licenses/MIT)
- 이미지🖼: [pixabay](https://pixabay.com/ko/)

### 🎞향후 계획
- user의 게시글 리스트
- 프로필 수정 기능
