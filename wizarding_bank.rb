
class Person

  attr_accessor :cash, :name, :bank_balance

  def initialize(name, cash)
    @cash = cash
    @name = name
    @bank_balance = 0
  end

  def status
    "#{name} has #{cash} galleons of cash."
  end

  # def bank_balance(person, amount)
  #   @cash -= amount
  #   @bank_balance += amount
  # end

  def deposit(amount)
    @cash -= amount
    @bank_balance += amount
  end
end

#============================================================================

class Bank

  attr_accessor :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def open_account(person)
    @customers << person
    "An account has been opened for #{person.name} with #{name}."
  end

  def deposit(person, amount)
    if amount > person.cash
      "#{person.name} does not have enough cash to perform this deposit."
    else
      person.deposit(amount)
    end
  end

  def withdrawal(person, amount)
    if amount > person.bank_balance
      "Insufficient funds."
    else
      person.bank_balance -= amount
      person.cash += amount
    end
  end



end
