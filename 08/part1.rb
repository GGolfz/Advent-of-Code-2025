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
mergeCount = 1000
for i in 0..(mergeCount-1) do
    a,b = sortedKey[i].split("-")
    processAddToBox(a,b)
end

puts $arrOfBox.sort_by { |s| s.size }.reverse[0..2].map(&:size).inject(1) { |accumulator, element| accumulator * element }