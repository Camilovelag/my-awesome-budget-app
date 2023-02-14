module EntitiesHelper
  def total_amount(entities)
    number_to_currency(entities.sum(&:amount))
  end
end
