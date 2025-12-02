values = readline.split(',').flat_map { |range|
    start_num, end_num = range.split('-').map { |v| v.strip.to_i }
    (start_num..end_num).to_a
}
repeated_pattern = /^(.+)\1+$/
result = values.select { |value| value.to_s.match?(repeated_pattern) }.sum

puts result