fresh_list = []

result = 0
readlines.map(&:to_s).map{ |line| 
    if line.index("-") != nil
        start_range, end_range = line.split("-").map { |v| v.strip.to_i }

        fresh_list.push((start_range..end_range))
    end
}

def solve(ranges)
    sorted_ranges = ranges.sort_by(&:begin)
    merged_ranges = [sorted_ranges.first]
    sorted_ranges[1..-1].each do |current_range|
        last_merged = merged_ranges.last
        if current_range.begin <= (last_merged.end + 1)
            new_end = [last_merged.end, current_range.end].max
            merged_ranges[-1] = (last_merged.begin..new_end)
        else
            merged_ranges.push(current_range)
        end
    end
    return merged_ranges.sum(&:size)
end

print solve(fresh_list)