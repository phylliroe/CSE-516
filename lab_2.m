%{
==============================================================================
==============================================================================
Name: Andrew Loop-Perez
ID: 006198799
Course: CSE 516 Winter 2020
Assignment: Lab #2
==============================================================================
==============================================================================
%}

% Original data
D = [2.5 0.5 2.2 1.9 3.1 2.3 2 1 1.5 1.1; 
       2.4 0.7 2.9 2.2 3.0 2.7 1.6 1.1 1.6 0.9];

X = D(1,:);
Y = D(2,:);
       
% Original Graph
scatter(D(1,:), D(2, :), 'filled')
title('Original Data')
clf

% Normalize the original data
X_norm = D(1,:) - mean(D(1,:));
Y_norm = D(2,:) - mean(D(2,:));
D_norm = [X_norm; Y_norm];

D_norm = transpose(D_norm)
[m n] = size(D_norm)
cov = (1/m)*(D_norm' * D_norm)
[V D W] = eig(cov)

plot(linspace(-2,2), V(:,1) * linspace(-2,2))
hold on 
scatter(X_norm, Y_norm, 'filled')
title("Normalized Data With Primary Components")
clf

V_reduce = V(:,2)
Z = D_norm * V_reduce
plot(Z, 'bo')
title("Data In New Space")
clf

scatter(Z, Z)
title("Data With Reduced Dimension")

hold on
scatter(X, Y, '+')
title("Original Data With Transformed Data")
legend("Reduced", "Original")
clf

%plot(new_D, "b+")

%{
[m n] = size(D_norm);
covariance = D_norm * transpose(D_norm)
[V D W] = eig(covariance)

PC1 = V(:,1)
PC2 = V(:,2)

a = linspace(-2,2);
PC = PC1 * a;

PC1_trans = transpose(PC1)
PC2_trans = transpose(PC2)

T = [PC1_trans; PC2_trans]

pc1a = [-0.735178656 0.677873399]

%test = PC1_trans * D_norm
%test2 = transpose(test)
testa = pc1a * D_norm
plot(testa, 'b+')

%plot(a, PC)
%hold on
%scatter(X_norm, Y_norm, 'filled')
%title("Normalized Data With Primary Components")

final = transpose(D_norm) * transpose(V);
%plot(final, "b+")

orig = (final * transpose(V)) + mean(D);
%scatter(X, Y, '+')
%hold on
%scatter(orig(:,1), orig(:,2))
%}