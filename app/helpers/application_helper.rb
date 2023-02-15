module ApplicationHelper
  def page_title
    case [controller.controller_name, controller.action_name]
    when %w[groups new]
      'NEW CATEGORY'
    when %w[groups index]
      'CATEGORIES'
    when %w[entities new]
      'NEW TRANSACTION'
    when %w[entities index]
      'TRANSACTIONS'
    end
  end
end
