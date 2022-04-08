class ReservesController < ApplicationController
  def new
    @reserve = Reserve.new
    @day = (params[:end].to_date - params[:start].to_date).to_i
    @price = @day * params[:price].to_i * params[:pepole].to_i
  end

  def create
    @reserve = Reserve.new(reserve_params)
    if @reserve.save!
     redirect_to reserves_path
    else
     render :new
   end
  end
  
   def index
    @reserve = Reserve.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  private
  def reserve_params
    params.require(:reserve).permit(:start, :end, :pepole).merge(user_id: current_user.id,post_id: current_user.id)
  end
  
end
