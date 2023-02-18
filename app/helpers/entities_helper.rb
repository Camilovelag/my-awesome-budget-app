module EntitiesHelper
  def total_amount_per_transaction(entities)
    number_to_currency(entities.sum(&:amount))
  end
end
