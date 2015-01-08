get '/challenge/:id' do |id|
  @challenge = Challenge.find(id)
  if request.xhr?
    erb :"challenge/single", layout:false
  else
    erb :"challenge/single"
  end
end

post '/user_challenge/:id' do |id|
  @challenge = Challenge.find(id)
  @result = UserChallenge.create(user_id: current_user.id, challenge_id: @challenge.id, success:params)
  if @result.success
    UserPage.create(user_id: session[:user_id], page_id: @challenge.success_next_id )
    byebug
    redirect "/page/#{@challenge.success_next_id}"
  else
    UserPage.create(user_id: session[:user_id], page_id: @challenge.fail_next_id)
    redirect "page/#{@challenge.fail_next_id}"
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
