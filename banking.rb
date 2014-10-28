class Bank
  attr_accessor :bank_name
  attr_accessor :account_list

  def initialize(bank_name)
    @bank_name = bank_name
    @account_list = {}
    puts "#{@bank_name} bank was just created."
  end
    
  def open_account(human)
    @human = human
    @account_list[human.person_name] = 0
    puts "#{human.person_name}, thanks for opening an account at #{@bank_name}."
  end
    
  def deposit(human, deposit_amount)
      @deposit_amount = deposit_amount
      if human.savings < @deposit_amount
        puts "#{human.person_name} does not have enough cash to deposit $#{@deposit_amount}"
      else
        @account_list[human.person_name] += @deposit_amount
        human.savings -= @deposit_amount
        puts "#{human.person_name} deposited $#{@deposit_amount} to #{@bank_name}. #{human.person_name} has $#{human.savings} and #{human.person_name}'s account has #{@account_list[human.person_name]}."
      end
  end
  
  def withdrawl(human, withdrawl_amount)
    @withdrawl_amount = withdrawl_amount
    if @account_list[human.person_name] < @withdrawl_amount
      puts "#{human.person_name} does not have enough money in the account to withdraw $#{@withdrawl_amount}"
    else
      @account_list[human.person_name] -= @withdrawl_amount
      human.savings += @withdrawl_amount
      puts "#{human.person_name} withdrew $#{@withdrawl_amount} from #{@bank_name}. #{human.person_name} has #{human.savings}. #{human.person_name}'s account has $#{@account_list[human.person_name]}."
    end
  end
  
  def transfer(human, bank, transfer_amount)
    @bank = bank
    @transfer_amount = transfer_amount
    @account_list[human.person_name] -= @transfer_amount
    bank.account_list[human.person_name] += @transfer_amount 
    puts "#{human.person_name} transfered $#{@transfer_amount} from the #{@bank_name} to the #{bank.bank_name} account. The #{@bank_name} account has $#{@account_list[human.person_name]} and the #{bank.bank_name} account has $#{bank.account_list[human.person_name]}."
  end

  def total_cash_in_bank
    total = 0
    accounts = @account_list.values
    for i in accounts
      total += i
    end
    puts "#{@bank_name} has $#{total} in the bank."
  end
  
end

class Person
  attr_accessor :person_name
  attr_accessor :savings
  
  def initialize(person_name, savings)
    @person_name = person_name
    @savings = savings
    puts "Hi, #{@person_name}. You have $#{@savings}."
  end
end

chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")

me = Person.new("Kevin", 1000)
brother = Person.new("Trevor", 100000)

wells_fargo.open_account(brother)
wells_fargo.open_account(me)
chase.open_account(me)

wells_fargo.deposit(brother, 1000)
wells_fargo.deposit(me, 200)

wells_fargo.withdrawl(me, 75)

wells_fargo.transfer(me, chase, 50)

wells_fargo.total_cash_in_bank
chase.total_cash_in_bank