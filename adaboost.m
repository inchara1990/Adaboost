function [ pred, errtrain, errtest ] = adaboost(trainX, trainy, testX, T)

%
[row,~] = size(trainX);
[row1,~] = size(testX);
position = zeros(T,1);
index = zeros(T,1);
side = zeros(T,1);
alpha = zeros(T,1);

%intial weights 
w = zeros(row,1);
w = w + (1/row);


for i = (1:T)
% call learner
[index_final,position_final,side_final,error_final] = learner(trainX,trainy,w);
alpha_final = (1/2).*(log(1-error_final)- log(error_final)); 

%update weight
[ out ] = stump_calc(trainX,index_final,position_final,side_final);
z = 2* sqrt(error_final*(1-error_final));
multiplier = exp(-1*alpha_final*(trainy.*out))./z;
w = (w .* multiplier) ;

%store stump parameters
position(i) = position_final;
side(i) = side_final;
alpha(i) = alpha_final;
error(i) = error_final;
index(i) = index_final;
end 

%test 
final_sample = zeros(row1,1);
for k = (1:T)
[out_pred] = stump_calc(testX,index(k),position(k),side(k));
prod_sample = out_pred .* alpha(k);
final_sample = prod_sample + final_sample;  
end  


pred = sign(final_sample);


end 
