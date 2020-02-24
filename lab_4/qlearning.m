%{
====================================================================
====================================================================
Name: Andrew Loop-Perez
ID: 006198799
Couse: CSE 516 Winter 2020
Assignment: Lab #4
====================================================================
====================================================================
%}

%{
Script file was written using Ocatave 

ACTIONS:
1 = UP
2 = DOWN
3 = LEFT 
4 = RIGHT

REWARD:
rows = states (1 -> n)
Q Matrix: row = State S, column = action
%}

1;

% Calcualte the number of a state from its row and column position
function s = state_num(row, col, n)
  s = ((row * n) - (n - col));  
end 

% Generate a random action based on the agent's current row and column position 
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

% Create a vector containing the reward values for each state
% [1 2 3....n]
function R = create_rewards(n, goal)
   R = ones(1,(n^2)) * -1;
   R(goal) = 10;
end

% Initialize the Q matrix as an nxn matrix of zeros
function Q = create_Q(n)
   Q = zeros((n^2), 4);
end 

% Compute the new row and column positions after an action is performed
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


%------------------------------------------------------
% Grid world is nxn 
n = 4;
% row and column positions of the starting state
starting_row = 1;
starting_col = 1;
% Calculate the starting state
start_state = state_num(starting_row, starting_col, n);
% Goal state
goal = 11;
% Gamma
gamma = 0.8;
% Number of iterations over the grid
iterations = 100;
% --------------------------------------------------

% Display the grid world
count = 1;
grid = zeros(n, n);
for i = 1:n
  for j = 1:n
    grid(i,j) = count;
    count = count + 1;
  end 
end 
    
display(start_state)
display(goal)
display(grid)

% Initialize the Reward vector and the Q matrix
Q = create_Q(n);
R = create_rewards(n, goal);

for episode = 1:iterations
  % Set the starting row, column, and state at the start of each iteration
  current_state = start_state;
  row = starting_row;
  col = starting_col;
  
  % Stop the current iteration when the goal state is reached
  while current_state ~= goal
    % Generate a random action
    action = get_random_action(row, col, n);
    
    % Update the row and column positions and get the new state
    [row, col] = next_state(action, row, col);
    new_state = state_num(row, col, n);

    % Get the reward for the state
    imm_reward = R(new_state);
  
    possible_q = Q(new_state,:); 
    q_value = imm_reward + (gamma * max(possible_q));
    
    % Update the Q matrix
    Q(current_state, action) = q_value; 

    % Update the current state
    current_state = new_state;
  end 
  
  % Display every 10th episode
  if rem(episode, 10) == 0
    %display(episode)
    %display(Q)
  end 
  
end

shortest_path = [start_state];
action = 0;
row = starting_row;
col = starting_col;
state = start_state;

% Use the Q matrix to find the shortest path from the start state to the goal
while state ~= goal
  qval = 0;
  for i = 1:4
    if Q(state, i) >= qval
      qval = Q(state, i);
      action = i;
    end   
  end    
  [row col] = next_state(action, row, col);
  state = state_num(row, col, n) ;
  shortest_path = [shortest_path state];
end

% Display the shortest path
display(Q)
display(shortest_path)
  




