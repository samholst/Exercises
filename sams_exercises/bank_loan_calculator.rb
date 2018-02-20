def calculate_mortgage(target:, interest:, loan_amount:, months:)
  amount_paid = 0
  mortgage_left = loan_amount
  
  1.upto(target) do |period|
    amount_paid += (loan_amount * ((interest * (1 + interest) ** months ) / (( 1 + interest ) ** months - 1)))
    # puts "#{period}: #{amount_paid.round(2)}"
    # mortgage_left -= (4.75 / 12) * period * months * loan_amount
  end
  
  puts "Amount Paid: #{amount_paid.round(2)}    Interest: %#{interest}       Pay Periods: #{target}"
  # puts "Mortgage Left: #{mortgage_left.round(2)}"
end

calculate_mortgage target: 72, interest: 0.00450, loan_amount: 200_000, months: 360
calculate_mortgage target: 72, interest: 0.00475, loan_amount: 200_000, months: 360
calculate_mortgage target: 72, interest: 0.00500, loan_amount: 200_000, months: 360
