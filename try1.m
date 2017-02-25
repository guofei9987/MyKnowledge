clear
clc
close all
data=random('unif',0,1,1000,2);
label=(((data(:,1)-0.5).^2+(data(:,2)-0.5).^2)<0.15);
%label=((data(:,1)+2*data(:,2))<1)


wmi=rand(3,10);
wij=rand(10,1);

a=zeros(3,1);

b=zeros(10,1);
c=b;

d=zeros(1,1);
e=d;

wmi=rand(3,10);
wij=rand(10,1);

count=1
while count<1000
    count=count+1;
    cp=0;
    while cp<1000
        cp=cp+1;
        
        x=[1,data(cp,:)];
        
        t=label(cp);
        
        
        %forward
        
        
        a=x;
        
        b=zeros(10,1);
        c=b;
        
        d=zeros(1,1);
        e=d;
        
        
        for i=1:10
            for m=1:3
                b(i)=b(i)+wmi(m,i)*a(m);
            end
            c(i)=1/(1+exp(-b(i)));
        end
        
        for j=1:1 
            for i=1:10
                d(j)=d(j)+wij(i,j)*c(i);
            end
            e(j) =1/(1+exp(-d(j)));
        end
        %end forward
        
        
        
        
        dj=0;
        di=zeros(10,1);
        
        %backward
        dj=(t-e)*e*(1-e);
        
        for i=1:10
            temp=0;
            for j=1:1
                temnp= wij(i,j)*dj(j);
            end
            di(i)=temp*c(i)*(1-c(i));
        end
        
        
        
        %调整权重
        for m=1:3
            for i=1:10
                wmi(m,i)=wmi(m,i)+0.1*di(i)*a(m);
            end
        end
        
        for i=1:10
            for j=1:1
                
                wij(i,j)=wij(i,j)+0.1*dj(j)*c(i);
            end
            
            
            
        end
        
        
        
    end
    
end



%%


[X,Y]=meshgrid(0:0.1:1);
X=X(:);Y=Y(:);
nnn=size(X,1)
for nn=1:nnn

x=[1,X(nn),Y(nn)]

a=x;

b=zeros(10,1);
c=b;

d=zeros(1,1);
e=d;


for i=1:10
    for m=1:3
        b(i)=b(i)+wmi(m,i)*a(m);
    end
    c(i)=1/(1+exp(-b(i)));
end

for j=1:1
    for i=1:10
        d(j)=d(j)+wij(i,j)*c(i);
    end
    e(j) =1/(1+exp(-d(j)));
end
%end forward

z(nn)=e;

end



figure
plot3(X(:),Y(:),z(:),'.')






