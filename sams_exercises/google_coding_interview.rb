arr = [1,2,3,9]
arr_2 = [1,1,11,334,33,22,2,4,4,15,44,33,10]

def find_sum(num_set, sum)
  comp = []

  num_set.each do |n|
    if comp.include?(n)
      return true
    end
    comp.push(sum - n)
  end
  return false
end

find_sum(arr_2, 25)
# find_sum(arr, 25)
