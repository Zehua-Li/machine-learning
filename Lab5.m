% K-Means Implementation
%% Step 1: K-Means Algorithm
%Write your code in the file "KMeans.m" included in the folder. Your KMeans(Image,K,maxIter) function takes in 3 inputs — 1) Image, to run K-Means segmentation on, 2) K, denoting the number of segments you wish to classify the pixels of the image image into, 3) maxIter, specifying the upper bound on the number of iterations before the code terminates. The KMeans function should ouput the following — 1) final set of coordinates of the K centroids, 2) final segmented image based on the K centroids. 
% [centroid_coord, segmented_image] = KMeans(Image,K,maxIter);

%% Step 2: Testing 
% Load elephant.jpg and eiffel.jpg images and run K-Means, with K = 2, K = 5 and K = 10 on both the images. Generate two figures, for elephant and eiffel images, with each figure having 4 subplots with the original image and segmented images (see Fig. 1).
ele=double(imread('D:\machine learning\Lab5\elephant.jpg'));
eif=double(imread('D:\machine learning\Lab5\eiffel.jpg'));
eif1=reshape(eif(:,:,1),[],1);
eif2=reshape(eif(:,:,2),[],1);
eif3=reshape(eif(:,:,3),[],1);
eifw=[eif1 eif2 eif3];
ele1=reshape(ele(:,:,1),[],1);
ele2=reshape(ele(:,:,2),[],1);
ele3=reshape(ele(:,:,3),[],1);
elew=[ele1 ele2 ele3];
eif=double(imread('D:\machine learning\Lab5\eiffel.jpg'));
k=[2 5 10];
[C1,segmented_image1]=KMeans(ele,2,100);
t2=cputime;
[C2,segmented_image2]=KMeans(ele,5,100);
t3=cputime-t2;
[C3,segmented_image3]=KMeans(ele,10,100);
[C4,segmented_image4]=KMeans(eif,2,100);
[C5,segmented_image5]=KMeans(eif,5,100);
[C6,segmented_image6]=KMeans(eif,10,100);
figure
subplot(2,2,1)
imshow(uint8(ele),[]);
title('original');
box off
subplot(2,2,2)
imshow(uint8(segmented_image1),[]);
title('K=2');
box off
subplot(2,2,3)
imshow(uint8(segmented_image2),[]);
title('K=5');
box off
subplot(2,2,4)
imshow(uint8(segmented_image3),[]);
title('K=10');
box off
figure
subplot(2,2,1)
imshow(uint8(eif),[]);
title('original');
box off
subplot(2,2,2)
imshow(uint8(segmented_image4),[]);
title('K=2');
box off
subplot(2,2,3)
imshow(uint8(segmented_image5),[]);
title('K=5');
box off
subplot(2,2,4)
imshow(uint8(segmented_image6),[]);
title('K=10');
box off
%% Step 3: Comparison with MATLAB K-Means
% Now use the inbuilt MATLAB kmeans function and compare the output for the elephant.jpg image only. You code should generate one figure with the original image, segmented image from your K-Means code with K = 5, segmented image from the MATLAB K-Means function with K = 5.
t0=cputime;
[idx,C,sumd,D]=kmeans(elew,5);
for i=1:size(elew,1)
for n=1:5
if (idx(i,1)-n)==0
    cluster1(i,n)=1;
end
end
end
for i=1:size(elew,1)
for n=1:5
if cluster1(i,n)==1
    im(i,:)=C(n,:);
end
end
end
for i=1:3
imfinal(:,:,i)=reshape(im(:,i),[321 481]);
end
t1=cputime-t0;
figure
subplot(1,2,1)
imshow(uint8(imfinal),[]);
title('matlab kmeans');
box off
subplot(1,2,2)
imshow(uint8(segmented_image2),[]);
title('my kmeans');
box off
%% Step 4: Code Optimization (Optional)
% Generate the times it takes to run your K-Means and the MATLAB K-Means function with K = 5 on the elephant image. Print the runtimes. Try optimizing your K-Means code to generate the segmented image within the order of a few seconds, in comparison to the MATLAB K-Means computation times.
% t10=cputime;
% [C10, segmented_image10] = KMeans2(ele,5,100);
% t11=cputime-t10;
% imshow(uint8(segmented_image10),[]);