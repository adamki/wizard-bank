require "minitest/autorun"
require "minitest/pride"
require "./wizarding_bank"

class WizrdingBankTest < Minitest::Test
  def test_person_has_a_name_and_cash
    person = Person.new("Minerva", 1000)
    assert_equal 1000, person.cash
    assert_equal "Minerva", person.name
  end

  def test_it_can_return_persons_status
    person = Person.new("Minerva", 1000)
    status = "Minerva has 1000 galleons of cash."
    assert_equal status, person.status
  end

  def test_there_can_be_multiple_persons
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 500)
    refute person1 == person2
  end

  def test_bank_has_a_name
    bank = Bank.new("WellsFargo")
    assert_equal "WellsFargo", bank.name
  end

  def test_bank_has_a_different_name
    bank = Bank.new("Chase")
    assert_equal "Chase", bank.name
  end

  def test_bank_has_a_open_account_method
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 500)
    result =  bank.open_account(person)
    assert_equal "An account has been opened for Minerva with JP Morgan Chase.", result
  end

  def test_deposit_works
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)

    bank.open_account(person)
    bank.deposit(person, 250)

    assert_equal 750, person.cash
    assert_equal 250, person.bank_balance
  end

  def test_a_person_can_not_deposit_more_than_they_have
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)
    expect = "Minerva does not have enough cash to perform this deposit."
    assert_equal expect, bank.deposit(person, 1100)
  end

  def test_that_a_person_can_withdraw
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)

    bank.open_account(person)
    bank.deposit(person, 1000)
    assert_equal 1000, person.bank_balance
    assert_equal 0, person.cash


    bank.withdrawal(person, 250)
    assert_equal 750, person.bank_balance
  end

  def test_a_person_can_not_withdraw_more_than_they_have
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)
    expect ="Insufficient funds."
    assert_equal expect, bank.withdrawal(person, 25000)
  end


end
