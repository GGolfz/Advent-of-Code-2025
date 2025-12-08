require "set"

$distanceMap = {}
allPoints = []

$arrOfBox = []
readlines.map(&:to_s).map { |line| 
    allPoints.push(line.chomp.split(",").map(&:to_i))
}

def calculateDistance(a,b) 
    return ((a[0]-b[0])**2 + (a[1]-b[1])**2 + (a[2]-b[2])**2) ** 0.5
end

def processAddToBox(a,b)
    boxIncludeA = $arrOfBox.find_index { |box| box.include?(a) }
    boxIncludeB = $arrOfBox.find_index { |box| box.include?(b) }
    if boxIncludeA == nil && boxIncludeB == nil
        data = Set.new([a,b])
        $arrOfBox.push(data)
    elsif boxIncludeA == nil
        $arrOfBox[boxIncludeB].add(a)
    elsif boxIncludeB == nil
        $arrOfBox[boxIncludeA].add(b)
    else
        data = $arrOfBox[boxIncludeA] | $arrOfBox[boxIncludeB]
        $arrOfBox = $arrOfBox.reject.with_index { |_, index| (index == boxIncludeA || index == boxIncludeB) }
        $arrOfBox.push(data)
    end
end

for i in 0..(allPoints.size-1) do
    for j in (i+1)..(allPoints.size-1) do
        index = "#{i}-#{j}"
        $distanceMap[index] = calculateDistance(allPoints[i], allPoints[j])
    end
end

$sortedByDistance = $distanceMap.sort_by { |key, value| value }.to_h


sortedKey = $sortedByDistance.keys
i = 0
while i >= 0
    a,b = sortedKey[i].split("-")
    processAddToBox(a,b)
    i+=1
    if $arrOfBox.size == 1 && $arrOfBox[0].size == allPoints.size
        puts "#{allPoints[a.to_i][0] * allPoints[b.to_i][0]}"
        break
    end
end
