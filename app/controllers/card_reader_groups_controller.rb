class CardReaderGroupsController < ApplicationController
def index
  @card_reader_groups = CardReaderGroup.all
  @card_groups = CardGroup.all
  respond_to do |format|
         format.html # index.html.erb
         format.json { render json: @card_reader_groups }
    end
  end
  def show
  @card_reader_group = CardReaderGroup.find(params[:id])
  end 
  def new
    @card_reader_group = CardReaderGroup.new
  end
  def create
    @card_reader_group = CardReaderGroup.new(card_reader_group_params)
    if @card_reader_group.save
     redirect_to @card_reader_group
    else
     render 'new'
    end
  end
  def destroy
    @card_reader_group = CardReaderGroup.find(params[:id])
    @card_reader_group.destroy
    redirect_to card_reader_groups_path
  end

  private
  def card_reader_group_params
      params.require(:card_reader_group).permit(:name)
  end
end