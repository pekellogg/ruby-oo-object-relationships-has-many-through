class Customer

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :age
    attr_reader :name

    def initialize(name, age)
        @name, @age = name, age
        self.save
    end

    def save
        !self.class.all.include?(self) ? self.class.all.push(self) : "Error: instance duplicate."
    end

    def new_meal(waiter, total, tip)
        meal = Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.find_all{|meal|meal.customer == self}
    end

    def waiters
        self.meals.map{|meal|meal.waiter}
    end

end
