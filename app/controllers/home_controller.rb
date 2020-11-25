class HomeController < ApplicationController
  def index
    agent = Mechanize.new
    page = agent.get("https://basketballking.jp/news/category/bl")
    @elements = page.search('.news-category-list__vertical__title')
  end

  def chat
    @tweets = Tweet.all
    @teams = Team.all
  end

  def game
  end
end
