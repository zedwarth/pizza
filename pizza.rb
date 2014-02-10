class Pizza
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
