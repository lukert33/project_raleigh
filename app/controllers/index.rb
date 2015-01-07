get '/' do
  p "user_id >> #{session[:user_id]}"
  if !session[:user_id]
    erb :index
  else
    @user = User.find(session[:user_id])
    @page = @user.farthest_page
    erb :"page"
  end
end

post "/login" do
  user = User.find_by(username: params[:user][:username]) || User.find_by(email: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/"
  else
    set_error("Incorrect login credentials")
    redirect "/"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end

get '/user/new' do
  #byebug
  if request.xhr?
    erb :'user/signup', layout:false
  else
    erb :'user/signup'
  end
end

get '/user/:id' do |id|
  @user = User.find(id)
  @page = User.farthest_page
  if request.xhr?
    erb :'page', layout:false
  else
    erb :'page'
  end
end

post '/user' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  if @user.return_errors
    @error = @user.return_errors
    if request.xhr?
      erb :"user/signup", layout:false
    else
      erb :"user/signup"
    end

  else
    @page = @user.farthest_page
    if request.xhr?
      erb :"page", layout:false
    else
      erb :"page"
    end
  end
end




