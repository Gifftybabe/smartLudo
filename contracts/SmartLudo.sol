// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartLudo {
    uint8 public constant player = 6; 

    mapping(address => uint8) public position;

    mapping(address => bool) public isStarted;

   
    event DiceRolled(address indexed player, uint8 diceValue, uint8 newPosition);

  
    modifier isGameStarted() {
        require(isStarted[msg.sender], "The game must begin.");
        _;
    }


    function startGame() external {
        require(!isStarted[msg.sender], "You started already");
        position[msg.sender] = 0; 
        isStarted[msg.sender] = true;
    }

    
    function rollDice() external isGameStarted returns (uint8) {
        uint8 diceValue = uint8((uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % 6) + 1);

        uint8 newPosition = position[msg.sender] + diceValue;

        if (newPosition > player) {
            newPosition = player; 
        }

        position[msg.sender] = newPosition;


        emit DiceRolled(msg.sender, diceValue, newPosition);

        return diceValue;
    }

    
    }

