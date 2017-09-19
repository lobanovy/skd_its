class CardGroupsController < ApplicationController
  def index
  	@card_groups = CardGroup.all
  	respond_to do |format|
    	   format.html # index.html.erb
           format.json { render json: @card_groups }
    end
  end
  def show
  @card_group = CardGroup.find(params[:id])
  end 
  def new
  	@card_group = CardGroup.new
  end
  def create
    @card_group = CardGroup.new(card_group_params)
    if @card_group.save
     redirect_to @card_group
    else
     render 'new'
    end
  end 
  def destroy
    @card_group = CardGroup.find(params[:id])
    @card_group.destroy
    redirect_to card_groups_path
  end
  private
    def card_group_params
        params.require(:card_group).permit(:card_reader_id, :card_reader_group_id)
    end
end
