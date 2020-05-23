class GitPortfoliosController < ApplicationController

  def index
    @portfolio_items = GitPortfolio.all
  end

  def angular
    @angular_portfolio_items = GitPortfolio.angular
  end

  def new
    @portfolio_item = GitPortfolio.new
    3.times { @portfolio_item.technologies.build }
  end
  
  def create
    @portfolio_item = GitPortfolio.new(params.require(:git_portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

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

  def show
    @portfolio_item = GitPortfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = GitPortfolio.find(params[:id])

    @portfolio_item.destroy
    
    respond_to do |format|
      format.html { redirect_to git_portfolios_url, notice: 'Portfolio was removed.' }
    end
  end
end
