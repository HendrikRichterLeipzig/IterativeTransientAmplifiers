function[amp_tree]=trans_amp_iter_00(filter,AA) 

% iterative construction transient amplifiers
% traces the evolution of N_eff
% input AA --> regular input graphs


















[n,~,n1]=size(AA)

d=sum(AA(:,1,1));

count=1;


% maximal search depth

kk=1+(d-2)*n/2;


% limit for filter
filt_lim=500;




for i1=1:n1






    [Adel,rem_edge,transamp,remTime]=remove_edge_tree1(AA(:,:,i1),zeros(n,1));
    
   
  
    
      %cr=resist(Adel);
      
      % flag = 1 --> standard Laplacian
% flag = 2 --> normalized Laplacian
flag=2;
   cr=calc_gaps(Adel,flag);
 
   
   transamp=round(transamp,5,'significant');
   
  
 
   
   
   d=find(transamp>n);
   ta=transamp(d);
   
       if isempty(ta)==0
   ta
   end
   
   A0=Adel(:,:,d);
  
   removed_ed=rem_edge(:,d);
   
 
    
    
  amp_tree{count}={i1,0,cr,transamp,ta,A0,removed_ed};
  count=count+1;  
   
    
       

    
   
    
    for i2=1:kk

    
    
   
    
  
    
    [Adel,rem_edge,transamp,remTime]=remove_edge_tree4(Adel,remTime,rem_edge);   
    
        if isempty(Adel)==1
    break
    else
    
    
    
      
       %cr=resist(Adel);
       cr=calc_gaps(Adel,flag);
   
   % tells for each gap where it comes from 
    
   transamp=round(transamp,5,'significant');
     

   
   
   
   d=find(transamp>n);
   ta=transamp(d);
   
       if isempty(ta)==0
   ta
       end
   
   A0=Adel(:,:,d);
   
   
   removed_ed=rem_edge(:,d);

       amp_tree{count}={i1,i2,cr,transamp,ta,A0,removed_ed};
    
   
     count=count+1;
   
   
   
      % filtering according to gap
 
    if filter==1
           
     [Adel,remTime,rem_edge]=small_filter1(Adel,remTime,rem_edge,cr(1,:),filt_lim);
              
        
     
       elseif filter==2
     [Adel,remTime,rem_edge]=large_filter1(Adel,remTime,rem_edge,cr(2,:),filt_lim);
   
     
     
     
    end
       
 
       
 
   
        end
   
   
 
    
    
    end
        
       end
    
    
    
    
    
