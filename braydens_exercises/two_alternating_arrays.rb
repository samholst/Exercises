def alternate_arrays arr1, arr2
  remix_array = []
  max_length = arr1.length > arr2.length ? arr1.length : arr2.length

  max_length.times do |i|
    i < arr1.length ? remix_array << arr1[i] : ""
    i < arr2.length ? remix_array << arr2[i] : ""
  end
  remix_array
end

array_numbers = [1, 2, 3]
array_letters = ["a", "b", "c", "d"]

p alternate_arrays array_numbers, array_letters
