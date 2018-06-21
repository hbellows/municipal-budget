require 'minitest/autorun'
require 'minitest/pride'
require './lib/municipal_budget'
require './lib/department'
require './lib/budget_category'
require './lib/expense'


class MunicipalBudgetTest < Minitest::Test

  def test_it_exists
    municipal_budget = MunicipalBudget.new

    assert_instance_of MunicipalBudget, municipal_budget
  end

  def test_it_starts_with_no_expenses
    municipal_budget = MunicipalBudget.new

    assert_equal [], municipal_budget.expenses
  end

  def test_it_has_expenses
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")
    expense_1 = Expense.new(department, budget_category, "656.50")

    municipal_budget.add_expense(expense_1)

    assert_equal [expense_1], municipal_budget.expenses
    assert_equal 1, municipal_budget.expenses.count

    expense_2 = Expense.new(department, budget_category, "20.45")
    municipal_budget.add_expense(expense_2)

    assert_equal [expense_1, expense_2], municipal_budget.expenses
    assert_equal 2, municipal_budget.expenses.count
  end

  def test_it_has_departments
    municipal_budget = MunicipalBudget.new
    department_1 = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")
    expense_1 = Expense.new(department_1, budget_category, "656.50")

    municipal_budget.add_expense(expense_1)

    assert_equal [expense_1], municipal_budget.expenses
    assert_equal 1, municipal_budget.expenses.count

    department_2 = Department.new("Forest")
    expense_2 = Expense.new(department_2, budget_category, "20.45")
    municipal_budget.add_expense(expense_2)

    assert_equal [department_1, department_2], municipal_budget.departments
  end

  def test_it_has_budget_categories
    municipal_budget = MunicipalBudget.new
    department_1 = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")
    expense_1 = Expense.new(department_1, budget_category, "656.50")

    municipal_budget.add_expense(expense_1)

    assert_equal [expense_1], municipal_budget.expenses
    assert_equal 1, municipal_budget.expenses.count

    department_2 = Department.new("Forest")
    expense_2 = Expense.new(department_2, budget_category, "20.45")
    municipal_budget.add_expense(expense_2)

    assert_equal [budget_category, budget_category], municipal_budget.budget_categories
  end

  def test_it_can_calculate_expenses
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category_1 = BudgetCategory.new("Printing")
    expense_1 = Expense.new(department, budget_category_1, "656.50")

    budget_category_2 = BudgetCategory.new("Appliances")
    expense_2 = Expense.new(department, budget_category_2, "20.45")

    municipal_budget.add_expense(expense_1)
    municipal_budget.add_expense(expense_2)

    assert_equal 676.95, municipal_budget.total_expenses
  end

  def test_it_can_organize_budget_categories_alphabetically
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category_1 = BudgetCategory.new("Printing")
    expense_1 = Expense.new(department, budget_category_1, "656.50")

    budget_category_2 = BudgetCategory.new("Appliances")
    expense_2 = Expense.new(department, budget_category_2, "20.45")

    municipal_budget.add_expense(expense_1)
    municipal_budget.add_expense(expense_2)

    assert_equal ["Appliances", "Printing"], municipal_budget.alphabetical_budget_categories
  end
end
