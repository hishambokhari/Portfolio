class GitPortfoliosController < ApplicationController

  def index
    @portfolio_items = GitPortfolio.all
  end
end
