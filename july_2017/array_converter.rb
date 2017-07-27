require 'rspec'

# '*'' means take as many arrays as listed into an arguement.
def array_converter *arrays

  arrays.flatten.map(&:to_i)

  # The code above is the same as the code below. arrays.each would not work because
  # it will try and convert the whole array to an int, which is not possible. map will go 
  # throught each item in an array and convert them to an int.
  # 
  # arrays.flatten.map { |e| i.to_i }
  # 
  # OR
  # 
  # arrays.flatten.map do |i|
  #   i.to_i
  # end
end

describe 'Combine arrays and convert strings to integers' do
  it 'can take in a variable number of arrays and return a single array' do
    arr_1 = ['1', '5', '9']
    arr_2 = ['10', '2', '7', '10']
    arr_3 = ['3', '4', '0']
    expect(array_converter(arr_1, arr_2, arr_3).count).to eq(10)
    expect(array_converter(arr_1).first).to eq(1)
  end
end

@array = []
arr_1 = ['1', '5', '9']
arr_2 = ['10', '2', '7', '10']
arr_3 = ['3', '4', '0']

# This is the shovel, which is quicker than using .push
@array << arr_1
@array << arr_2

p @array
p @array.flatten
p arr_1.push(arr_2)
p arr_1.flatten.each {|x| x.to_i}