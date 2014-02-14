# def range(start,finish)
#   arr = []
#   if start == finish
#     return arr
#   else
#     arr << start
#
#   end
#
#   p range(start+1, finish)
# end


def range(start,finish)
  if start == finish
    return [start]
  end

  prev_arr = range(start+1, finish)
  prev_arr << start
  return prev_arr
end

#p range(1,6)

def sum_of_array_iterate(arr)
  arr.inject(0) {|sum, i| sum += i}
end


def sum(arr)
  return arr[0] if arr.length == 1
  return arr[0] + sum(arr.drop(1))
end


def recursion_1(num, exp)
  return 1 if exp == 0

  return num * recursion_1(num, exp - 1)
end

def exp(b, n)
  return 1 if n == 0

  if n % 2 == 0 # even
    return exp(b,n/2) ** 2
  else
    return b * exp(b, (n-1) / 2) ** 2
  end
end


# p exp(2,3) #8
# p exp(3,3) #27
# p exp(2,4) #16


def deep_dup(arr)
  if !arr.is_a?(Array)
    return arr
  end

  duped_arr = []
  arr.each do |el|
    duped_arr << deep_dup(el)
  end

  return duped_arr
end

def short_deep_dup(arr)
  arr.map { |e| e.is_a?(Array) ? short_deep_dup(e) : e }
end

# p short_deep_dup([1, [2], [3, [4]]])

def fib_iterate(n)

  fib_nums = []
  i = 0
  fib_nums << 0 if n > 0
  fib_nums << 1 if n > 1
  while  i < n
    if i > 1
      fib_nums << fib_nums[i-1] + fib_nums[i-2]
    end
    i+= 1
  end

  fib_nums
end

def fib(n)
  #user enters 0
  return [0] if n == 0

  #base case
  return [0,1] if n == 1

  prev_arr = fib(n-1)
  prev_arr << prev_arr[-1] + prev_arr[-2]
end

# p fib(5)


def bsearch(array, target)
  return nil if array.empty?

  mid_point = array.length / 2

  if array[mid_point] == target
    return mid_point
  elsif target < array[mid_point]
    return bsearch(array.take(mid_point), target)
  else
    return bsearch(array.drop(mid_point), target) + mid_point
  end
end

# p bsearch([1,2,3,4,5,6,7], 1)

# def make_change(amt, coins)
#   return coins[0] if amt == 0
#
#   arr = []
#   remainder = amt % coins[0]
#   num_coins = amt / coins[0]
#   num_coins.times { |c| arr << make_change(remainder, coins.drop(1)) }
#
#   return arr
#   #make_change(remainder, coins.drop(1))
# end

def make_change(amt, coins)
  return [] if amt == 0

  best = nil

  coins.each do |c|
    next if c > amt
    attempt = make_change(amt - c, coins) + [c]
    if best.nil?
      best = attempt
    elsif attempt.length < best.length
      best = attempt
    end
  end

  return best
end

#p make_change(39, [25,10,5,1]) # => [25, 10, 1, 1, 1, 1]


def merge_sort(arr)
  return arr if arr.length < 2

  arr1 = merge_sort(arr.take(arr.length/2))
  arr2 = merge_sort(arr.drop(arr.length/2))

  return merge(arr1,arr2)
end

def merge(arr1,arr2)
  final = []

  until arr1.empty? or arr2.empty?
    if arr1[0] < arr2[0]
      final << arr1.shift
    else
      final << arr2.shift
    end
  end

  final + arr1 + arr2
end

#p merge_sort([2,5,3,6,3,1,5,3,5,1,6])


def subsets(arr)
  return [[]] if arr.empty?

  new_arr = subsets(arr.take(arr.length-1))

  out_arr = []
  new_arr.each do |a|
    out_arr << a
    out_arr << a + [arr.last]
  end

  out_arr
end

p subsets([1, 2, 3])













