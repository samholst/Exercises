class LemonadeStore

  def initialize
    @total_amount = 0
    @total_amount_with_tax = 0
    @tax_rate = 0.047
    @menu = {
             "Strawberry Lemonade" => {"Large" => 2.49, "Medium" => 1.99, "Small" => 1.49},
             "Rasberry Lemonade"   => {"Large" => 2.49, "Medium" => 1.99, "Small" => 1.49},
             "Pink Lemonade"       => {"Large" => 2.49, "Medium" => 1.99, "Small" => 1.49}
            }
    @subtypes = {
                "Extra Sugar" => 0.49, 
                "Protein Booster" => 0.75, 
                "Ice" => 0.00
                }
    display_menu
    choose_2_items
    anything_else
    display_amount
  end

  def display_menu
    @menu.each do |type, sizes|
      puts "#{type}:"
      sizes.each do |size, price|
        puts "    #{size}: $#{price.round(2)}"
      end
    end
  end

  def choose_2_items
    puts "\nWhich type of lemonade would you like?"
    @choice_lemonade = gets.chomp.split.map(&:capitalize).join(' ')

    puts "\nWhat size?"
    @choice_size = gets.chomp.split.map(&:capitalize).join(' ')

    display_subtypes

    puts "\n\nWould you like any of these added in your lemonade? (yes/no)"
    yes_or_no = gets.chomp.downcase

    if yes_or_no == "yes"
      puts "\nWhich one would you like?"
      @addon_choice = gets.split.map(&:capitalize).join(' ')
    end

  end  

  def display_amount
    @total_amount += @menu[@choice_lemonade][@choice_size]
    if @addon_choice
      @total_amount += @subtypes[@addon_choice]
    end
    puts "\n\n"
    puts "*" * 50
    puts "\nAmount before tax: $#{@total_amount.round(2)}.\n\n"
    @total_amount_with_tax += @total_amount + (@total_amount * @tax_rate)
    puts "Your total amount due is: $#{@total_amount_with_tax.round(2)}.\n\n"
    puts "*" * 50
    puts "Thank you for shopping at our lemonade store!"
  end

  def display_subtypes
    @subtypes.each do |item, price|
      puts "#{item}: $#{price.round(2)}"
    end
  end

  def anything_else
    puts "\n\nWe have 3 chocolate chip cookies for .99, would you like some? (yes/no)"
    yes_or_no_cookies = gets.chomp
    if yes_or_no_cookies == "yes"
      @total_amount += 0.99
    end
  end
end

puts "\n\nWelcome to our lemonade store!\n\n\n\n"
new_client = LemonadeStore.new