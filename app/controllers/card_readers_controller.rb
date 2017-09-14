class CardReadersController < ApplicationController
  def index
  	@card_readers = CardReader.all
    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @card_readers }
    end
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
  def destroy
      @card_reader = CardReader.find(params[:id])
      @card_reader.destroy
      redirect_to card_readers_path
  end

  private
  def card_reader_params
      params.require(:card_reader).permit(:address, :name)
   end
end
