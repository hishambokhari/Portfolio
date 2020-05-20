class GitPortfoliosController < ApplicationController

  def index
    @portfolio_items = GitPortfolio.all
  end

  def new
    @portfolio_item = GitPortfolio.new
  end
  
  def create
    @portfolio_item = GitPortfolio.new(params.require(:git_portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to git_portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @portfolio_item = GitPortfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:git_portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to git_portfolios_path , notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def edit
    @portfolio_item = GitPortfolio.find(params[:id])
  end
end
