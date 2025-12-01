count = 0
current = 50

readlines.map(&:to_s).each do |operation|
    direction, value = operation[0], operation[1..].to_i % 100
    current = (current + (direction == 'L' ? -value : value) + 100) % 100
    count += 1 if current == 0
end

puts count