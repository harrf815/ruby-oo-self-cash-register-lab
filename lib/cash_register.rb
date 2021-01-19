require 'pry'

class CashRegister 

    attr_accessor :total, :discount, :price, :cart

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
        @only_title = []
        @transaction = []
    end

    def add_item(title, price, quantity=1)
        added_item = {}
        added_item[:title] = title 
        added_item[:price] = price 
        added_item[:quantity] = quantity

        @transaction << price 
        @cart << added_item
        quantity.times {@only_title << title}
        
        @total += price * quantity
    end

    def apply_discount 
        if discount == 0
            return "There is no discount to apply."
        else 
            @total -= @total * @discount / 100
            return "After the discount, the total comes to $#{@total}."
        end 
    end

    def items 
        @only_title
    end

    def void_last_transaction
        if @transaction == 0 
            return 0.0
        else 
            self.total = @total - @transaction.pop 
        end 
    end
    
end

