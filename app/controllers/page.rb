get '/page/:id' do |id|
  @page = Page.find(id)
  if @user.read_pages.last.id < id
    @user.read_pages << @page
  end
  if request.xhr?
    erb :'page', layout:false
  else
    erb :'page'
  end
end