result = 0
arr = []

readlines.map(&:to_s).map{ |line|      
    arr.push(line.split(',').map(&:to_i))
}

def calculateSize(a,b)
    return ((a[0]-b[0]).abs()+1) * ((a[1]-b[1]).abs()+1)
end

for i in 0..(arr.size-1) do
    for j in (i+1)..(arr.size-1) do
        size = calculateSize(arr[i],arr[j])
        result = [result, size].max
    end
end


puts result