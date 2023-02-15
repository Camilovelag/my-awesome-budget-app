module ApplicationHelper
  def page_title
    case [controller.controller_name, controller.action_name]
    when %w[groups new]
      'new category'
    when %w[groups index]
      'categories'
    when %w[entities new]
      'new transaction'
    when %w[entities index]
      'transactions'
    end
  end
end
