class CardReadersController < ApplicationController
  def index
  	@card_readers = CardReader.all
   end	
   def show
     @card_reader = CardReader.find(params[:id])
   end
  def new
  	@card_reader = CardReader.new
   end
   def create
    @card_reader = CardReader.new(card_reader_params)
    if @card_reader.save
     redirect_to @card_reader
    else
     render 'new'
    end
  end

  private
  def card_reader_params
      params.require(:card_reader).permit(:address, :name, :card_reader_group_id)
   end
end
