import sys

def parse_input(text):
    lines = [line.rstrip("\n") for line in text.splitlines()]
    i = 0
    n = len(lines)

    shapes = []
    regions = []

    while i < n:
        line = lines[i].strip()

        if not line:
            i += 1
            continue

        if ":" in line and "x" in line:
            break  # done with shapes

        if line.endswith(":"):  # "0:" "1:" etc.
            i += 1
            shape_rows = []
            while i < n and lines[i].strip() and not lines[i].endswith(":"):
                shape_rows.append(lines[i])
                i += 1

            shape_cells = []
            for y, row in enumerate(shape_rows):
                for x, c in enumerate(row):
                    if c == "#":
                        shape_cells.append((x, y))
            shapes.append(shape_cells)
            continue

        i += 1

    # regions
    while i < n:
        line = lines[i].strip()
        if not line:
            i += 1
            continue

        if ":" in line and "x" in line:
            region_def, counts_text = line.split(":")
            w, h = map(int, region_def.split("x"))
            counts = list(map(int, counts_text.strip().split()))
            regions.append((w, h, counts))

        i += 1

    return shapes, regions


def solve_region(W, H, shape_counts, shape_area):

    region_area = W * H

    # total area quick check
    required_area = sum(shape_area[i] * shape_counts[i] for i in range(len(shape_counts)))
    if required_area > region_area:
        return False
    return True

def main():
    text = sys.stdin.read()
    shapes, regions = parse_input(text)

    shape_area = [len(s) for s in shapes]

    count = 0

    for W, H, counts in regions:
        res = solve_region(W, H, counts, shape_area)
        if res:
            count += 1

    print(count)


if __name__ == "__main__":
    main()