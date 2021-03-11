function [Ch, segmented_imageh] = KMeans(Xh,Kh,maxIterh)
%% 1. Image vectorization based on RGB components
Xh=squeeze(Xh);
X1h=reshape(Xh(:,:,1),[],1);
X2h=reshape(Xh(:,:,2),[],1);
X3h=reshape(Xh(:,:,3),[],1);
Xwh=[X1h X2h X3h];
%% 2. Intial RGB Centroid Calculation

%% 3. Randomly initializing K centroids (select those centroids from the actual points)
Kcenh=randi(size(Xwh,1),[1,Kh]);
for i=1:Kh
Kcenterh(i,:)=Xwh(Kcenh(1,i),:);        %random colum from Xw
end
%% 4. Assign data points to K clusters using the following distance - dist = norm(C-X,1)
for m=1:maxIterh
    clusterh=zeros(154401,2);
    indexh=zeros(154401,1);
    valueh=zeros(154401,1);
    disth=zeros(154401,2);
for n=1:Kh
for i=1:size(Xwh,1)
disth(i,n)=norm(Kcenterh(n,:)-Xwh(i,:),1);
[valueh(i,1),indexh(i,1)]=min(disth(i,:));
 if (indexh(i,1)-n)==0
    clusterh(i,n)=1;
 end
end
Kcenterh(n,:)=mean(Xwh(logical(clusterh(:,n)),:));  
end

%% 5. Re-computing K centroids



end
%% Reiterate through steps 4 and 5 until maxIter reached. Set maxIter = 100


%% Return K centroid coordinates and segmented Image
Ch=Kcenterh;
for i=1:size(Xwh,1)
for n=1:Kh
if clusterh(i,n)==1
    imageh(i,:)=Kcenterh(n,:);
else
    imageh(i,:)=[0 0 0];
end
end
end
for i=1:3
image3(:,:,i)=reshape(imageh(:,i),[size(Xh,1) size(Xh,2)]);
end
segmented_imageh=image3;
end
