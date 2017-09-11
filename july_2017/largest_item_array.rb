require 'rspec'
require 'benchmark'

arr = Array.new(1_000) {rand 1000}

def new_max array_of_elements
  biggest_number_in_array = 0

  array_of_elements.map do |n|
    n > biggest_number_in_array ? biggest_number_in_array = n : ""
  end

  biggest_number_in_array
end

# Test to see how fast the results are with the method
Benchmark.bm(10) do |x|
  x.report('Each: ') {new_max arr}
  x.report('Sorted: ') {arr.sort.last}
  x.report('Max: ') {arr.max}
end

describe 'New Max method' do
  it 'returns the max value from an array efficiently' do
    test_array = [2, 4, 10, 3, 1]
    expect(new_max(test_array)).to eq(10)
  end
end
