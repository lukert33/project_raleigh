get "/challenge/test" do
  erb :"challenge/color-meter"
end

get '/challenge/:id' do |id|
  @challenge = Challenge.find(id)
  if request.xhr?
    erb :'challenge', layout:false
  else
    erb :'challenge'
  end
end

post '/user_challenge/:id' do |id|
  @challenge = Challenge.find(id)
  @result = UserChallenge.create(user_id: current_user.id, challenge_id: @challenge.id, success:params)
  if @result.success
    redirect "/page/#{@challenge.success_page.id}"
  else
    redirect "page/#{@challenge.fail_page.id}"
  end
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
