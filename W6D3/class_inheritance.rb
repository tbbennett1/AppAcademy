#class inheritence
class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary, self.boss = name, title, salary, boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employees(self) unless boss.nil?

    boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end
end



class Manager < Employee
    attr_reader :employee_arr
    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @employee_arr = []
    end

    def add_employees(employee)
        employee_arr << employee
        employee
    end
      
    def bonus(multiplier)
        self.total_subsalary * multiplier
    end

    def total_subsalary
    total_subsalary = 0
    self.employee_arr.each do |employee|
      if employee.is_a?(Manager)
        total_subsalary += employee.salary + employee.total_subsalary
      else
        total_subsalary += employee.salary
      end
    end

    total_subsalary
  end

    def inspect
      @name = name
    end
end

ned = Manager.new("Ned", "CEO", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)


#ned [darren[david, shawna]]
darren.add_employees(david)
darren.add_employees(shawna)
