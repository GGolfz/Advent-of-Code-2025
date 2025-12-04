boards = readlines().map(&:chars)
ROW_NUM = boards.length
COL_NUM = boards[0].length
def check(boards, i, j)
    if i >= 0 && i < ROW_NUM && j >= 0 && j < COL_NUM
        return boards[i][j] == '@' ? 1 : 0
    end
    return 0
end
result = 0
for i in (0..ROW_NUM-1)
    for j in (0..COL_NUM-1)
        if boards[i][j] == '@'
            count = check(boards, i-1,j-1) + check(boards, i-1,j) + check(boards, i-1,j+1) + check(boards, i,j-1)  + check(boards, i,j+1)+ check(boards, i+1,j-1) + check(boards, i+1,j) + check(boards, i+1,j+1)
            if count < 4
                result += 1
            end
        end
    end
end

puts result