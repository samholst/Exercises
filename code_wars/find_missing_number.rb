require 'rspec'
require 'pry'

# Function Name: missingNO
# Input: an array, [1, 2, …, 100] with one number between 1 and 100 missing.
# Output: an integer, the “missing” number in the array
# Example: missingNo([1, 3, …, 100]) => 2 if the array was missing the number 2. Please include in your submission a test array with number 66 missing.
# The array may not be sorted.
# The removal of a number from the bag is totally random, there is no way to tell what number it was by the process of removing it (e.g. you cannot feel what number is written on the tile)
# You may look in the bag of number tiles and interact with the contents once the random number is removed. So, you can lay all of the tiles out,
# Always remember to explain your code and the thought processes behind it!
# What if your interviewer had follow-up questions or extensions to this challenge? Don’t anticipate what exactly those follow-ups or changes may be, but try to write your code so that it is easily read, easily maintained, and can be adapted to potential modifications in the interviewer’s questioning.
#
# word = "sort the inner content in descending order"

def missingNO arr
  new_arr = arr.sort
  missing_number = 0
  i = 1

  new_arr.each do |n|
    if n != (new_arr[i] - 1)
      missing_number = n + 1
      break
    end
    i += 1
  end

  missing_number
end

describe "finds missing number in the random array" do
  it "finds the missing sequential number 4 in the array" do
    arr_1 = [1,2,3,5,6]
    expect(missingNO(arr_1)).to eq(4)
  end

  it "finds the missing sequential number 13 in the array" do
    arr_2 = [10,11,12,14,18,17,20,19,15,16]
    expect(missingNO(arr_2)).to eq(13)
  end

  it "finds the missing sequential number 55 in the array" do
    arr_3 = (1..54).to_a + (56..100).to_a
    expect(missingNO(arr_3)).to eq(55)
  end

  it "finds the missing sequential number 100 in the array" do
    arr_4 = (1..55).to_a + (56..99).to_a + [101]
    expect(missingNO(arr_4)).to eq(100)
  end
end
