function[p,L]=connect_test(A);



[~,~,n3]=size(A);

p=[];
count=1;
for i=1:n3



 
 Lapl=diag(sum(A(:,:,i)))-A(:,:,i);
    
    

leig=eig(Lapl);



L(:,i)=leig;

if leig(2)>1e-10

p(count)=i;
count=count+1;


end

end
