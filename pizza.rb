class Topping
	attr_accessor :name, :vegetarian

	# Instantiate a new topping.
	#
	# name - The string name of the topping.
	#
	# Returns a new Topping object.
	def initialize(name, vegetarian: false)
		@name = name
		@vegetarian = vegetarian
	end
end

class Pizza
	attr_accessor :toppings

	# Instantiate a new pizza.
	#
	# toppings - An array containing Topping objects.
	#
	# Returns a new Pizza object.
	
	@@cheese = Topping.new('cheese', vegetarian: true)

	def initialize(toppings = [@@cheese])
		@toppings = toppings
	end
end


