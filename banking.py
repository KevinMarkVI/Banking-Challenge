



class Bank(object):
	def __init__(self, bank_name):
		self.bank_name = bank_name
		self.account_list = {}
		print "%s bank was just created." % (bank_name)

	def open_account(self, human):
		self.human = human
		self.account_list[human.person_name] = 0
		print "%s, thanks for opening an account at %s!" % (human.person_name, self.bank_name)

	
	def deposit(self, human, deposit_amount):
		self.deposit_amount = deposit_amount
		if human.savings < deposit_amount:
			print "%s does not have enough cash to deposit $%d." % (human.person_name, deposit_amount)
		else:
			self.account_list[human.person_name] += deposit_amount
			human.savings -= deposit_amount
			print "%s depostied $%d to %s. %s has $%d. %s's account has $%d." % (human.person_name, deposit_amount, self.bank_name, human.person_name, human.savings, human.person_name, self.account_list[human.person_name])
	
	
	def withdrawl(self, human, withdrawl_amount):
		self.withdrawl_amount = withdrawl_amount
		if self.account_list[human.person_name] < withdrawl_amount:
			print "%s does not have enough money in the account to withdraw $%d." % (human.person_name, withdrawl_amount)
		else:
			self.account_list[human.person_name] -= withdrawl_amount
			human.savings += withdrawl_amount
			print "%s withdrew $%d from %s. %s has %d. %s's account has $%d" % (human.person_name, withdrawl_amount, self.bank_name, human.person_name, human.savings, human.person_name, self.account_list[human.person_name])

		
	def transfer(self, human, bank, transfer_amount):
		self.bank = bank
		self.transfer_amount = transfer_amount
		self.account_list[human.person_name] -= transfer_amount
		bank.account_list[human.person_name] += transfer_amount
		print "%s transfered $%d from the %s to the %s account. The %s account has $%d and the %s account has $%d." % (human.person_name, transfer_amount, self.bank_name, bank.bank_name, self.bank_name, self.account_list[human.person_name], bank.bank_name, bank.account_list[human.person_name])


	def total_cash_in_bank(self):
		total = 0
		accounts = self.account_list
		values = accounts.values()
		for i in values:
			total += i
			print "%s has $%d in the bank." % (self.bank_name, total)
			
class Person(object):
	def __init__(self, person_name, savings):
		self.person_name = person_name
		self.savings = savings
		print "Hi, %s. You have $%d" % (person_name, savings)
		
mom = Person("Barb", 100000000)
me = Person("Kevin", 1000)
chase = Bank("JP Morgan Chase")
wells_fargo = Bank("Wells Fargo")
chase.open_account(me)
wells_fargo.open_account(mom)
wells_fargo.open_account(me)
chase.deposit(me, 200)
wells_fargo.deposit(mom, 5000)
chase.withdrawl(me, 100)
chase.transfer(me, wells_fargo, 50)
chase.total_cash_in_bank()


