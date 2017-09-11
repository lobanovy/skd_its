class CardGroupsController < ApplicationController
  def index
  end
  def new
  	@card_group = CardGroup.new
  end
end
