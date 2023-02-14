class EntitiesController < ApplicationController
  def index
    @entities = Entity.where(author_id: current_user.id).order(created_at: :desc)
  end

  def new
    @groups = Group.all
    @entity = Entity.new
    @entity_group = EntityGroup.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id
    @groups_array = entity_group_params
    if @entity.save
      @groups_array.each do |group|
        Entity_group.create(entity_id: @entity.id, group_id: group.id)
      end
      redirect_to entities_path, notice: 'Transaction successfully created!'
    else
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end

  def entity_group_params
    params.require(:entity_group).permit(group_ids: [])
  end
end
