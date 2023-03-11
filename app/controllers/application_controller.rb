class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    Category.find_or_create_by(task:'cook dinner').to_json
  end

  post '/category' do
    category = Category.create(task:params[:task])
    category.to_json 
  end

  patch '/category/:id' do
    category = Category.find(params[:id])
    category.update(
      task: params[:task]
    )
    category.to_json
  end

  delete '/category/:id' do
    category = Category.find(params[:id])
    category.destroy
    category.to_json
  end

end
