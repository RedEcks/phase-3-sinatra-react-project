class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    category = Category.all
    category.to_json
  end

  post '/task' do
    category = Category.find_or_create_by(name:params["Category"])
    task=Task.create(name: params["Task"], category:category)
    Task.all.to_json
  end

  patch '/task/:id' do
    category = Category.find(params[:id])
    category.update(
      task: params[:task]
    )
    category.to_json
  end

  delete '/task/:id' do
    category = Category.find(params[:id])
    category.destroy
    category.to_json
  end

end
