class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %I[index, show, upvote]
  def index
    @cocktails = Cocktail.all.order(votes: :desc)
  end

  def show
    @cocktail = Cocktail.find(params[:id])

  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to new_cocktail_dose_path(@cocktail)
  end

  def upvote
    @cocktail.votes += 1
    @cocktail.save
    redirect_to root_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :vote)
  end
end
