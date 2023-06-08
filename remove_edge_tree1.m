function[AREV,REM_EDGE,transamp,remTime1]=remove_edge_tree1(AA,ref) 
% calcuate remeeting times with resepct to the reference
% and gives back non-isomorphic graphs




AREV=[];
REM_EDGE=[];
transamp=[];
remTime1=[];

[n,~,n1]=size(AA);
 
count=1;

for j=1:n1

A=AA(:,:,j);

 
Lapl=diag(sum(A))-A;
%D=diag(1./sqrt(sum(A)));
 
 % eigenvalues of amplifier constructor




leig=eig(Lapl);

 
 
    if leig(2)<1e-10
     
        continue
     
               else



remTime=diag(findRemeetingTimes(A));

v=find((remTime-ref(:,j))==max(remTime-ref(:,j)));

b=find(A(v(1),:)==1);



       

for i=1:length(b)



    Ad1=A;
    
Ad1(v(1),b(i))=0;
Ad1(b(i),v(1))=0;



Adist(:,:,i)=Ad1;
removed_edge_list(:,i)=[v(1);b(i)];


end
  




% remove isomorphic and disconnected graphs
[p1,L]=connect_test(Adist);

if isempty(p1)==1
    continue
else


Adist=Adist(:,:,p1);

removed_edge_list1=removed_edge_list(:,p1);
removed_edge_list=[];



[~,p]=isomorph_test_eig(Adist,L(:,p1));

Adel=Adist(:,:,p);
removed_edge_list2=removed_edge_list1(:,p);
Adist=[];    

[~,~,n0]=size(Adel);

    ta=trans_amp_graph(Adel);
    
    
     AREV(:,:,count:count+n0-1)=Adel;
     REM_EDGE(:,count:count+n0-1)=removed_edge_list2;
     
     transamp(count:count+n0-1)=ta;
     remTime1(:,count:count+n0-1)=repmat(remTime,1,n0);
     count=count+n0;
    
    
 


    end
      
    
   
    
end




end


