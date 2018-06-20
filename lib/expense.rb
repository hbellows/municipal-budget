# require './lib/department'
# require './lib/budget_category'

class Expense
  attr_reader :department,
              :budget_category,
              :amount

  def initialize(dept, bc, amount)
    @department = dept
    @budget_category = bc
    @amount = amount
  end

end
