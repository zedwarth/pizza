class Pizza
	attr_accessor :toppings, :delivery_time

	def initialize( toppings = [ Topping.new('cheese', vegetarian: true) ] )
		@toppings = toppings
		@deliver_time = nil
	end

	def vegetarian?
		@toppings.all? { |topping| topping.vegetarian == true }
	end

	def add_topping(topping)
		@toppings << topping
	end

	def deliver!(now = Time.now)
		@delivery_time = now + 60 * 30
	end

	def late?
		if @delivery_time == nil || @delivery_time >= Time.now
			false
		else
			true
		end
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

