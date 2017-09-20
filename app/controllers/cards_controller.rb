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
    @card.card_id = %x'curl 192.168.1.2'
    # Перевірка чи є прив'язка групи до контролера, та чи вставлена картка у рідер
    if ((CardGroup.where(:card_reader_group_id => @card.card_reader_group_id).exists?) and ( @card.card_id != 0))
        # Перевірка чи існує вже картка у базі та її деактивація якщо вона активна
        if Card.where(:enable => "1").find_by(card_id: @card.card_id)
    	     @card_temp = Card.new
    	     @card_temp = Card.where(:enable => "1").find_by(card_id: @card.card_id)
    		 @card_temp.enable = "0"
    		 @card_temp.save
    	end	
    	
        if @card.save
           redirect_to @card
        else
          render 'new'
        end
    else
    	redirect_to @card
    end	
  end 
  
  private
   def card_params
      params.require(:card).permit(:card_reader_group_id, :card_id, :time_end, :zone, :user_name)
   end
    
end