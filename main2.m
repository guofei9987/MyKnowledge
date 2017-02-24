%试图编写一个更多层的BP神经网络


%严格按照BP网络计算公式来设计的一个matlab程序,对BP网络进行了优化设计
%下面两行未实现
%yyy，即在o(k)计算公式时，当网络进入平坦区时(<0.0001)学习率加大， 出来后学习率又还原
%v(i,j)=v(i,j)+deltv(i,j)+a*dv(i,j); 动量项

clear
clc
close

numlayers=3;  %网络层数
num_per_layer=[3,10,1]; %每层网络的神经元个数，是一个1*numlayers的矩阵

for layer_ind=1:numlayers-1%生成每个layer，每个neural之间的权重w
    
    w{1,layer_ind+1}=rand(num_per_layer(layer_ind),num_per_layer(layer_ind+1));%第i层的权重,第1层不起作用
    delta_w_init{1,layer_ind+1}=zeros(num_per_layer(layer_ind+1),1);%第i+1层的梯度
    u_init{1,layer_ind+1}=zeros(num_per_layer(layer_ind+1),1);%第i层的输入，第一层不起作用
    v_init=u_init;%第i层的输出
    
    d_w=delta_w_init;%!!!动量项暂时不涉及
end



%%
da=random('unif',0,1,3000,2);
labels=(da(:,1)+da(:,2)<1);


samplenum=size(da,1);

c=ones(3000,1);%*(-1);%!!!-1合理性有疑问


dat = [c da];%组成输入增广矩阵

%
inputNums=3; %输入层节点
outputNums=1; %输出层节点
% hideNums=10; %隐层节点数

maxcount=100; %最大迭代次数
precision=0.001; %预设精度

eta=0.1; %学习率设定值

a=0.5; %BP优化算法的一个设定值，对上组训练的调整值按比例修改

error=zeros(1,maxcount+1); %error数组初始化；目的是预分配内存空间
errorp=zeros(1,samplenum); %同上

%v=rand(inputNums,hideNums); %3*10;v初始化为一个3*10的随机归一矩阵; v表输入层到隐层的权值
%deltv=zeros(inputNums,hideNums); %3*10;内存空间预分配
%dv=zeros(inputNums,hideNums); %3*10;

%w=rand(hideNums,outputNums); %10*3;w表隐层到输出层的权值
%deltw=zeros(hideNums,outputNums);%10*3
%dw=zeros(hideNums,outputNums); %10*3

samplelist=dat;
expectlist=labels;

%samplelist=[0.1323,0.323,-0.132;0.321,0.2434,0.456;-0.6546,-0.3242,0.3255]; %3*3;指定输入值3*3(实为3个向量)
%expectlist=[0.5435,0.422,-0.642;0.1,0.562,0.5675;-0.6464,-0.756,0.11]; %3*3;期望输出值3*3(实为3个向量)
count=1;


