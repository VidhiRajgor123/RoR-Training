$global_var = "GLOBAL"
class State
    @@no_of_state = 0
    def initialize(name)
        @state_name=name
        @@no_of_state += 1
    end
    def
        display()
        puts "State name is #@state_name"
    end
    def
        no_of_states()
        puts "Total number of states written : #@@no_of_state"
    end
end
class Country
    def print
        puts "Global variable in country is #$global_var"
    end
end
class Nation
    def print
        puts "Global variable in nation is #$global_var"
    end
end

first = State.new("Gujarat")
second = State.new("Goa")
third = State.new("Assam")
fourth = State.new("Bihar")

first.no_of_states();
second.no_of_states();
third.no_of_states();
fourth.no_of_states();

first.display();
second.display();
third.display();
fourth.display();

obj1 = Country.new;
obj2 = Nation.new;
obj1.print();
obj2.print();