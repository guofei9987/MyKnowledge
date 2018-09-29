%BP神经网络
%输出层换为线性神经元，成功！
%二维分类，成功！
%没有加速项

clear
clc
close all

%data=random('unif',0,1,3000,2);
%label=(((data(:,1)-0.5).^2+(data(:,2)-0.5).^2)<0.12);

% data=0:0.1:5
% data=data'
% label=cos(data*2)+sin(data);

% data=random('unif',0,5,300,2);
% label1=(((data(:,1)-1.25).^2+(data(:,2)-1.25).^2)<0.5);
% label2=(((data(:,1)-3).^2+(data(:,2)-3).^2)<0.5);
% label=label1|label2;

data=random('unif',0,5,300,2);
label1=(((data(:,1)-1.25).^2+(data(:,2)-2.5).^2)<0.8);
label2=(((data(:,1)-3.75).^2+(data(:,2)-2.5).^2)<0.8);
label=label1|label2;


num_per_layer=[3,10,4,1];
plot3(data(:,1),data(:,2),label,'.')
num_layer=size(num_per_layer,2);

for i=2:num_layer
    w{i}=rand(num_per_layer(i-1),num_per_layer(i));
end

for i=1:num_layer
    u_init{i}=zeros(num_per_layer(i),1);
end
v_init=u_init;
delta_w_init=u_init;

maxcount=500;count=0;
eta=0.1;%学习率
samplenum=size(data,1);
while count<maxcount
    count=count+1
    c=0;
    while c<samplenum
        c=c+1;
        
        x=[1,data(c,:)];
        t=label(c,:);
        
        %forward()
        u=u_init;
        v=v_init;
        for i=1:num_per_layer(1)
            v{1}(i)=x(i);
        end
        
        for layer_ind=2:num_layer-1
            for j=1:num_per_layer(layer_ind)
                for i=1:num_per_layer(layer_ind-1)
                    u{layer_ind}(j)=u{layer_ind}(j)+w{layer_ind}(i,j)*v{layer_ind-1}(i);
                end
                v{layer_ind}(j)=1/(1+exp(-u{layer_ind}(j)));
            end
            
        end
        
        layer_ind=num_layer;
        for j=1:num_per_layer(layer_ind)
            for i=1:num_per_layer(layer_ind-1)
                u{layer_ind}(j)=u{layer_ind}(j)+w{layer_ind}(i,j)*v{layer_ind-1}(i);
            end
            v{layer_ind}(j)=u{layer_ind}(j);
        end
        
        %end forward
        
        
        %backward
        delta_w=delta_w_init;
        for j=1:num_per_layer(num_layer)
            delta_w{num_layer}(j)=(t(j)-v{num_layer}(j));%*(v{num_layer}(j))*(1-v{num_layer}(j));
        end
        
        for layer_ind=num_layer-1:-1:2
            for i=1:num_per_layer(layer_ind)
                temp=0;
                for j=1:num_per_layer(layer_ind+1)
                    temp=delta_w{layer_ind}(i)+w{layer_ind+1}(i,j)*delta_w{layer_ind+1}(j);
                end
                delta_w{layer_ind}(i)=temp*v{layer_ind}(i)*(1-v{layer_ind}(i));
            end
        end
        
        for layer_ind=2:num_layer
            for i=1:num_per_layer(layer_ind-1)
                for j=1:num_per_layer(layer_ind)
                    w{layer_ind}(i,j)=w{layer_ind}(i,j)+eta*delta_w{layer_ind}(j)*v{layer_ind-1}(i);
                end
            end
        end
        

        
        
    end
end





%%


[X,Y]=meshgrid(0:0.02:5);
X=X(:);Y=Y(:);

for c=1:size(X,1)
    x=[1,X(c),Y(c)];
    u=u_init;
    v=v_init;
    for i=1:num_per_layer(1)
        v{1}(i)=x(i);
    end
    
    for layer_ind=2:num_layer-1
        for j=1:num_per_layer(layer_ind)
            for i=1:num_per_layer(layer_ind-1)
                u{layer_ind}(j)=u{layer_ind}(j)+w{layer_ind}(i,j)*v{layer_ind-1}(i);
            end
            v{layer_ind}(j)=1/(1+exp(-u{layer_ind}(j)));
        end
        
    end
            layer_ind=num_layer;
        for j=1:num_per_layer(layer_ind)
            for i=1:num_per_layer(layer_ind-1)
                u{layer_ind}(j)=u{layer_ind}(j)+w{layer_ind}(i,j)*v{layer_ind-1}(i);
            end
            v{layer_ind}(j)=u{layer_ind}(j);
        end
        
    z(c)=v{end};
end

figure
plot3(X(:),Y(:),z(:),'.')
