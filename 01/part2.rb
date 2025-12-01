count = 0
current = 50

readlines.map(&:to_s).each do |operation|
    direction, value = operation[0], operation[1..].to_i
    prev = current
    current = current + (direction == 'L' ? -value : value)
    if current > 0
        round = (current.abs() / 100).floor() 
        count += round
    elsif current < 0
        round = ((current.abs() + 100) / 100).floor()
        count += round
        count -= 1 if prev == 0 # for case that start with 0 already
    else
        count += 1
    end
    current = ((current % 100) + 100) % 100
end

puts count