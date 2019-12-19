class Restaurant
  @@menu_card = {"rajma_chawal"=>200,"dal_chawal"=>150,"Italian_Pizza"=>250,"Veg_cheese_Burger"=>70}
  @@id = {1=>"rajma_chawal",2=>"dal_chawal",3=>"Italian_Pizza",4=>"Veg_cheese_Burger"}
  @@status = {1=>"available",2=>"available",3=>"available",4=>"available"}
  @@count = {1=>2,2=>2,3=>2,4=>2}
  @@my_cart = []

  public
  def self.menu_card_items
    i = 1
    puts "Item   ->   price"
    puts " "
    @@menu_card.each do |key,value|
      p "#{i} : #{key}  ->  #{@@menu_card[key]}"
      i += 1
      puts " "
    end
  end


  def self.order_items
    puts "Enter ID of food item you want to order : "
    food = gets.to_i
    if @@count[food]>0
      @@status[food] = "ordered"
      @@my_cart.push(food)
      @@count[food] -= 1
      puts "Food Ordered. Want to check order status ?"
      ans = gets.chomp
      if ans == "yes"
        puts "status : #{@@status[food]}"
      end
    else
      puts "Sorry the item is not available"
    end
  end


  def self.check_availability
    @@count.each do |key,value|
      if @@count[key]>0
        puts @@id[key]
      end
    end
  end


  def self.change_status
    puts "Enter ID of food item and status you want to assign to food item: "
    food = gets.to_i
    status = gets.chomp
    @@status[food] = status
    puts "order status changed. Want to verify ?"
    ans = gets.chomp
    if ans=="yes"
      puts "status : #{@@status[food]}"
    end
  end

  def self.cart
    hashh = [0,0,0,0,0,0,0,0,0,0]
    @@my_cart.each do |a|
      hashh[a] += 1
    end

    for i in 0..hashh.length do
      if hashh[i] != 0
        puts "#{@@id[i]}   ->   #{hashh[i]}"
      end
    end
  end

  def show_menu
    loop do
      puts "*****MENU*****"
      puts "1. See menu card items"
      puts "2. Order food item"
      puts "3. Food Items available for ordering"
      puts "4. Change order status"
      puts "5. Go to my cart"
      puts "6. Exit"
      option = gets.to_i
      case option
      when 1
        Restaurant.menu_card_items
      when 2
        Restaurant.order_items
      when 3
        Restaurant.check_availability
      when 4
        Restaurant.change_status
      when 5
        Restaurant.cart
      end
      if option == 6
        break
      end
    end
  end
end


obj = Restaurant.new()
obj.show_menu()
