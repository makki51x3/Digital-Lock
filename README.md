# Digital-Lock
## Abstract
Design a three digit combinational digital lock and implement it using the Nexys4 board. The lock system has five input buttons each representing an integer number, two led lights representing the two states of the system “locked” and “unlocked” and a seven segment display that displays the entered input and number of tries. To unlock the system, the user should enter the combinational lock key “241”. He will have two tries to enter the right key or else the system will stay locked. 
## Introduction
The lock system is comprised of three main modules; Counter module, display module, and finite state machine (FSM) module. The system can be in two states “locked” and “unlocked”. The top module is responsible for the connections between the three main modules and the inputs and outputs of the system. The test-bench module tests different inputs/outputs of the finite state machine (FSM) module.
![image](https://user-images.githubusercontent.com/96151955/151645030-e9d76951-be01-48cc-b65f-a8f48bed2199.png)
