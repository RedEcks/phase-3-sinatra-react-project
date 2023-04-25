class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/categories" do
    categories = Category.all
    categories.to_json(:include => :tasks)
  end

  delete '/category/:id' do
    category = Category.find(params[:id])
    category.destroy
    category.to_json
  end

  post '/category/:name' do
    category = Category.new(name: params["name"])
    category.save
    category.to_json
  end

end
