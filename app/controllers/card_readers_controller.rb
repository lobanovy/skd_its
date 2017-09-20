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
    @events = (%x"curl -s #{@card_reader.address} |tr ':' ' '|tr '\n' ' '").split(' ')
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @card_reader}
     end
  end
  def new
  	@card_reader = CardReader.new
 end
  def create
    @card_reader = CardReader.new(card_reader_params)
    @card_reader_group = CardReaderGroup.new
    @card_reader_group.name = @card_reader.name
    
    if (@card_reader.save & @card_reader_group.save)
     @card_group = CardGroup.new
     @card_group.card_reader_id = CardReader.find_by(name: @card_reader.name).id
     @card_group.card_reader_group_id = CardReaderGroup.find_by(name: @card_reader.name).id
     @card_group.save
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
