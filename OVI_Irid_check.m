function res=OVI_Irid_check(oviimg)
imreadovi=imread(oviimg);
hsvovi=rgb2hsv(imreadovi);
conhsvovi=im2uint8(hsvovi);


hueovi=conhsvovi(:,:,1);
huelovi=(hueovi>25 & hueovi<56);

satovi=conhsvovi(:,:,2);
satlovi=(satovi>70 & satovi<255);

valovi=conhsvovi(:,:,3);
vallovi=(valovi>76 & valovi<255);




resultovi=huelovi.*satlovi.*vallovi;


res=resultovi;
imshow(resultovi);

concomp=bwconncomp(resultovi,26);

if(concomp.NumObjects>400 & concomp.NumObjects<1500)
    display('authentic');
else
    display('fake'); 
end



end