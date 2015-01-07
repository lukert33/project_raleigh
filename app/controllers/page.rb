get '/page/:id' do |id|
  @user = current_user
  @page = Page.find(id)
  if request.xhr?
    erb :'page', layout:false
  else
    erb :'page'
  end
end

post '/pages/:id/next' do |id|
  @user = current_user
  @page = Page.find(id)
  if @page.has_challenge?
    redirect "/challenge/#{@page.challenge.id}"
  else
    UserPage.find_or_create_by(user_id: @user.id, page_id: @page.next_page_id)
    redirect "/page/#{@page.next_page_id}"
  end
end

get '/pages/:id/next' do |id|
  page = Page.find(id)
  redirect "/page/#{page.next_in_backlog(current_user).id}"
end

get '/pages/:id/prev' do |id|
  @page = Page.find(id).user_prev_page(current_user)
  redirect "/page/#{@page.id}"
end
