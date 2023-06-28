function [allimg,sallc]=imgxycorrect(allimg)
rg=7;
[niters,nfr,nr,nc]=size(allimg);
imlast=squeeze(squeeze(allimg(1,1,:,:)));
seq=0;
for kk=1:niters
    startm=1;
    if kk==1
        startm=2;
    end
    for mm=startm:nfr
        tempcur=zeros(nr+2*rg+1,nc+2*rg+1);
        imcur=squeeze(squeeze(allimg(kk,mm,:,:)));
        for ii=1:2*rg+1
            for jj=1:2*rg+1
                tempcur(ii:(ii+nr-1),jj:(jj+nc-1))=imcur;
                allc(ii,jj)=corr2(imlast,tempcur(rg+1:rg+nr,rg+1:rg+nc));
            end
        end
        seq=seq+1;
        sallc(seq,:,:)=allc;
        [mx mxn]=max(allc);
        [mxx mxnn]=max(mx);
        mxcij=[mxn(mxnn) mxnn];
        tempcur(mxcij(1):(mxcij(1)+nr-1),mxcij(2):(mxcij(2)+nc-1))=imcur;
        allimg(kk,mm,:,:)=tempcur(rg+1:rg+nr,rg+1:rg+nc);
    end
end