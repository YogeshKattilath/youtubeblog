class CategoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_category, only: [:show, :edit, :update, :destroy ]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path
		else
			render action: :new
		end
	end

	def edit
		
	end

	def update
    	if @category.update_attributes(category_params)
	      	redirect_to categories_path
    	else
      		render action: :edit
    	end
  end

	def destroy
		if @category.destroy
      		redirect_to categories_path
    	end
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

	def find_category
		@category = Category.find(params[:id])		
	end
end
