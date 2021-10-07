class Waiter
    @@all = []

    def self.all
        @@all
    end

    attr_reader :name
    attr_accessor :experience

    def initialize(name, experience)
        @name, @experience = name, experience
        self.save
    end

    def save
        !self.class.all.include?(self) ? self.class.all.push(self) : "Error: instance duplicate."
    end

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.find_all{|meal|meal.waiter == self}
    end

    def best_tipper
        best_tip = self.meals.max_by(&:tip)
        best_tip.customer
    end
end