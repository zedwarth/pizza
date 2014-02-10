class Pizza
	attr_accessor :toppings

	def initialize( toppings = [ Topping.new('cheese', vegetarian: true) ] )
		@toppings = toppings
	end

	def vegetarian?
		@toppings.all? { |topping| topping.vegetarian == true }
	end

	def add_topping(topping)
		@toppings << topping
	end
end


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

