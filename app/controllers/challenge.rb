get '/challenge/:id' do |id|
  @challenge = Challenge.find(id)
  if request.xhr?
    erb :'challenge', layout:false
  else
    erb :'challenge'
  end
end

post '/challenge/user_challenge/:id' |id|
  UserChallenge.create(params[:user_challenge])
end