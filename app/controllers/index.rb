get '/' do
  if !session[:user_id]
    erb :index
  else
    @user = User.find(session[:user_id])
    @page = Page.find(@user.farthest_page.id)
    erb :"page"
  end
end




