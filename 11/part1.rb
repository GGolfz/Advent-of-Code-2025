$graph = {}
readlines.map(&:to_s).map { |line| 
    source, list = line.split(": ")
    destination = list.split(" ")
    $graph[source] = destination
}

$pathList = []
def dfs(current, path)
    if current == "out"
        new_path = path + [current]
        $pathList << new_path
    end
    if path.include?(current) || $graph[current] == nil
        return
    end
    $graph[current].each do | dest | 
        new_arr = path + [current]
        dfs(dest, new_arr)
    end
end 
def solve()
    $graph["you"].each do | dest | 
        dfs(dest, ["you"])
    end
end

solve()
print($pathList.size)