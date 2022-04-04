class DealinputController < ApplicationController
  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      redirect_to result_path, notice: "契約を提携しました"
    else
      render :new
  end
end
  private 

  def deal_params
    params.require(:deal).permit(:time, :money)
  end 
end
