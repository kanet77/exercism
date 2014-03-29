def eat(meal, &consume)
  if consume
    meal.each { |food| consume.call(food) }
  end
  "delicious!"
end

puts eat(['cheese', 'steak', 'wine']) { |food|
  puts "Mmm, #{food}"
}

puts eat(['cheese'])