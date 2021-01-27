

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load the desired network (uncomment the right one)
%
%base model:
load SqueezeFacePoseNet_base_model.mat %lgraph_1
%
%with separable depth-wise convolution
%load SqueezeFacePoseNet_with_separable_DWC.mat %lgraph_1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%layer for feature extraction (Global Average Pooling layer)
layers=66;

%The networks have a softmax and classification layers at the end, but they do not do anything (they are empty).
%They must be there because otherwise Matlab gives an error if there is no classification layer at the end
%When converting to DAG network, Matlab gives a warning because the classification layer is empty, so let's deactivate the warnings
warning off
net=assembleNetwork(lgraph_1);
warning on
clear lgraph_1

%Statistics for input normalization (carry out subtraction of mean of each channel)
pixel_stats_norm=single([131.091200000000,103.882700000000,91.4953000000000]);

%Read your input image
%It must be RGB and of size 113x113 containing the face crop
%If it is not RGB, just replicate the grey channel two times
I = single(imread(['your path to the image']));

%Normalize input
I(:,:,1)=I(:,:,1)-pixel_stats_norm(1);
I(:,:,2)=I(:,:,2)-pixel_stats_norm(2);
I(:,:,3)=I(:,:,3)-pixel_stats_norm(3);

feature_vector=activations(net,I,net.Layers(layers).Name);

%Now do whatever you want with the feature vector (train a classifier, compute
%the distance with another feature vector...)




