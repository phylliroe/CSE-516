%{
===========================================================
Name: Andrew Loop-Perez
ID: 006198799
Course: CSE 516 Winter 2020
Assignment: Lab #5
===========================================================

Script file written using Octave
%}
1;

function centroids = initCentroids(X, K)
  centroids = zeros(K,size(X,2)); 
  % Randomly reorder the indices of examples
  randidx = randperm(size(X,1));
  % Take the first K examples as centroids
  centroids = X(randidx(1:K), :);
end 

% Calculate the distance between a data point and a centroid 
function d = distance(data_point, centroid)
  d = sqrt((centroid(1,1)-data_point(1,1))^2+(centroid(1,2)-data_point(1,2))^2);  
end 
  
function indices = reassignPoints(X, centroids)
  K = size(centroids, 1); % K = number of centroids
  indices = zeros(size(X,1), 1); % contines the index of the nearest centroid
  m = size(X,1); % number of data points
  
  for i=1:m
    % you code here
    data = X(i,:); % Current data point
    
    % Caluclate the distance between the current data point and the 
    % first centroid
   
   current_centroid = centroids(1, :);
    min_distance = distance(data, current_centroid);  
    index = 1;
    
    % Caluclate the distances between the current data point and the rest of 
    % the centroids. Place the index of the centroid that is closest to the 
    % current data point within indices.
  
  for j = 2:K
      current_centroid = centroids(j, :);
      new_distance = distance(data, current_centroid);
      
      if (min_distance > new_distance)
        min_distance = new_distance;
        index = j;
      end
    end 
  indices(i) = index;
 end  
end

function centroids = updateCentroids(X, idx, K)
  [m n] = size(X);
  centroids = zeros(K, n); 
  
  for i=1:K
    % you code here
    
    % Find the center of each cluster of points by calculing the average
    % x and y values in the cluster. Set the new coordinates of the cluster's
    % centroid equal to the caluclated center coordinates. 
    
    average_x = 0;
    average_y = 0;
    count = 0; % Number of data points within a particular cluster 
    
    for j = 1:m
      % Calculate the average x and y values for all of the data points 
      % within a cluster 
      if (idx(j) == i)
        average_x = average_x + X(j,1);
        average_y = average_y + X(j,2);
        count = count + 1;
      end 
    end
    
    average_x = average_x/count;
    average_y = average_y/count;
    
    % Set the new coordinates of the centroid
    centroids(i, 1) = average_x;
    centroids(i, 2) = average_y;
   end
end 

X = load("s1.dat");
epoch = 20;
K = 5;
centroids = initCentroids(X, K);

for i=1:epoch
  indices = reassignPoints(X, centroids);
  centroids = updateCentroids(X, indices, K);
end

scatter(X(:,1),X(:,2),32,indices,'filled')



