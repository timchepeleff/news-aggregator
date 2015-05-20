require "sinatra"
require "csv"
articles = CSV.read('articles.csv')




get "/articles" do
  erb :index, locals: { articles: articles }
end

get "/articles/new/" do
 erb :new, locals: {}
end

post '/articles/new/post' do
  article = params['article']
  url = params['url']
  description = params['description']


  CSV.open('articles.csv', 'a') do |csv|
    csv << [article, url, description]
    puts
  end

  redirect '/articles'
end
