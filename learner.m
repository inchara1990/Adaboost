function[index,position,side,error_final] = learner(trainX,trainY,w)

%trainX is the sample 
%trainY is the output
%w is the wieght vector

% position, side,index are stump parameters


[row,~] = size(trainX);

% get train columns (x and x2) and the true output y
x1 = trainX(:,1);
x2 = trainX(:,2);
y = trainY;
w = w;


j = 1; %error index for x1
k = 1; %error index for x2


thrx1 = zeros(row,1);
sidex1 = zeros(row,1);
errorx1 = zeros(row,1);

thrx2 = zeros(row,1);
sidex2 = zeros(row,1);
errorx2 = zeros(row,1);

for i = (1:row)
threshold = x1(i);
threshold2 = x2(i);

thrx1(j) = threshold;
thrx2(k) = threshold2;

[error1,side1] = helper(threshold,x1,y,w);
errorx1(j) = error1;
sidex1(j) = side1;

[error2,side2] = helper(threshold2,x2,y,w);
sidex2(k) = side2;
errorx2(j) = error2;


k = k +1;
j = j+1;
end 


% calculate the lowest error amongst all 
[errorX1,indeX1] = min(errorx1);
[errorX2,indeX2] = min(errorx2);
if ( errorX1 <= errorX2 )
ind = indeX1;
index = 1;
side = sidex1(ind);
position = thrx1(ind);
error_final = errorX1;
else
ind = indeX2;
index = 2;
side = sidex2(ind);
position = thrx2(ind);
error_final = errorX2;
end




end 
