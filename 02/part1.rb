result = 0
readline.split(",").map(&:to_s).each do | range |
    splitValue = range.split("-")
    startNum = splitValue[0].to_i
    endNum = splitValue[1].to_i
    for value in (startNum..endNum)
        valueStr = value.to_s
        if valueStr.length % 2 == 0 && valueStr[0,valueStr.length / 2] == valueStr[valueStr.length / 2,valueStr.length]
            result += value
        end
    end
end
puts result