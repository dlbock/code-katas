def fibonacci_recursive(number)
  return 0 if number.zero?
  return 1 if number == 1
  fibonacci(number - 1) + fibonacci(number - 2)
end

def fibonacci_iterative(number)
  return 0 if number.zero?
  return 1 if number == 1

  prev_of_prev = 0
  prev = 1
  result = 0
  (2..number).each do |n|
    result = prev_of_prev + prev
    prev_of_prev = prev
    prev = result
  end
  result
end

def print_fib(number)
  (1..number).each do |n|
    puts fibonacci_iterative(n)
  end
end

if ARGV.size < 1
  puts "Please include how many fibonacci numbers you would like to print. Usage: fibonacci <number>"
  exit 42
end

print_fib(ARGV.shift.to_i)