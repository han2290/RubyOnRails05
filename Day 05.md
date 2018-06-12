# day 5

### 오늘 할 내용

* CRUD중 CR을 학습
* 자료가 저장되는 곳은 DB가 아니라 CSV 파일로 한다.
* 그리고 사용자의 입력을 받아서 간이 게시판을 만든다



### 과제 01

* 사용자의 입력을 받는 `form` 태그로 이루어진 `/new` 액션과 `erb` 파일
  * `form`의 `action` 속성은 `/create`로 가도록 한다.(가기만 하고 만들지는 않는다)
  * `method`는 `post`를 이용한다.
  * 게시판 글의 제목(= title)과 본문(= contents) 두 가지 속성을 저장할 것이다.
* 전체 목록을 보여주는 `table` 태그로 이루어진 `/boards` 액션과 `erb` 파일
  * 일단 파일만 만든다



> *app.rb*

```ruby
get '/new' do
    erb :new
end

get '/boards' do
    erb :boards
end
```



> *new.erb*

```html
<h1>new</h1>
<form action="/create" method="POST">
    
</form>
```



> *boards.erb*

```html
<h1>boards</h1>
<table>
    
</table>
```





### 과제 02

* `/create` 액션을 만들고 작성 후에는 `/boards` 액션으로 들어가게 구성
  * `/create`액션이 동작한 이후에는 본인이 작성한 글로 이동하게 수정
* 글 목록을 볼 수 있는 페이지는 `/board/글번호`의 형태로 작성



#### Create와 Read

1. `get` /boards/new
2. `post` /boards/create
3. `get` /boards
4. `get` /board/:id

* `board`라고 하는 게시판이 하나만 존재하고 있다.
* `user`라고 하는 CRUD 기능을 위한 DB Table을 만든다고 가정하면?
  * 두 개 정도는 새로 구성을 해야한다.
* 새로운 유저를 등록한다면?



### 과제 03

* `User`를 등록할 수 있는 CSV 파일을 만든다
* id, password, password_confirmation
* 조건1
  * password와 password_confirmation을 입력 받아서 회원을 등록할 때 이 두 문자열이 다르면 회원 등록을 거부한다.
* Route(라우팅)
  * `get` /user/new
  * `post` /user/create
  * `get` /users
  * `get` /user/:id





### Rails

* `Rails 4.2.5` 를 `Rails 5.0.6`으로 업그레이드 한다.
  * `user:~ $ gem install rails -v  5.0.6`
* `ruby 2.3.4`을 `ruby 2.4.1`으로 업그레이드 한다.
  * `user:~ $ rvm install ruby-2.4.1`
  * `rvm default 2.4.1`로 버전 강제 변경
* `user:~ $ rails _5.0.6_ new test_app` rails 5.0.6 버전으로 `test_app`이름을 가진 프로젝트를 생성한다.
* `user:~ $ rails s -p $PORT -o $IP` 명령으로 프로젝트를 실행할 수 있다.



#### get install bundler

- `bundler`는 본인 프로젝트에서 사용될 모든 `gem`을 자동으로 설치해준다.
- 본인 프로젝트에 사용될 모든 `gem`은 `Gemfile`에 명시한다. 이 파일은 프로젝트 파일 내부에 있다.
- `Gemfile`에 내가 사용할 `gem`을 명시한 이후에 터미널을 이용해 다음 명령어를 입력한다.
  - `:~/test_app $ bundle install` 여기서 `test_app`는 rails 명령어로 생성한 프로젝트 이름이다.
- 사용할 `gem`을 추가한 이후에도 반드시 해당 명령어를 실행한다.
- 이 명령어는 추가한 `gem`만 설치하는 것이 아니라, 해당 `gem`이 의존하는 `gem`도 함께 설치한다.
- 사용하지 않게된 `gem`은 `Gemfile`에서 명시된 `gem`을 삭제한 후 위 명령어를 실행한다.



### file

* **db/seeds.rb**
  * db의 table이나 제약 조건들이 저장된다.
* **config/routes.rb**
  * 라우팅에 대한 정보가 저장된다. 예를 들어 클라이언트가 어떤 요청을 하면 그것을 특정 컨트롤러의 액션에 매칭시켜줄 수 있다.
* **log**
  * 서버에 대한 기록이 저장된다.
* **public**
  * 외부에서 접근 가능한 폴더
* **test**
  * TDD에 최적화 되어있다고 한다.
* **tmp**
  * image 파일이 저장된다.