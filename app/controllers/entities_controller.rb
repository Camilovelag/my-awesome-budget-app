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
    if @entity.save
      @groups_array.each do |group|
        temp = EntityGroup.create(entity_id: @entity.id, group_id: group)
        temp.save
      end
    else
      render :new
    end
    if @groups_array.empty?
      render :new
    else
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
