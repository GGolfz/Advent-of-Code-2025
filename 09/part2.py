import sys
from shapely.geometry import Polygon, box

points = [tuple(map(int, line.rstrip('\n').split(','))) for line in sys.stdin]

poly = Polygon(points)
result = 0
for x, y in points:
    for xx, yy in points:
        if poly.contains(box(x, y, xx, yy)):
            result = max((abs(x - xx) + 1) * (abs(y - yy) + 1), result)
print(result)