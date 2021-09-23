function [imgno,minc,mincv,av,ac,bv,bc,cv,cc] = findseamw(av,ac,bv,bc,cv,cc)

sz=size(av);
mv=min3(av(1),bv(1),cv(1));

if   mv==av(1)
     minc=ac(1);
     mincv=mv;
     imgno=1;
    for j=1:sz(1)-1
        av(j)=av(j+1);
        ac(j)=ac(j+1);
    end
elseif mv==bv(1)
    minc=bc(1);
    mincv=mv;
    imgno=2;
    for j=1:sz(1)-1
        bv(j)=bv(j+1);
        bc(j)=bc(j+1);
    end
elseif mv==cv(1)
    minc=cc(1);
    mincv=mv;
    imgno=3;
    for j=1:sz(1)-1
        cv(j)=cv(j+1);
        cc(j)=cc(j+1);
    end
end
end

