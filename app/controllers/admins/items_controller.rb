class Admins::ItemsController < ApplicationController

	def new
		@item = Item.new
	end

	def index
		if params[:search].present?
			@items = Item.where('name LIKE ?', "%#{params[:search]}%")
		else
			@items = Item.all
		end
	end

	def show
		@item = Item.find(params[:id])		
	end

	def edit
		@item = Item.find(params[:id])
	end

	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to admins_items_path
	end

	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to admins_items_path
	end

	private
	def item_params
  		params.require(:item).permit(:genre_id, :name, :introduction, 
  			:sale_status, :price, :image)
	end


end
