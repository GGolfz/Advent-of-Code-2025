result = 0
arr = []

readlines.map(&:to_s).map{ |line|      
    arr.push(line)
}
currentOp = ''
start = 0
arr[arr.size - 1].size.times { |key|
    if arr[arr.size - 1][key] == '+' || arr[arr.size - 1][key] == '*'
        if currentOp != '' 
            # calculate prev
            tempArr = []
            (start..key-1).each { |index|
                v = "#{arr[0][index]}#{arr[1][index]}#{arr[2][index]}#{arr[3][index]}".gsub(/\n/, ' ').strip
                if v != ''
                    tempArr.push(v)
                end
            }
            puts currentOp 
            print tempArr
            if currentOp == '+'
                tempValue = 0
                tempArr.each { |value| 
                    tempValue += value.to_i
                }
                puts   tempValue    
                result += tempValue
            elsif currentOp == '*'
                tempValue = 1
                tempArr.each { |value| 
                    tempValue *= value.to_i
                }
                result += tempValue
                puts   tempValue    
            end
        end
        currentOp = arr[arr.size - 1][key]
        start = key
    end
}
tempArr = []
(start..arr[arr.size-1].size).each { |index|
    v = "#{arr[0][index]}#{arr[1][index]}#{arr[2][index]}#{arr[3][index]}".gsub(/\n/, ' ').strip
    if v != ''
        tempArr.push(v)
    end
}
puts currentOp 
print tempArr
if currentOp == '+'
    tempValue = 0
    tempArr.each { |value| 
        tempValue += value.to_i
    }
    puts   tempValue   
    result += tempValue
elsif currentOp == '*'
    tempValue = 1
    tempArr.each { |value| 
        tempValue *= value.to_i
    }
    puts   tempValue   
    result += tempValue
end

puts result