class Employee				#class defination and creation
	attr_accessor :x, :name          #in place of getter and setter
	
	@@class_val =2				#class variable
	def initialize(name,x)			#parameterized constructor
		puts "Object created"
		@name = name
		@x = x
	end

	public						#access specifiers  (public, private, protected)
	def policy             				#instance method
		p 'policy method called'
		Employee.salary				#class method calling
	end
	
	def self.salary					#class method
		p 'salary method called'
	end

	# def name                   			getter
	# 	@name
	# end

	# def set_name(name)          			setter
	# 	@name = name
	# end
end

obj = Employee.new('kumari',100000) 		#(object creation) object is an instance of class 

# puts obj.name

# obj.set_name('shweta')
# puts obj.name

# obj.name = 'Shweta'
# puts obj.name

# puts "Employee salary : #{obj.x}"
# obj.x = 50000
# puts obj.x

# puts obj.instance_variables			   to display instance variables in a class
# puts Employee.class_variables			   to display class variables in a class

obj.policy		 				#instance method calling
                                         
