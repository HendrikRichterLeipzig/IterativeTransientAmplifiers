These files provide MATLAB code and data in connection with the article 

Richter, H. Spectral dynamics of guided edge removals and identifying transient amplifiers for death–Birth updating. J. Math. Biol. 87, 3 (2023). https://doi.org/10.1007/s00285-023-01937-1

The mat-files all_XX_YY.mat are the adjacency matrices of the YY-regular graphs with size XX used as the input to the algorithm.



The m-file trans_amp_iter_00 finds the potential transient amplifiers by the iterated perturbation method, it calls the m-files remove_edge_tree1, remove_edge_tree4, connect_test, large_filter1 and small_filter1. 

It uses the function findRemeetingTimes.m 

published with the publication Evolutionary games on weighted heterogeneous graphs
Benjamin Allen; Gabor Lippner; Yu-Ting Chen; Babak Fotouhi; Naghmeh Momeni; Shing-Tung Yau; Martin A. Nowak

which is available at https://zenodo.org/record/276933#.XyE6FTXgo-U
