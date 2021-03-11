%  K-Means function to generate K clusters of an input image
%  Author Name:
function [C, segmented_image] = KMeans(X,K,maxIter)
%% 1. Image vectorization based on RGB components
X=squeeze(X);
X1=reshape(X(:,:,1),[],1);
X2=reshape(X(:,:,2),[],1);
X3=reshape(X(:,:,3),[],1);
Xw=[X1 X2 X3];
%% 2. Intial RGB Centroid Calculation

%% 3. Randomly initializing K centroids (select those centroids from the actual points)
Kcen=randi(size(Xw,1),[1,K]);
for i=1:K
Kcenter(i,:)=Xw(Kcen(1,i),:);        %random colum from Xw
end
%% 4. Assign data points to K clusters using the following distance - dist = norm(C-X,1)
for m=1:maxIter
    cluster=zeros(154401,2);
    index=zeros(154401,1);
    value=zeros(154401,1);
    dist=zeros(154401,2);
for n=1:K
for i=1:size(Xw,1)
dist(i,n)=norm(Kcenter(n,:)-Xw(i,:),1);
end
end
for i=1:size(Xw,1)
[value(i,1),index(i,1)]=min(dist(i,:));
end
%% 5. Re-computing K centroids
for i=1:size(Xw,1)
    for n=1:K
        if (index(i,1)-n)==0
        cluster(i,n)=1;
        end
    end
end

for n=1:K
Kcenter(n,:)=mean(Xw(logical(cluster(:,n)),:));            %new center
end
end
%% Reiterate through steps 4 and 5 until maxIter reached. Set maxIter = 100


%% Return K centroid coordinates and segmented Image
C=Kcenter;
for i=1:size(Xw,1)
for n=1:K
if cluster(i,n)==1
    image(i,:)=Kcenter(n,:);
end
end
end
for i=1:3
image1(:,:,i)=reshape(image(:,i),[size(X,1) size(X,2)]);
end
segmented_image=image1;
end
