class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    multiplier * @salary
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    sum = @employees.map {|employee| employee.salary}.sum
    sum * multiplier
  end
end

if $PROGRAM_NAME == __FILE__
  nick = Employee.new("Nick", "TA", 10000, "John")
  chris = Employee.new("Chris", "TA", 10000, "John")
  john = Manager.new("John", "Manager", 20000, "Ned", [nick, chris])
  p nick.bonus(2)
  p chris.bonus(2)
  p john.bonus(2)
end
