class Account
	@@number = 23456789101
	@@balance = 0
	def initialize
		@acc_number = @@number
	end

	def open_account
		@@number += 1
		@acc_number = @@number
	end

	def deposit_money(amount)
		@@balance += amount
	end

	def withdraw_money(amount)
		if @@balance <= 0 || @@balance <= amount
			return false
		else
			@@balance -= amount
			return true
		end
	end

	def get_balance
		return @@balance
	end

	def interest(rate,time)
		interst = (@@balance*rate*time)/100
	end

	def type(x)
		@@typee = x
	end

	def give_type
		return @@typee
	end

end

class Current_Account < Account

	def interest(rate,time)
		interst = super
	end

end

class Saving_Account < Account

	def interest(rate,time)
		interst = super
	end

end

loop do 

	puts "*****MENU*****"
	puts "1. Open Account"
	puts "2. Deposit Money"
	puts "3. Withdraw Money"
	puts "4. Get Balance"
	puts "5. Check Amount after rate of interest"
	puts "6. Exit"

	option = gets.to_i

	obj = Account.new

	case option
	when 1
		p "Enter your name : "
		name = gets.chomp
		p "Which type of account you want to open ?"
		p "1. Savings"
		p "2. Current"
		opt = gets.chomp.to_i
		acc_num = obj.open_account
		case opt
		when 1
			p "Hi #{name}, your Savings Account has been opened and your account number is #{acc_num} ."
			obj.type(1)
		when 2
			p "Hi #{name}, your Current Account has been opened and your account number is #{acc_num} ."
			obj.type(2)
		else
			p "error"
		end

	when 2
		p "Enter amount you want to deposit : "
		amount = gets.to_i
		obj.deposit_money(amount)

	when 3
		p "Enter amount you want to withdraw : "
		amount = gets.to_i
		value = obj.withdraw_money(amount)
		if value == false
			p "Sorry! You dont have sufficient balance to withdraw"
		end

	when 4
		bal = obj.get_balance
		p "Your account balance is : #{bal}"

	when 5
		optt = obj.give_type
  	if optt == 1
  		p "Enter months for which you want to calculate interest : "
  		month = gets.to_i
  		save_obj = Saving_Account.new
  		interest = save_obj.interest(r=0.18,month)
  		p "Amount after calculating interest : #{interest}"

  	else
  		p "Enter months for which you want to calculate interest : "
  		month = gets.to_i
  		cur_obj = Current_Account.new
  		interest = cur_obj.interest(r=0.25,month)
  		p "Amount after calculating interest : #{interest}"

  	end
	end

	if option == 6
		break
	end
end