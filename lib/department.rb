class Department
  attr_reader :name,
              :expenses

  def initialize(name)
    @name = name
    @expenses = []
  end

end
