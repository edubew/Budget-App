class CategoriesController < ApplicationController
    before_action :authenticate_user!, only: [:index]

    def index
        @categories = Category.all
    end

    def show
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to categories_path, notice: 'Category was successfully created!!'
        else
            @errors = @category.errors.full_messages
            render :new, alert: @errors
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path, notice: "Deleted Category: #{@category.name}"
    end

    private

    def category_params
      params.require(:category).permit(:name, :icon)
    end
end