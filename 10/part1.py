from itertools import product
import sys

def solve(num_positions, buttons, initial, target):
    to_bits = lambda s: [1 if c == '#' else 0 for c in s]
    init_bits = to_bits(initial)
    target_bits = to_bits(target)

    best_solution = None
    best_weight = float('inf')

    # either press or not press
    for presses in product([0,1], repeat=len(buttons)):
        state = init_bits[:]

        for btn, pressed in enumerate(presses):
            if pressed:
                for pos in buttons[btn]:
                    state[pos] ^= 1  # toggle bit

        if state == target_bits:
            weight = sum(presses)
            if weight < best_weight:
                best_weight = weight
                best_solution = presses

    return best_solution
data = [line.rstrip('\n').split(" ") for line in sys.stdin]

result = 0
for machine in data:
    expected = machine[0].replace("[", "").replace("]", "")
    initial = expected.replace("#",".")
    buttons = list(map(lambda x: list(map(int,x.replace("(","").replace(")","").split(","))), machine[1:-1]))
    r = solve(len(initial), buttons, initial, expected)
    result += sum(r)

print(result)