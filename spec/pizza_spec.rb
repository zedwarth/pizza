require './pizza'
require 'pry-debugger'

describe Pizza do

	it "exists" do
		expect(Pizza).to be_a(Class)
	end

	describe '.initialize' do

		it 'records all of the toppings' do
			toppings = [
				Topping.new('mushrooms', vegetarian: true),
				Topping.new('pepperoni')
			]
			
			pizza = Pizza.new(toppings)

			expect(pizza.toppings).to eq(toppings)
		end

		it 'defaults the toppings to cheese only, if the pizza has no toppings' do
			pizza = Pizza.new

			expect(pizza.toppings.size).to eq(1)
			expect(pizza.toppings.first.name).to eq('cheese')
		end
	end

	describe 'vegetarian?' do

		it "can determine if all the toppings are vegetarian" do
			toppings1 = [
				Topping.new('mushrooms', vegetarian: true),
				Topping.new('green peppers', vegetarian: true),
				Topping.new('onions', vegetarian: true)
			]

			toppings2 = [
				Topping.new('mushrooms', vegetarian: true),
				Topping.new('pepperoni'),
				Topping.new('green peppers', vegetarian: true)
			]


			pizza1 = Pizza.new(toppings1)
			pizza2 = Pizza.new(toppings2)

			expect(pizza1.vegetarian?).to eq (true)
			expect(pizza2.vegetarian?).to eq (false)
		end
	end

	describe 'add_topping' do
		it "can have toppings added to it" do
			pepperoni = Topping.new("pepperoni")
			bacon = Topping.new("bacon")

			pizza = Pizza.new([pepperoni])

			pizza.add_topping(bacon)

			expect(pizza.toppings.include?(bacon)).to eq(true)
		end
	end

	describe 'deliver!' do
		it 'marks a delivery time' do
			pizza = Pizza.new([Topping.new("bacon")])

			# Mark a pizza for delivery
			now = Time.now
			pizza.deliver!(now)

			# Pizza delivery time is 30 from now.
			expect(pizza.delivery_time).to eq(now + 60 * 30)
		end

		it "sets a boolean value for whether or not it's late" do
			pizza = Pizza.new([Topping.new("bacon")])

			expect(pizza.late?).to eq(false)

			# Set now to 30 minutes in the past
			now = Time.now - 60 * 30
			
			pizza.deliever!(now)

			expect(pizza.late?).to eq(true)
		end
	end
end

describe Topping do
	describe '.initialize' do
		it 'sets the name of the topping' do
			topping = Topping.new('olives')

			expect(topping.name).to eq('olives')
		end

		it 'sets whether or not the topping is vegetarian' do
			topping = Topping.new 'bell peppers', vegetarian: true

			expect(topping.vegetarian).to eq(true)
		end
	end

	it "exists" do
		expect(Topping).to be_a(Class)
	end
end
