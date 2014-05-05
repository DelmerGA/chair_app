class ChairsController < ApplicationController
  before_filter :authenticate_user!
	
  def index
    if user_signed_in?
		  @chairs = Chair.all
    else
      redirect_to "/home"
    end
	end

	def show
		@chair = Chair.find(params[:id])
		#should show all available items
	end

	def new
		@chair = Chair.new
	end

	def create 
		@chair = Chair.create chair_params
		redirect_to chair_path(@chair)
	end

	def edit
    @chair = Chair.find(params[:id])
  end

  def update
    chair = Chair.find(params[:id])
    #not sure what attributes is doing here
    chair.update_attributes chair_params 
    redirect_to(chair)
  end

  def destroy
    chair = Chair.find(params[:id])
    chair.delete
    redirect_to(chairs_path)
  end

private
   def chair_params
   	params.require(:chair).permit(:name, :description, :image)
   end
end
