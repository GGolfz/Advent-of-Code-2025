from pulp import LpProblem, LpVariable, LpMinimize, lpSum, LpStatus
import sys

def solve(A, b):
    num_buttons = len(A)
    num_states = len(A[0])

    prob = LpProblem("Minimize_Button_Presses", LpMinimize)

    # Defined variables: presses for each button (non-negative integer)
    x = [LpVariable(f"x{i+1}", lowBound=0, cat="Integer") for i in range(num_buttons)]

    # Objective: minimize total presses
    prob += lpSum(x)

    # Add Constraints: sum of button effects for each state equals target
    for j in range(num_states):
        prob += lpSum(A[i][j] * x[i] for i in range(num_buttons)) == b[j]
    
    prob.solve()
    return sum(var.value() for var in x)

data = [line.rstrip('\n').split(" ") for line in sys.stdin]

result = 0
for machine in data:
    expected = list(map(int, machine[-1].replace("{","").replace("}","").split(",")))
    buttons = list(map(lambda x: list(map(int,x.replace("(","").replace(")","").split(","))), machine[1:-1]))
    A = []
    for button in buttons:
        temp = [0] * len(expected)
        for b in button:
            temp[b] = 1
        A.append(temp)
    
    r = solve(A,expected)
    result += r
print(result)