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

%function R = reward(n)
%  R = zeros((n^2), 4);
%end 

% Generate a random action based on the agents current row and column position. 
function action = get_random_action(row, col, n)
  x = 0;
  if row == 1
    if col == 1
      x = setdiff(1:4, [1, 3]);
    elseif col == n
      x = setdiff(1:4, [1, 4]);
    else
      x = setdiff(1:4, [1]);
    end 
  elseif row == n
    if col == 1
      x = setdiff(1:4, [2, 3]);
    elseif col == n
      x = setdiff(1:4, [2, 4]);
    else
      x = setdiff(1:4, [2]);
    end
  elseif col == 1
    x = setdiff(1:4, [3]);
  elseif col == n
    x = setdiff(1:4, [4]);
  else 
    x = setdiff(1:4, []);
  end 
    action = x(randi(numel(x)));   
end 

% [1 2 3....n]
function R = create_rewards(n, goal)
   R = ones(1,(n^2)) * -1;
   R(goal) = 10;
end

function Q = create_Q(n)
   Q = zeros((n^2), 4);
end 

function [new_row, new_col] = next_state(action, row, col)
  new_row = row;
  new_col = col;
  
  switch action
    case 1
      new_row = new_row - 1;
    case 2
      new_row = new_row + 1;    
    case 3
      new_col = new_col - 1;
    case 4
      new_col = new_col + 1;
   end 
end 

n = 4;
start_state = 1;
goal = 11;
row = 1;
col = 1;
gamma = 0.8;

grid_world = init_grid(n);
Q = create_Q(n);

%R = reward(n);
%state = state_num(row, col, n)
%size(R)

R = create_rewards(n, goal);


%for i = 1:20
 % curr_state = state_num(row, col, n);
  %new_action = get_random_action(row, col, n)
%end
%x = setdiff(1:4, [3])
%y = x(randi(numel(x)))

current_state = start_state
while current_state ~= goal
  action = get_random_action(row, col, n);
  [row, col] = next_state(action, row, col);
  new_state = state_num(row, col, n);
  %display(R(current_state))
  imm_reward = R(new_state);
  
  Q(current_state, action) = imm_reward; 

  current_state = new_state
 
end 

%Q(current_state,2) = 5
display(Q)




