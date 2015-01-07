get '/page/:id' do |id|
  @user = current_user
  @page = Page.find(id)
  unless @user.read_pages.include?(@page)
    UserPage.create(user_id: @user.id, page_id: @page.id)
  end
  if request.xhr?
    erb :'page', layout:false
  else
    erb :'page'
  end
end

get '/page/:id/next' do |id|
  @page = Page.find(id).next_page
  redirect "/page/#{@page.id}"
end

get '/page/:id/prev' do |id|
  @page = Page.find(id).prev_page
  redirect "/page/#{@page.id}"
end
