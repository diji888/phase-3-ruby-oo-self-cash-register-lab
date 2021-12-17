class CashRegister
    attr_accessor :discount, :total, :title, :price, :items, :last_transaction
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price*quantity
        quantity.times{|n| self.items << title}
        self.last_transaction = price*quantity
    end

    def apply_discount
        if self.discount != 0
            percent = (self.discount.to_f)/100
            self.total -= self.total*percent
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end 
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
    
end