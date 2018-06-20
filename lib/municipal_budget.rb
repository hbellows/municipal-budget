class MunicipalBudget
  attr_reader :expenses,
              :departments,
              :budget_categories

  def initialize
    @expenses = []
    @departments = []
    @budget_categories = []
  end

  def add_expense(expense)
    @expenses << expense
  end

  def add_department(department)
    @departments << department
  end

  def add_budget_category(budget_category)
    @budget_categories << budget_category
  end

  def total_expenses
    @expenses.inject(0) do |total, expense|
       total + expense.amount.to_f
    end
  end

  def alphabetical_budget_categories
    @budget_categories.sort_by do |budget_category|
      budget_category.name
    end
  end

end
