class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entities = Entity.includes(:entity_groups).where(entity_groups: { group_id: params[:group_id] },
                                                      author_id: current_user.id).order(created_at: :desc)
  end

  def new
    @groups = Group.where(user_id: current_user.id)
    @entity = Entity.new
    @entity_group = EntityGroup.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id
    @groups_array = entity_group_params

    if @groups_array.empty?
      redirect_to new_group_entity_path(params[:group_id]), alert: 'Please, add at least 1 category.'
    else
      render :new unless @entity.save

      @groups_array.each do |group|
        temp = EntityGroup.new(entity_id: @entity.id, group_id: group)
        render :new unless temp.save
      end
      redirect_to group_entities_path(@groups_array.first), notice: 'Transaction successfully created!'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end

  def entity_group_params
    @array = params.require(:entity_group).permit(group_id: [])
    @array[:group_id].drop(1)
  end
end
