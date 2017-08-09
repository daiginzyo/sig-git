class VendingMachine
	
	def initialize
		@available_money = [10, 50, 100, 500, 1000]
		@drink = Hash.new(0)
		@drink_stock = Hash.new(0)
		@drink.store(:cola,120)
		@drink_stock.store(:cola,5)
		@total = 0
		@sale_proceeds = 0

	end

	def insert(money)
		if @available_money.include?(money)
			@total += money
		else
			puts "釣り銭 #{money}"
		end
	end

	def refund
		puts "釣り銭 #{@total}"
	end

	def check_stock
		@drink.each{|name, price|
			puts("#{name} #{price}円 #{@drink_stock[name]}個")
		}
	end

	def purchase(drink_name)
		if @total >= @drink[drink_name] && @drink_stock[drink_name] > 0
			@drink_stock[drink_name] -= 1
			@sale_proceeds += @drink[drink_name]
			@total -= @drink[drink_name]
			puts "釣り銭 #{@total}円"
		end
	end

	def purchasable?(drink_name)
		puts "購入可能" if @total >= @drink[drink_name] 
	end

	def purchasable_list
		@drink.each{|name, price|
			puts name if @total >= price && @drink_stock[name] > 0
		}
	end

	def get_sale_proceeds
		puts @sale_proceeds
	end

	def drink_store(drink_name, price, num)
		@drink.store(drink_name, price)
		@drink_stock.store(drink_name, num)
	end
end
