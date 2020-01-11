function gg=chongdie(P,L,x,y)
global imbs;
global imqs;
global imgs;
u=round(P*rand(1,1));
v=round(L*rand(1,1));

if ((u-x)<imqs(2)&&(u-x)>-imgs(2))
  if ((v-y)<imgs(1)&&(v-y)>-imqs(1))
  gg=chongdie(P,L,x,y);
  end
end

gg=[u,v];
end