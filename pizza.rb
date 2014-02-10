class Pizza
end

class Topping
	attr_accessor :name

	# Instantiate a new topping.
	#
	# name - The string name of the topping.
	#
	# Returns a new Topping object.
	def initialize(name)
		@name = name
	end
end
