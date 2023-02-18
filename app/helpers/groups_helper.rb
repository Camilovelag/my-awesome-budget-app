module GroupsHelper
  def total_amount_per_category(group)
    @entities = Entity.includes(:entity_groups).where(entity_groups: { group_id: group.id })
    number_to_currency(@entities.sum(&:amount))
  end
end
