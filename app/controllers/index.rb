get '/' do
  p "user_id #{session[:user_id]}"
  if !session[:user_id]
    erb :index
  else
    @user = User.find(session[:user_id])
    @page = @user.farthest_page
    erb :"page"
  end
end

get '/user/new' do
  if request.xhr?
    erb :'signup', layout:false
  else
    erb :'signup'
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
  if @user.return_errors
    return @user.return_errors
  end

  @page = User.farthest_page
  if request.xhr?
    erb :"page", layout:false
  else
    erb :"page"
  end
end




