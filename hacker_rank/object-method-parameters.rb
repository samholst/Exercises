class Integer
  def range? *data
    if data.length <= 1
      return false
    elsif data[0] <= self && self <= data[1]
      return true
    elsif data[1] <= self && self <= data[0]
      return true
    else
      return false
    end
  end
end

arr = "5 2 6"

arr = arr.split(/ /).map{|s| s.to_i }

arr[0].range?(arr[1], arr[2])


# ARGF.each_with_index do |line, idx|    
# class Integer
#     extends self
#   def range? *data
#     if data.length <= 1
#       return false
#     elsif data[0] <= self && self <= data[1]
#       return true
#     elsif data[1] <= self && self <= data[0]
#      return true
#     else
#      return false
#     end
#   end
# end
#
# arr = line.split(/ /).map{|s| s.to_i }
#
# return arr[0].range? arr[1], arr[2]
#
# end
