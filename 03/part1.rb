result = readlines.map(&:to_s).map { |line|
    line = line.chomp
    first = 9
    firstIndex = -1
    while(first > 0) 
        if line.index(first.to_s) != nil && line.index(first.to_s) != (line.size() -1) 
            firstIndex = line.index(first.to_s)
            break
        else
            first -= 1
        end
    end

    second = 9
    while(second > 0)
        if line[firstIndex+1..].index(second.to_s) != nil
            break
        else
            second -= 1
        end
    end

    first*10 + second
}.sum

puts result