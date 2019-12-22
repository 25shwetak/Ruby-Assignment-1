# frozen_string_literal: true

class Account
  @@number = 100

  attr_accessor :account_number
  attr_reader :balance

  def initialize
    @account_number = @@number
    @balance = 0
  end

  def open_account
    @@number += 1
    @account_number = @@number
  end

  def deposit_money(amount)
    @balance += amount
  end

  def withdraw_money(amount)
    return false if @balance <= 0 || @balance <= amount

    @balance -= amount
    true
  end

  def interest(balance, rate, time)
    (balance * rate * time) / 100
  end

  def type(account_type)
    @@typee = account_type
  end

  def give_type
    @@typee
  end
end

class Current_Account < Account
  def interest(balance, rate, time)
    super
  end
end

class Saving_Account < Account
  def interest(balance, rate, time)
    super
  end
end

def openAccount
  puts 'Enter your name : '
  name = gets.chomp
  puts 'Which type of account you want to open ?'
  puts '1. Savings'
  puts '2. Current'
  opt = gets.chomp.to_i

  case opt
  when 1
    user_object = Saving_Account.new
    user_object.type(1)
    account_num = user_object.open_account
    puts "Hi #{name}, your Savings Account has been opened and your account number is #{account_num} ."
    user_object
  when 2
    user_object = Current_Account.new
    user_object.type(2)
    account_num = user_object.open_account
    puts "Hi #{name}, your Current Account has been opened and your account number is #{account_num} ."
    user_object
  else
    puts 'error'
  end
end

users = []

puts 'How many custumers you want ?'
count = gets.to_i
(0..count - 1).each do |_i|
  users.push(openAccount)
end

def show_all_users(users)
  users.each do |user|
    puts "#{user.account_number} , #{user.balance}"
  end
end

int = 0
loop do
  puts '*****MENU*****'
  puts '1. Deposit Money'
  puts '2. Withdraw Money'
  puts '3. Get Balance'
  puts '4. Check Amount after rate of interest'
  puts '5. Show all users details'
  puts '6. Switch'
  puts '7. Exit'

  option = gets.to_i

  case option
  when 1
    puts 'Enter amount you want to deposit : '
    amount = gets.chomp.to_i
    users[int].deposit_money(amount)

  when 2
    puts 'Enter amount you want to withdraw : '
    amount = gets.chomp.to_i
    value = users[int].withdraw_money(amount)
    puts 'Sorry! You dont have sufficient balance to withdraw' if value == false

  when 3
    puts "Your account balance is : #{users[int].balance}"

  when 4
    optt = users[int].give_type
    if optt == 1
      puts 'Enter months for which you want to calculate interest : '
      month = gets.to_i
      save_obj = Saving_Account.new
      interest = save_obj.interest(users[int].balance, r = 0.18, month)
      puts "Amount after calculating interest : #{interest}"

    else
      puts 'Enter months for which you want to calculate interest : '
      month = gets.to_i
      cur_obj = Current_Account.new
      interest = cur_obj.interest(users[int].balance, r = 0.25, month)
      puts "Amount after calculating interest : #{interest}"

    end

  when 5
    puts 'Account Number , Balance'
    show_all_users(users)

  when 6
    puts 'Enter account number you want to switch : '
    acc_num = gets.to_i
    tempacc_num = acc_num
    acc_num -= 101

    if acc_num >= 0 && acc_num <= users.size - 1
      int = acc_num
      puts "Switched to account number #{tempacc_num} "
    else
      puts 'Invalid acc number'
    end
  end

  if option == 7
    flag = true
    break
  end
end
