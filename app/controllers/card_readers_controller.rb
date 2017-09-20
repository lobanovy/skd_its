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
    #Зчитування подій з контролера та запис їх у стрічковий масив
    @raw_events = (%x"curl -s #{@card_reader.address} |tr ':' ' '|tr '\n' ' '").split(' ')
    # Якщо контролер відповів:
    if @raw_events.length > 0
      # То обнуляється лічильник невдалих спроб
      @card_reader.failure_count = 0
      @card_reader.save 
      i = 0
      while i < @raw_events.length
        event = Event.new
        event.address = @card_reader.address
        event.time = @raw_events[i].to_i
        event.card_id = @raw_events[i+1].to_i
        event.time_end = @raw_events[i+2].to_i
        if event.time !=0
          rec = Event.where(:address => event.address, :time => event.time, :card_id => event.card_id).exists?
          if (!rec)
            event.save
          else
            event = Event.find_by(address: event.address, time: event.time, card_id: event.card_id)
            if (@raw_events[i+2].to_i) != (event.time_end) 
              event.time_end = @raw_events[i+2].to_i
              event.save
            end  
          end
        end  
        i = i + 3
      end
    else
      @card_reader.failure_count = @card_reader.failure_count + 1
      @card_reader.save 
    end 
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
