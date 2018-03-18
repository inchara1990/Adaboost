function[error,side] = helper(threshold,x,y,w)


logigreat = x>=threshold;
logiless = x<threshold;
indexgreat = find(x>=threshold);
indexless = find(x<threshold);

%case 1 : consider greater than threshold as positive

%get all indexes which are misclassified
%of all the misclassified pick only ones greater than threshold
diff_pos = y-logigreat;
index_pos = find(diff_pos ~= 0);
intersect_pos1 = intersect(indexgreat,index_pos);

%get all indexes which are misclassified
%of all the misclassified pick only ones lesser than threshold
diff_neg = y - (logiless .* -1);
index_neg = find(diff_neg ~= 0);
intersect_neg1 = intersect(indexless,index_neg);

#combine
error1 = sum(w(intersect_pos1))+sum(w(intersect_neg1));

%case 2 : consider greater than threshold as negative 

%get all indexes which are misclassified
%of all the misclassified pick only ones greater than threshold
diff_pos2 = y-(logigreat .* -1);
index_pos2 = find(diff_pos2 ~= 0);
intersect_pos2 = intersect(indexgreat,index_pos2);

%get all indexes which are misclassified
%of all the misclassified pick only ones lesser than threshold
diff_neg2 = y - logiless;
index_neg2 = find(diff_neg2 ~= 0);
intersect_neg2 = intersect(indexless,index_neg2);

#combine 
error2 = sum(w(intersect_pos2))+sum(w(intersect_neg2));

if( error1 >= error2)
side = 'l';
error = error2;
else
side = 'r';
error = error1;
end

 
end 
