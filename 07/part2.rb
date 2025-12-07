
arr = []

readlines.map(&:to_s).map{ |line|      
    arr.push(line.split(''))
}
$map = {}
def findPath(arr, line, col)
    index = "#{line}-#{col}"
    if $map[index] != nil
        return $map[index]
    elsif line == 0
        start = arr[line].index("S")
        if arr[line+1][start] == '^'
            return findPath(arr, line+1, start-1) + findPath(arr, line+1, start + 1)
        else
            return findPath(arr, line+1, start)
        end
    elsif line < arr.size - 1
        if arr[line+1][col] == '^'
            r = findPath(arr, line+1, col-1) + findPath(arr, line+1, col + 1)
            $map[index] = r
            return r
        else
            r = findPath(arr, line+1, col)
            $map[index] = r
            return r
        end
    elsif line == arr.size - 1
        return 1
    end 
end


puts findPath(arr, 0, 0)