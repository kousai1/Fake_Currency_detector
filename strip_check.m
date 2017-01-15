function strip_check(img)
model=imread('littlesmodel.jpg');
timg=imread(img);

modelgray=rgb2gray(model);
timggray=rgb2gray(timg);

points1=detectSURFFeatures(modelgray);
points2=detectSURFFeatures(timggray);

[f1,vtsp1]=extractFeatures(modelgray,points1);
[f2,vtsp2]=extractFeatures(timggray,points2);

[indexpairs,matchmetric]=matchFeatures(f1,f2);

matchedpoints1=vtsp1(indexpairs(:,1));
matchedpoints2=vtsp2(indexpairs(:,2));


figure;

showMatchedFeatures(modelgray,timggray,matchedpoints1,matchedpoints2);

if(numel(matchmetric)>5)
    display('authentic');
else
    display('fake');
end
end