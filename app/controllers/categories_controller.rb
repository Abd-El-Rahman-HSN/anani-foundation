class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categorys= Category.all
  end

  def new
    @category= Category.new

  end

  def create
    @category=Category.new(categorys_params)
    if @category.save
      redirect_to(:action=>'index')
    else
      render('new')
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(categorys_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
    def categorys_params
      params.require(:category).permit(:name)
    end
end
