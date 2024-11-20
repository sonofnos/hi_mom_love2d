-- Initialize the game
local board = {}
local currentPlayer = 'X'
local gameOver = false
local winner = nil

local cellSize = 200
local gridSize = 3 * cellSize  -- 3 cells per row/column

-- Initializes the board with empty cells
function initBoard()
    for i = 1, 3 do
        board[i] = {}
        for j = 1, 3 do
            board[i][j] = ''  -- Empty string means the cell is unoccupied
        end
    end
end

-- Resets the game
function resetGame()
    initBoard()
    currentPlayer = 'X'
    gameOver = false
    winner = nil
end

-- Check if there's a winner
function checkWinner()
    -- Check rows, columns, and diagonals
    for i = 1, 3 do
        if board[i][1] == board[i][2] and board[i][2] == board[i][3] and board[i][1] ~= '' then
            winner = board[i][1]
            return true
        end
        if board[1][i] == board[2][i] and board[2][i] == board[3][i] and board[1][i] ~= '' then
            winner = board[1][i]
            return true
        end
    end
    if board[1][1] == board[2][2] and board[2][2] == board[3][3] and board[1][1] ~= '' then
        winner = board[1][1]
        return true
    end
    if board[1][3] == board[2][2] and board[2][2] == board[3][1] and board[1][3] ~= '' then
        winner = board[1][3]
        return true
    end
    return false
end

-- Switch to the next player
function switchPlayer()
    if currentPlayer == 'X' then
        currentPlayer = 'O'
    else
        currentPlayer = 'X'
    end
end

-- Function to handle the click event
function love.mousepressed(x, y, button, istouch, presses)
    if gameOver then
        resetGame()
        return
    end

    -- Calculate the offset to center the grid
    local offsetX = (love.graphics.getWidth() - gridSize) / 2
    local offsetY = (love.graphics.getHeight() - gridSize) / 2

    -- Convert mouse click position to grid coordinates
    local row = math.floor((y - offsetY) / cellSize) + 1
    local col = math.floor((x - offsetX) / cellSize) + 1

    -- Check if the cell is empty, then place the mark
    if row >= 1 and row <= 3 and col >= 1 and col <= 3 and board[row][col] == '' then
        board[row][col] = currentPlayer  -- Place the player's mark ('X' or 'O')
        if checkWinner() then
            gameOver = true
        else
            switchPlayer()
        end
    end
end

-- Function to draw the board and the marks (X/O)
function love.draw()
    -- Calculate the offset to center the grid
    local offsetX = (love.graphics.getWidth() - gridSize) / 2
    local offsetY = (love.graphics.getHeight() - gridSize) / 2

    -- Draw the grid
    love.graphics.setColor(1, 1, 1)
    for i = 1, 2 do
        love.graphics.line(offsetX, offsetY + i * cellSize, offsetX + gridSize, offsetY + i * cellSize)
        love.graphics.line(offsetX + i * cellSize, offsetY, offsetX + i * cellSize, offsetY + gridSize)
    end

    -- Draw the X and O marks immediately
    for row = 1, 3 do
        for col = 1, 3 do
            local mark = board[row][col]
            local xPos = offsetX + (col - 1) * cellSize + cellSize / 2
            local yPos = offsetY + (row - 1) * cellSize + cellSize / 2
            if mark == 'X' then
                -- Draw X (Red)
                love.graphics.setColor(1, 0, 0)
                love.graphics.setLineWidth(5)
                love.graphics.line(xPos - 40, yPos - 40, xPos + 40, yPos + 40)
                love.graphics.line(xPos + 40, yPos - 40, xPos - 40, yPos + 40)
            elseif mark == 'O' then
                -- Draw O (Blue)
                love.graphics.setColor(0, 0, 1)
                love.graphics.circle('line', xPos, yPos, 40, 32)
            end
        end
    end

    -- Draw the winner message if the game is over
    if gameOver then
        love.graphics.setColor(0, 1, 0)
        love.graphics.print(winner .. " wins!", love.graphics.getWidth() / 2 - 100, love.graphics.getHeight() / 2 - 50, 0, 2, 2)
    end
end

-- Initialize the board on game start
initBoard()
