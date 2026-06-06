class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @events = @category.events.includes(:venue, :organizer)
  end

  def new
    authorize! :create, Category
    @category = Category.new
  end

  def create
    authorize! :create, Category
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "Category created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize! :edit, @category
  end

  def update
    authorize! :update, @category

    if @category.update(category_params)
      redirect_to @category, notice: "Category updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! :destroy, @category

    if @category.events.any?
      redirect_to @category, alert: "Cannot delete category with existing events."
    else
      @category.destroy
      redirect_to categories_path, notice: "Category deleted successfully."
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end