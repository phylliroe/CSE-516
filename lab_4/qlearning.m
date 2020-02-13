%{
Andrew Loop-Perez
006198799
CSE 516 Winter 2020
Implementation of Q-learning in Matlab
%}

%{
1. intitalize R and Q matrices 

Episodes
2. for i from 1 to 1000          <--- 1000 episodes 
    current state = Pick a random state (s)
    Pick a random action for that state (a)
    Update Q(s, a) in the Q matrix

    current state = next state
    update Q

    if (current state = goal state)
        go to next episode

Program output
1. intitalized nxn grid world
2. show that Q matrix is being updated 
3. Output optimal path to goal
    Class Example: optimal path = 1 -> 2 -> 3 -> 6
%}






