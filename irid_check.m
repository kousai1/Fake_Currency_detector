function ret=irid_check(iridimg)
imreadirid=imread(iridimg);
hsvirid=rgb2hsv(imreadirid);
conhsvirid=im2uint8(hsvirid);

hueirid=conhsvirid(:,:,1);
huelirid=(hueirid>93 & hueirid<153);

satirid=conhsvirid(:,:,2);
satlirid=(satirid>0 & satirid<255);

valirid=conhsvirid(:,:,3);
vallirid=(valirid>144 & valirid<255);

resultirid=huelirid.*satlirid.*vallirid;

ret=resultirid;
imshow(resultirid);

if(concomp.NumObjects>100)
    display('authentic');
else
    display('fake'); 
end
end