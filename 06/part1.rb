result = 0
arr = []

readlines.map(&:to_s).map{ |line|      
    arr.push(line.squeeze(' ').lstrip.split(' '))
}

arr[0].size.times do | key | 
    if arr[arr.size - 1][key] == '+'
        result += arr[0][key].to_i + arr[1][key].to_i + arr[2][key].to_i + arr[3][key].to_i
    elsif arr[arr.size - 1][key] == '*'
        result += arr[0][key].to_i * arr[1][key].to_i * arr[2][key].to_i * arr[3][key].to_i
    end
end

puts result