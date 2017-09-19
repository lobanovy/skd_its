class CardsController < ApplicationController
	def index
  	@cards = Card.all
    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @cards }
    end
   end	
  def show
     @card = Card.find(params[:id])
   end
  def new
  	@card = Card.new
 end
  def create
    @card = Card.new(card_params)
    @card.card_id = %x'curl 192.168.1.171'
    if @card.save
     redirect_to @card
    else
     render 'new'
    end
  end 
  
  private
   def card_params
      params.require(:card).permit(:card_reader_group_id, :card_id, :time_end, :zone, :user_name)
   end
    
end