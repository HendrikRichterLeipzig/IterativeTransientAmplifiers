function[AREV,REM_EDGE1,transamp,remTime1]=remove_edge_tree4(AA,ref,rem_ed) 
% calcuate remeeting times with resepct to the reference
% and gives back non-isomorphic graphs




AREV=[];
transamp=[];
remTime1=[];
gap_origin=[];
REM_EDGE1=[];
LREV=[];

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
  

% flag =1 --> adjacency
% flag =2 --> standard Lapl
% flag =3 --> normalized Lapl

flag_1=3;

% remove isomorphic and disconnected graphs
[p1,L]=connect_test1(Adist,flag_1);

if isempty(p1)==1
    continue
else


Adist=Adist(:,:,p1);
removed_edge_list1=removed_edge_list(:,p1);

removed_edge_list=[]; 



%[pp]=isomorph_gap_test_eig(Adist,L,perc);
[pp]=isomorph_gap_test_eig1(Adist,L);


Adel=Adist(:,:,pp);
removed_edge_list2=removed_edge_list1(:,pp);
Adist=[];    
L=L(:,pp);


% isomorphism amoung the previous

[Adel,Ldel,p0]=iso_merge_4(AREV,Adel,LREV,L);

removed_edge_list3=removed_edge_list2(:,p0);

 

if isempty(Adel)~=1
   
  
[~,~,n0]=size(Adel);

    ta=trans_amp_graph(Adel);
    
  
    
    
     AREV(:,:,count:count+n0-1)=Adel;
     LREV(:,count:count+n0-1)=Ldel;
    
     
     transamp(count:count+n0-1)=ta;
     remTime1(:,count:count+n0-1)=repmat(remTime,1,n0);
     
     count=count+n0;
    
    
end


    end
      
    
   
    
    end


    

[~,ccc2]=size(removed_edge_list3);

fff=[repmat(rem_ed(:,j),1,ccc2);removed_edge_list3];

 REM_EDGE1=[REM_EDGE1,fff];

end