while (count<=maxcount) %结束条件1迭代1000次
    count
    c=1;
    while (c<=samplenum)%对于每个样本输入，计算输出，进行一次BP训练
        for k=1:outputNums  %获得每个样本的期望输出
            d(k)=expectlist(c,k); %获得期望输出的向量,d(1:3)表示一个期望向量内的值
        end
        
        for i=1:inputNums  %获得每个样本的输入向量
            x(i)=samplelist(c,i); % x(1:3)表一个训练向量
        end
        
        %Forward();
        
        
        u=u_init;
        v=v_init;%清空u，v，以便迭代
        
        %第一层:forward
        for i=1:num_per_layer(1)
            v{1}(i)=x(i);%第一层神经元不进行运算
        end
        %end
        
        %中间层：forward
        for layer_ind=2:numlayers-1
            for j=1:num_per_layer(layer_ind)
                for i=1:num_per_layer(layer_ind-1)
                    
                    u{layer_ind}(j)=u{layer_ind}(j)+w{layer_ind}(i,j)*v{layer_ind-1}(i);
                end
                v{layer_ind}(j)= 1/(1+exp(-u{layer_ind}(j)));%中间层全是sigmoid
            end
        end
        %end
        
        %最后一层：forward
        for i=1:num_per_layer(numlayers-1)
            for j=1:num_per_layer(numlayers)
                u{numlayers}(j)=u{numlayers}(j)+w{numlayers}(i,j)*v{numlayers-1}(j);
            end
            v{numlayers}(j)= u{numlayers}(j);%最后一层是线性神经元
        end
        %end
        
        %BpError(c)计算误差
        errortmp=0.0;
        for j=1:num_per_layer(numlayers)
            errortmp=errortmp+0.5*(d(j)-v{numlayers}(j))^2; % 所有输出维度的误差平方和
        end
        errorp(c)=0.5*errortmp;
        %end
        
        
        %Backward();误差反向传播
        delta_w=delta_w_init;%梯度归0
        
        %最后一层的梯度
        
            for j=1:num_per_layer(numlayers)
                delta_w{numlayers}(j)=(d(j)-v{numlayers}(j))*(-1);
            end
    
        
        %中间层的梯度
        for layer_ind=(numlayers-1):-1:2
            for i=1:num_per_layer(layer_ind)
                for j=1:num_per_layer(layer_ind+1)
                    delta_w{layer_ind}(i)=delta_w{layer_ind}(i)+w{layer_ind+1}(i,j)*delta_w{layer_ind+1}(j)*v{layer_ind}(j)*(1-v{layer_ind}(j));
                end
            end
        end
        
        %更新权重
        for layer_ind=2:numlayers
            for i=1:num_per_layer(layer_ind-1)
                for j=1:num_per_layer(layer_ind)
                    w{layer_ind}(i,j)=w{layer_ind}(i,j)-eta*delta_w{layer_ind}(j)*v{layer_ind-1}(i);
                end
            end
        end
        
        
        
        c=c+1; %输入下一个样本数据
    end  %第二个while结束；表示一次BP训练结束
    
    w{2}
    w{3}
    
    double tmp;
    tmp=0.0; %字串8
    for i=1:samplenum
        tmp=tmp+errorp(i)*errorp(i);%误差求和
    end
    tmp=tmp/c;
    error(count)=sqrt(tmp);%求迭代第count轮的误差求均方根,即精度
    
    if (error(count)<precision)%另一个结束条件
        break;
    end
    count=count+1;%训练次数加1
end% 第一个while结束
error(maxcount+1)=error(maxcount);
p=1:count;
pp=p/50;
plot(pp,error(p),'-'); %显示误差

%% 下面是神经网络的使用



[X,Y]=meshgrid(0:0.1:1,0:0.1:1);

ddd=[X(:),Y(:)]
nnnn=size(ddd,1)
for nnn=1:nnnn
    x=[1,ddd(nnn,:)]
    u=u_init;
    v=v_init;%清空u，v，以便迭代
    
    %第一层:forward
    for i=1:num_per_layer(1)
        v{1}(i)=x(i);%第一层神经元不进行运算
    end
    %end
    
    %中间层：forward
    for layer_ind=2:numlayers-1
        
        for i=1:num_per_layer(layer_ind-1)
            for j=1:num_per_layer(layer_ind)
                u{layer_ind}(j)=u{layer_ind}(j)+w{layer_ind}(i,j)*v{layer_ind-1}(i);
            end
            v{layer_ind}(j)= 1/(1+exp(-u{layer_ind}(j)));%中间层全是sigmoid
        end
    end
    %end
    
    %最后一层：forward
    for i=1:num_per_layer(numlayers-1)
        for j=1:num_per_layer(numlayers)
            u{numlayers}(j)=u{numlayers}(j)+w{numlayers}(i,j)*v{numlayers-1}(j);
        end
        v{numlayers}(j)= u{numlayers}(j);%最后一层是线性神经元
    end
    
    z(nnn)=v{numlayers};
    
end
figure
plot3(X(:),Y(:),z,'.')