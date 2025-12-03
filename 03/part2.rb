NUM_DIGITS = 12

result = readlines.map(&:to_s).map do |line|
  line = line.chomp
  digits = []
  search_start = 0

  NUM_DIGITS.times do |i|
    remaining_needed = NUM_DIGITS - (i + 1)

    chosen_digit = nil
    chosen_index = nil

    9.downto(1) do |d|
      idx = line.index(d.to_s, search_start)
      next if idx.nil?

      next if (line.size - 1 - idx) < remaining_needed

      chosen_digit = d
      chosen_index = idx
      break
    end

    break if chosen_digit.nil?

    digits << chosen_digit
    search_start = chosen_index + 1
  end

  while digits.size < NUM_DIGITS
    digits << 0
  end

  digits.reduce(0) { |acc, d| acc * 10 + d }
end.sum

puts result