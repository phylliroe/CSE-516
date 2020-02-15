%{
Andrew Loop-Perez
006198799
CSE 516 Winter 2020
Implementation of Q-learning in Matlab

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
     
ACTIONS:
1 = UP
2 = DOWN
3 = LEFT 
4 = RIGHT

REWARD:
rows = states (1 -> n)

    
%}
1;

function s = state_num(row, col, n)
  s = ((row * n) - (n - col));  
end 

function M = init_grid(n)
  M = zeros(n);
end

function R = reward(n)
  R = zeros((n^2), 4);
end 

function action = get_random_action(row, col, n)
  %action = randi([1,4], 1);
  rand_action = randi([1,4], 1);
  while rand_action ~= 0
      %rand_action = randi([1,4], 1);
      
      if row == 1 && rand_action == 1
          rand_action = 0;
      elseif row == n && rand_action == 4
          rand_action = 0;
      end 
      rand_action = randi([1,4], 1);
    end 
    
    action = rand_action;
end 

n = 4;
start_state = 1;
goal = 11;
row = 1;
col = 1;

grid_world = init_grid(n);
Q = init_grid(n);
R = reward(n);
%state = state_num(row, col, n)
%size(R)

for i = 1:20
  new_action = get_random_action(row, col, n)
end 
















