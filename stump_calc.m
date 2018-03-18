function [ out ] = stump_calc(x,index,position,side)
[orow,~] = size(x);
out = zeros(orow,1);
dummy = zeros(orow,1);

if (index == 1)
   if(side == 'l')
     % if index is 1(means x1) and side is l (means left side is positive)
     dummy = x(:,1) >= position;
     out = -1 .* dummy ;
     
     ind =  find(dummy == 0);
     out(ind) = 1;
     
   else 
   % if index is 1(means x1) and side is r (means right side is positive)
     dummy = x(:,1) < position;
     out = -1 .* dummy ;
     
     ind1 =  find(dummy == 0);
     out(ind1) = 1;
    end
   
else 
     if(side == 'l')
     % if index is 2(means x2) and side is l (means left side is positive)
     dummy = x(:,2) >= position;
     out = -1 .* dummy ;
     
     ind = find(dummy == 0);
     out(ind) = 1; 
     
   else 
   % if index is 2(means x2) and side is r (means right side is positive)
    dummy = x(:,2) < position;
    out = -1 .* dummy ;
    
    ind1 =  find(dummy == 0);
    out(ind1) = 1;
    end
   
    
end 



end 
