module Check_applicability

  def loan_applicability?(population, gdp, states, state)
    return true if population > 200000 && gdp >= 20000 && states >= 5 && state == "developing"
    false
  end

  def seat_applicability?(population, gdp, states, state)
    return true if population > 200000 && gdp >= 10000 && states >= 8 && state == "developed"
    false
  end

  def win_war?(population, states, army_strength)
    return true if population > 50000 && states >= 10 && army_strength >= 20000
    false
  end

end

class Country
  extend Check_applicability

  attr_accessor :Population, :GDP, :States, :Army_Strength, :State_of_country, :country_name, :country_code
  @@code = 0

  def initialize (population, gdp, states, army_strength, state, country_name)
    @Population = population
    @GDP = gdp
    @States = states
    @Army_Strength = army_strength
    @State_of_country = state
    @country_name = country_name
    @country_code = @@code
  end

  def code
    @@code += 1
    @country_code = @@code
  end

end

countries = []

def create_object

  puts "Enter Country name :"
  country_name = gets.chomp
  puts "Enter Population of the Country :"
  population = gets.to_i
  puts "Enter GDP :"
  gdp = gets.to_i
  puts "Enter number of States in the country :"
  states = gets.to_i
  puts "Enter Strength of Army :"
  army_strength = gets.to_i
  puts "What is the state of country (developing/developed)? :"
  state = gets.chomp
  country_object = Country.new(population, gdp, states, army_strength, state, country_name)
  puts "The country code of #{country_name} is #{country_object.code}"
  return country_object

end

loop do
  puts "********MENU********"
  puts "1. Enter details of Country"
  puts "2. Show details of the Country"
  puts "3. Check applicability of the country"
  puts "4. Exit"

  option = gets.to_i
  case option
  when 1
    countries.push(create_object)

  when 2
    puts "Enter code of country you want to see details"
    code = gets.to_i

    if code <= 0 || code > countries.size
      puts "Sorry! No country with this code exist. "
    else
      code -= 1
      puts "Country name : #{countries[code].country_name} (code : #{countries[code].country_code})"
      puts "Population of #{countries[code].country_name} is : #{countries[code].Population}"
      puts "GDP of #{countries[code].country_name} is : #{countries[code].GDP}"
      puts "Number of States in #{countries[code].country_name} is : #{countries[code].States}"
      puts "Strength of Army in #{countries[code].country_name} is : #{countries[code].Army_Strength}"
      puts "State of #{countries[code].country_name} is : #{countries[code].State_of_country}"
    end

  when 3
    puts "Enter code of country you want to check ?"
    code = gets.to_i

    if code <= 0 || code > countries.size
      puts "Sorry! No country with this code exist. "
    else
      code -= 1
      loop do
        puts "1. Check whether #{countries[code].country_name} is applicable for getting loan ?"
        puts "2. Check whether #{countries[code].country_name} is applicable for having seat in UN Security council ?"
        puts "3. Check whether #{countries[code].country_name} can win the war or not ?"
        puts "4. Exit"

        option1 = gets.to_i
        case option1
        when 1
          answer = Country.loan_applicability?(countries[code].Population, countries[code].GDP, countries[code].States, countries[code].State_of_country)
          if answer == true
            puts "#{countries[code].country_name} is applicable for getting loan from IMF or WB"
          else
            puts "#{countries[code].country_name} is not applicable for getting loan from IMF or WB"
          end

        when 2
          answer = Country.seat_applicability?(countries[code].Population, countries[code].GDP, countries[code].States, countries[code].State_of_country)
          if answer == true
            puts "#{countries[code].country_name} is applicable for having seat in UN Security council"
          else
            puts "#{countries[code].country_name} is not applicable for having seat in UN Security council"
          end

        when 3
          answer = Country.win_war?(countries[code].Population, countries[code].States, countries[code].Army_Strength)
          if answer == true
            puts "#{countries[code].country_name} can win the war"
          else
            puts "#{countries[code].country_name} cannot win the war"
          end

        end
        if option1 == 4
          break
        end

      end

    end

  end
  if option == 4
    break
  end
end
