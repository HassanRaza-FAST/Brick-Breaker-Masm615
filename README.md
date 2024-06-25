# MASM615 Brick Breaker Game

## Screenshots

![Screenshot 1](screenshots/1.png)


![Screenshot 2](screenshots/2.png)


![Screenshot 3](screenshots/3.png)


![Screenshot 4](screenshots/4.png)


![Screenshot 5](screenshots/5.png)


![Screenshot 6](screenshots/6.png)


![Screenshot 7](screenshots/7.png)


## Description

This project is a classic Brick Breaker game implemented in Assembly language using MASM 615 and the DOSBox emulator. The player controls a paddle to bounce a ball and break bricks arranged on the screen. The game features multiple levels, score tracking, and various game states.

## Features

- **Multiple Levels:** The game progresses through multiple levels with increasing difficulty.
- **Score Tracking:** The player's score is tracked and displayed.
- **Game States:** The game has different states such as the main menu, game over screen, and instructions screen.
- **Dynamic Bricks:** Bricks have different health points and can change levels.

## Installation

To run this project, you need to have DOSBox and MASM 615 installed on your system. You can download DOSBox from [here](https://www.dosbox.com/).

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/masm615-brick-breaker.git
   ```
2. **Navigate to the Project Directory:**
    ```bash
    cd masm615-brick-breaker
   ```
3. **Run the Game:**
   - Open DOSBox.
   - Mount the project directory:
      ```bash
      mount c path-to-project-directory
      ```
   - Change to the mounted directory:
      ```bash
      c:
      ```
   - Assemble and link the program using MASM 615:
     ```bash
      ml game.asm
      ```
   - Run the executable
     ```bash
      game.exe
      ```
