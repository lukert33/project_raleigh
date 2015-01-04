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




