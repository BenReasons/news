require "httparty"

url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=468f712111694cd8a42245681807ac81"
news = HTTParty.get(url).parsed_response.to_hash
current_news = news["articles"]

articles = []

for article in current_news
    articles << "#{article["title"]} #{article["url"]}"
end

pp articles.slice(0,5)