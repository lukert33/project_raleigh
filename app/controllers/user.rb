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
  @page = User.farthest_page
  if request.xhr?
    erb :"page", layout:false
  else
    erb :"page"
  end
end

