class AlibabaHabibib
  def initialize
    @original_list = ["Owen", "Michael", "Austin", "Kalani", "Colton", "Cassidy", "Eric", "Sam", "Zach", "Devon"]
    @num_of_people = ["Owen", "Michael", "Austin", "Kalani", "Colton", "Cassidy", "Eric", "Sam", "Zach", "Devon"]
    @animals = ["Lamb", "Tiger", "Cow", "Dragon", "Manticore"]
    create_magic
  end

   def create_magic
      while @num_of_people.count > 1 do
        animorph      
    end
  end

  def animal_select
    @animals[rand (0..4)]  
  end

  def animorph
    case animal_select
      when "Lamb"
        puts 'The Village is safe for now! Pheeeew!'
        puts "#{@num_of_people.count} remaining.\n\n"
      when "Tiger"
        puts '1 random unlucky villager is eaten!'
        dead_person = @num_of_people.delete_at(rand(0..(@num_of_people.count - 1)))
        puts "#{dead_person} is now dead. #{@num_of_people.count} remaining.\n\n"
      when "Cow"
        puts 'The villagers at the cow'
        dead_person = @num_of_people.delete_at(rand(0..(@num_of_people.count - 1)))
        puts "#{dead_person} is now dead. #{@num_of_people.count} remaining.\n\n"
      when "Dragon"
        puts "*" * 50
        puts "The Dragon ate two villagers!!!!!!!!!!!"
        dead_person = @num_of_people.delete_at(rand(0..(@num_of_people.count - 1)))
        dead_person2 = @num_of_people.delete_at(rand(0..(@num_of_people.count - 1)))
        puts "#{dead_person} & #{dead_person2} are now dead. #{@num_of_people.count} remaining."
        puts "*" * 50
        puts "\n"
      when "Manticore"
        puts "Another villager magically reincarnates!"
        @num_of_people.push(@original_list[rand(0..(@original_list.count - 1))])
        puts "#{@num_of_people.count} remaining.\n\n"
    end
  end
end

animal_select = AlibabaHabibib.new