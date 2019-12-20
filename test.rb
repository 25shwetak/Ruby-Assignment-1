class Account
  @@number = 23456789101

  def initialize
    @acc_number = @@number
    @balance = 0
  end

  def open_account
    @@number += 1
    @acc_number = @@number
  end

  def deposit_money(amount)
    @balance += amount
  end

  def withdraw_money(amount)
    if @balance <= 0 || @balance <= amount
      false
    else
      @balance -= amount
      true
    end
  end

  def get_balance
    @balance
  end

  def interest(rate,time)
    interst = (@balance*rate*time)/100
  end

  def type(account_type)
    @@typee = account_type
  end

  def give_type
   @@typee
  end

end

class Current_Account < Account

  def interest(rate, time)
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
    puts "Enter your name : "
    name = gets.chomp
    puts "Which type of account you want to open ?"
    puts "1. Savings"
    puts "2. Current"
    opt = gets.chomp.to_i
    acc_num = obj.open_account
    case opt
    when 1
      puts "Hi #{name}, your Savings Account has been opened and your account number is #{acc_num} ."
      obj.type(1)
    when 2
      puts "Hi #{name}, your Current Account has been opened and your account number is #{acc_num} ."
      obj.type(2)
    else
      puts "error"
    end

  when 2
    puts "Enter amount you want to deposit : "
    amount = gets.chomp.to_i
    obj.deposit_money(amount)

  when 3
    puts "Enter amount you want to withdraw : "
    amount = gets.chomp.to_i
    value = obj.withdraw_money(amount)
    if value == false
      puts "Sorry! You dont have sufficient balance to withdraw"
    end

  when 4
    bal = obj.get_balance
    puts "Your account balance is : #{bal}"

  when 5
    optt = obj.give_type
    if optt == 1
      puts "Enter months for which you want to calculate interest hello: "
      month = gets.to_i
      save_obj = Saving_Account.new
      interest = save_obj.interest(r=0.18,month)
      puts "Amount after calculating interest : #{interest}"

    else
      puts "Enter months for which you want to calculate interest : "
      month = gets.to_i
      cur_obj = Current_Account.new
      interest = cur_obj.interest(r=0.25,month)
      puts "Amount after calculating interest : #{interest}"

    end
  end

  if option == 6
    break
  end
end
