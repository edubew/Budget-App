class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def destroy
        category = Category.find(params[:id])
        category.destroy
        redirect_to categories_path, notice: "Deleted Category: #{category.name}"
    end
end