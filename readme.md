# Tic-Tac-Toe in Lua with LÖVE2D

This is a simple **Tic-Tac-Toe** game implemented in **Lua** using the **LÖVE2D** framework. The game allows two players to take turns and play on a 3x3 grid. The game immediately displays the mark (`X` or `O`) as soon as a player clicks a cell. The game ends when one player wins or the board is full.

This project demonstrates basic game development with LÖVE2D, including handling user input, drawing graphics, and detecting winning conditions.

## Features

- **Player vs Player**: Two players can play on the same computer.
- **Immediate Feedback**: The mark (`X` or `O`) is displayed immediately after each click.
- **Winner Detection**: The game checks for a winner after each move and displays a winning message.
- **Game Reset**: After a game ends (a player wins or the board is full), the game can be restarted by clicking anywhere.
- **Centered Grid**: The Tic-Tac-Toe grid is centered in the window, regardless of window size.
- **Smooth Graphics**: Marks (`X` and `O`) are drawn clearly with a simple, minimalistic visual style.

## Installation

To run this game, you will need the **LÖVE2D** framework, which is a popular framework for developing 2D games in Lua. Follow these steps to set up and play:

### 1. Install LÖVE2D
- **Windows**: Download the installer from [https://love2d.org/](https://love2d.org/) and follow the instructions.
- **macOS**: Download the `.dmg` file from [https://love2d.org/](https://love2d.org/), open it, and drag LÖVE into your Applications folder.
- **Linux**: You can install LÖVE2D from your package manager or download it from the official site.

### 2. Download the Game Code
- Clone or download this repository to your computer.
- The project directory should contain the following files:
  - `main.lua`: The main game logic.
  - `conf.lua`: LÖVE2D configuration file (sets the window title and size).

### 3. Run the Game
To run the game:
- **Windows**: Drag and drop the project folder onto the LÖVE2D executable or use the command prompt with `love .` inside the project directory.
- **macOS/Linux**: You can run it from the terminal using the following command inside the project directory:
  ```bash
  love .
