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
    when %w[registrations new]
      'REGISTER'
    when %w[sessions new]
      'LOGIN'
    end
  end
end
