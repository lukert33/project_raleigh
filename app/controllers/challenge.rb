get '/challenge/:id' do |id|
  @challenge = Challenge.find(id)
  if request.xhr?
    erb :'challenge', layout:false
  else
    erb :'challenge'
  end
end

post '/challenge/user_challenge/:id' do |id|
  UserChallenge.create(params[:user_challenge])
end

get '/challenge/result/:id' do |id|
  user_challenge = UserChallenge.find(id)
  if user_challenge.success
    @page = user_challenge.success_page
  else
    @page = user_challenge.fail_page
  end
  redirect "/page/#{@page.id}"
end
