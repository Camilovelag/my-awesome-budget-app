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
    render :new unless @entity.save

    if @groups_array.length > 1
      @groups_array.each do |group|
        EntityGroup.create(entity_id: @entity.id, group_id: group)
      end
      redirect_to group_entities_path(params[:group_id]), notice: 'Transaction successfully created!'
    else
      redirect_to new_group_entity_path(params[:group_id]), alert: 'Please, add at least 1 category'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end

  def entity_group_params
    @array = params.require(:entity_group).permit(group_id: [])
    @array[:group_id]
  end
end
