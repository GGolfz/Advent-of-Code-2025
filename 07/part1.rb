result = 0
arr = []

readlines.map(&:to_s).map{ |line|      
    arr.push(line.split(''))
}
arr.size.times do | line |
    if line == 0 
        
    elsif line == 1
        start = arr[line-1].index("S")
        if arr[line][start] == '^'
            arr[line][start-1] = '|'
            arr[line][start+1] = '|'
            result +=1 
        else
            arr[line][start] = '|'
        end
    else
        arr[line].size.times do | col |
            if arr[line-1][col] == '|'
                if arr[line][col] == '^'
                    arr[line][col-1] = '|'
                    arr[line][col+1] = '|'
                    result +=1 
                else
                    arr[line][col] = '|'
                end
            end
        end
        
    end
end


print arr.map{|a| a.join("")}.join("\n")
puts
puts result