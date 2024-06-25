# MASM615 Brick Breaker Game

## Screenshots

![1](https://github.com/HassanRaza-FAST/Brick-Breaker-Masm615/assets/152514035/ba372c79-750e-452e-a057-015457054a4f)

![2](https://github.com/HassanRaza-FAST/Brick-Breaker-Masm615/assets/152514035/1a2ab20c-50e4-465d-a0ca-6637a5d75bbf)

![3](https://github.com/HassanRaza-FAST/Brick-Breaker-Masm615/assets/152514035/91739952-c6af-42c7-b6b4-3130b73b27be)

![6](https://github.com/HassanRaza-FAST/Brick-Breaker-Masm615/assets/152514035/09842a1e-352b-4d4a-850f-4512e5aac0d2)

![7](https://github.com/HassanRaza-FAST/Brick-Breaker-Masm615/assets/152514035/8319e33a-3ee2-4ccf-8e59-1d3751840b15)

![5](https://github.com/HassanRaza-FAST/Brick-Breaker-Masm615/assets/152514035/fe4add30-5ed3-46ff-8067-d1790fa9a0c3)



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
