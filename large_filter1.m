function[Adel,rem_out,edges_out]=large_filter1(A,rem,edges,centr,limit) 









[~,~,n3]=size(A);








h=sortrows([centr;1:1:length(centr)]',1);

h=flipud(h);

Adel=A(:,:,h(1:min(limit,length(centr)),2));
rem_out=rem(:,h(1:min(limit,length(centr)),2));

edges_out=edges(:,h(1:min(limit,length(centr)),2));


