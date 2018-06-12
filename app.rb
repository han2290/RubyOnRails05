require 'sinatra'
require 'sinatra/reloader'
require 'csv'

get '/' do
    erb :index
end

get 'boards/new' do
    erb :new_board
end

post '/boards/create' do
    #사용자가 입력한 정보를 받아서
    #csv 파일 가장 마지막에 등록
    # => 이 글의 글번호도 같이 저장해야함
    # => 기존의 글 개수를 파악해서 
    # => 글 개수 + 1 해서 저장
    
    title = params[:title]
    contents = params[:contents]
    idx = CSV.read('./boards.csv').count.to_i + 1
    puts "입력: "+ idx.to_s + title.to_s + contents.to_s
    
    CSV.open('./boards.csv','a+') do |row|
        row << [idx, title, contents]
    end
    
    redirect '/boards'
end

get '/boards' do
    #file을 읽기모드로 열기
    #각 줄마다 순회
    #@ 변수에 값을 넣어줌
    @boards = []
    
    CSV.open('./boards.csv', 'r+').each do |row|
        @boards << row
    end
    
    erb :boards
end

get '/board/:id' do
    #csv파일에서 params[:id]로 넘어온 친구와
    #같은 글번호를 가진 row를 선택
    #csv파일을 전체 순회한다.
    #csv파일을 순회하다가 첫번째 col이 id와 같은 순간
    #순회를 정지하고 값을 변수에 저장한다.
    @board = []
    CSV.read('./boards.csv').each do |row|
        if params[:id]==row[0]
            @board = row
            break 
        end
    end
    puts @board
    erb :board
end


#User CRUD============================================

get '/user/new' do
    erb :new_user
end

post '/user/create' do
    id = params[:id].to_s
    pw = params[:password].to_s
    pw_cfrm = params[:password_cfrm].to_s
    @users=[]
    if pw.eql?pw_cfrm#만약 비밀번호를 올바르게 입력했다면
        
        CSV.read('./users.csv', 'r').each do |row|
            @users << row[0]
        end
        
        unless @users.include?id
            user = [id, pw]
            CSV.open('./users.csv', 'a+') do |row|
                row << user
            end
            redirect '/users'
        else
            @msg = "이미 존재하는 ID 입니다."
            erb :new_user
        end
        
        
        
    else #비밀번호 틀릴시
        @msg = "회원가입에 실패했습니다."
        erb :new_user
    end
end

get '/users' do
    @users = []
    CSV.read('./users.csv','r+').each do |row|
        @users << row
    end
    erb :users
end

get '/user/:id' do
    CSV.read('./users.csv','r+').each do |row|
        if row[0].eql?params[:id]
            @user = row
            break
        end
    end
    erb :user
end
    