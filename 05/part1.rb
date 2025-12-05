fresh_list = []

result = 0
readlines.map(&:to_s).map{ |line| 
    if line.index("-") != nil
        start_range, end_range = line.split("-").map { |v| v.strip.to_i }

        object = { s:start_range, e:end_range }
        fresh_list.push(object)
    elsif line.size != 0
        value = line.to_i
        if fresh_list.find{ |list| value >= list[:s] && value <= list[:e]} != nil
            result += 1
        end
    end
}

print result