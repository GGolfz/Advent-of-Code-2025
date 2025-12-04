boards = readlines().map(&:chars)
ROW_NUM = boards.length
COL_NUM = boards[0].length
def check(boards, i, j)
    if i >= 0 && i < ROW_NUM && j >= 0 && j < COL_NUM
        return boards[i][j] == '@' ? 1 : 0
    end
    return 0
end

def loopRoll(boards)
    r = 0
    newboards = []
    for i in (0..ROW_NUM-1)
        newboards.push([])
        for j in (0..COL_NUM-1)
            if boards[i][j] == '@'
                count = check(boards, i-1,j-1) + check(boards, i-1,j) + check(boards, i-1,j+1) + check(boards, i,j-1)  + check(boards, i,j+1)+ check(boards, i+1,j-1) + check(boards, i+1,j) + check(boards, i+1,j+1)
                if count < 4
                    r += 1
                    newboards[i].push('x')
                else
                    newboards[i].push('@')
                end
            else
                newboards[i].push('.')
            end
        end
    end
    return r, newboards
end

result = 0
while(true)
    r, newboards = loopRoll(boards)
    puts r
    if r == 0
        break
    end
    result += r
    boards = newboards
end
puts result
