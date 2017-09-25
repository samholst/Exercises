require 'rspec'

# As the Engineering Lead
#
# I want to be able to view when the entire team is available for all 30 minute increments so that I know when best to schedule a team discussion.
#
# Given our development hours are 8:30-5:00, with lunch from 12:00-1:00, we have 6 engineers on our team with appointments at 9:00-9:30, 9:00-11:30, 10:00-11:00, 2:30-3:00, 2:30-3:30
#
# When I execute my script I get an array of times in 30 minute increments when my entire team is available.
#
# Expected Behavior for story
#
# You will create a method called team_availability that takes a single parameter of an array of arrays consisting of start and end times.
#
# When I execute the function below
#
# team_availability([['9:00', '9:30'], ['9:00', '11:30'], ['10:00', '11:00'], ['2:30', '3:00'], ['2:30', '3:30']])
#
# I am returned an array of arrays
#
# [['8:30', '9:00'], ['11:30', '12:00'], ['1:00', '1:30'], ['1:30', '2:00'], ['2:00', '2:30'], ['3:30', '4:00']]

def team_availability arr
  schedule_arr = [
                  ['8:30', '9:00'],   ['9:00', '9:30'],   ['9:30', '10:00'],
                  ['10:00', '10:30'], ['10:30', '11:00'], ['11:30', '12:00'],
                  ['1:00', '1:30'],   ['1:30', '2:00'],   ['2:00', '2:30'],
                  ['2:30', '3:00'],   ['3:00', '3:30'],   ['3:30', '4:00'],
                 ]

  # schedule_arr.each do |pair|
  #   arr.each do |pair_2|
  #     if pair_2 == pair
  #       schedule_arr.delete(pair)
  #     end
  #   end
  # end

  arr.each do |start_time, end_time|
    schedule_arr.delete_if { |start_time_2, end_time_2| (start_time >= start_time_2 && end_time_2 <= end_time ) }
  end


  schedule_arr
end

p Time.parse("9:30 AM")


describe 'team schedule' do
  xit 'returns an array of available times' do
    arr_taken = [['9:00', '9:30'], ['9:00', '11:30'], ['10:00', '11:00'], ['2:30', '3:00'], ['2:30', '3:30']]
    answer_key = [['8:30', '9:00'], ['11:30', '12:00'], ['1:00', '1:30'], ['1:30', '2:00'], ['2:00', '2:30'], ['3:30', '4:00']]
    expect(team_availability arr_taken).to eq(answer_key)
  end

  it 'returns an array of available times' do
    arr_taken = [['9:00', '10:00']]
    answer_key = [
                    ['8:30', '9:00'],
                    ['10:00', '10:30'], ['10:30', '11:00'], ['11:30', '12:00'],
                    ['1:00', '1:30'],   ['1:30', '2:00'],   ['2:00', '2:30'],
                    ['2:30', '3:00'],   ['3:00', '3:30'],   ['3:30', '4:00'],
                   ]
    expect(team_availability arr_taken).to eq(answer_key)
  end
end
