function[Adel,rem_out,edges_out,handle]=small_filter1(A,rem,edges,gap,limit) 









[~,~,n3]=size(A);










h=sortrows([gap;1:1:length(gap)]',1);



Adel=A(:,:,h(1:min(limit,length(gap)),2));

rem_out=rem(:,h(1:min(limit,length(gap)),2));
edges_out=edges(:,h(1:min(limit,length(gap)),2));
handle=h(1:min(limit,length(gap)),2);