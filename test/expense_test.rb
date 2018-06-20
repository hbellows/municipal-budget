require 'minitest/autorun'
require 'minitest/pride'
require './lib/expense'
require './lib/department'
require './lib/budget_category'

class ExpenseTest < Minitest::Test

  def test_it_exists
    dept = Department.new("Parks and Recreation")
    bc = BudgetCategory.new("Appliances")

    expense = Expense.new(dept, bc, "656.50")

    assert_instance_of Expense, expense
  end

  def test_it_has_a_department
    dept = Department.new("Parks and Recreation")
    bc = BudgetCategory.new("Appliances")
    expense = Expense.new(dept, bc, "656.50")

    assert_equal dept, expense.department
  end

  def test_it_has_a_budget_category
    dept = Department.new("Parks and Recreation")
    bc = BudgetCategory.new("Appliances")
    expense = Expense.new(dept, bc, "656.50")

    assert_equal bc, expense.budget_category
  end

  def test_it_has_an_amount
    dept = Department.new("Parks and Recreation")
    bc = BudgetCategory.new("Appliances")
    expense = Expense.new(dept, bc, "656.50")

    assert_equal "656.50", expense.amount
  end

end
