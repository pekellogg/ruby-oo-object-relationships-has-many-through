class Meal
    @@all = []

    def self.all
        @@all
    end

    attr_reader :waiter, :customer, :total, :tip
    
    def initialize(waiter, customer, total, tip)
        @waiter, @customer, @total, @tip = waiter, customer, total, tip
        self.save
    end

    def save
        self.class.all << self
    end
end

# lauren = Waiter.new("Lauren", 3)

# alex = Waiter.new("Alex", 1)
# meal1 = Meal.new(lauren, peyton, 300, 10)
# meal2 = Meal.new(peyton, lauren, 8000000, 10)
# meal3 = Meal.new(alex, lauren, 500, 250)
# Meal.all


