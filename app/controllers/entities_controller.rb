class EntitiesController < ApplicationController
  def index
    @entities = Entity.where(author_id: current_user.id).order(created_at: :desc)
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id
    if @entity.save
      redirect_to entities_path, notice: 'Transaction successfully created!'
    else
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
