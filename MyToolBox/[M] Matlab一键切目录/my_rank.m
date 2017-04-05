function y=my_rank(x)
%·ÂsasÖÈ·ÖÎöµÄÑË¸î°æ
%·É·É³öÆ·QQ513829987
[x1,ind]=sort(x);%x1=x(ind)
ind2=linspace(1,size(x,1),size(x,1))';%cumsum(ones(size(x)));
x2(ind)=ind2;x2=x2';
y=[x,x2];
end