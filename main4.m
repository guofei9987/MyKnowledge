%源代码剔除加速功能
%严格按照BP网络计算公式来设计的一个matlab程序,对BP网络进行了优化设计
%yyy，即在o(k)计算公式时，当网络进入平坦区时(<0.0001)学习率加大， 出来后学习率又还原
%v(i,j)=v(i,j)+deltv(i,j)+a*dv(i,j); 动量项

clear all
clc   %清除命令窗口
close

da=random('unif',0,1,3000,2);
labels=((da(:,1)-0.5).^2+(da(:,2)-0.5).^2<0.12);

%da=random('unif',0,5,3000,2);
%labels=(((da(:,1)-2.5).^2+2*(da(:,2)-2.5).^2)<2);

c=ones(3000,1);
dat = [c da];%组成输入增广矩阵
%labels=d(:,3);
inputNums=3; %输入层节点
outputNums=1; %输出层节点
hideNums=10; %隐层节点数
maxcount=1000; %最大迭代次数
samplenum=3000; %一个计数器，无意义
precision=0.001; %预设精度
yyy=1.3; %yyy是帮助网络加速走出平坦区

alpha=0.01; %学习率设定值
a=0.5; %BP优化算法的一个设定值，对上组训练的调整值按比例修改
error=zeros(1,maxcount+1); %error数组初始化；目的是预分配内存空间
errorp=zeros(1,samplenum); %同上

v=rand(inputNums,hideNums); %3*10;v初始化为一个3*10的随机归一矩阵; v表输入层到隐层的权值
deltv=zeros(inputNums,hideNums); %3*10;内存空间预分配
dv=zeros(inputNums,hideNums); %3*10;

w=rand(hideNums,outputNums); %10*3;w表隐层到输出层的权值
deltw=zeros(hideNums,outputNums);%10*3
dw=zeros(hideNums,outputNums); %10*3

samplelist=dat;
expectlist=labels;

%samplelist=[0.1323,0.323,-0.132;0.321,0.2434,0.456;-0.6546,-0.3242,0.3255]; %3*3;指定输入值3*3(实为3个向量)
%expectlist=[0.5435,0.422,-0.642;0.1,0.562,0.5675;-0.6464,-0.756,0.11]; %3*3;期望输出值3*3(实为3个向量)
count=1;
while (count<=maxcount) %结束条件1迭代1000次
    c=1;
    while (c<=samplenum)%对于每个样本输入，计算输出，进行一次BP训练
        for k=1:outputNums  %获得每个样本的期望输出
            d(k)=expectlist(c,k); %获得期望输出的向量,d(1:3)表示一个期望向量内的值
        end
        
        for i=1:inputNums  %获得每个样本的输入向量
            x(i)=samplelist(c,i); % x(1:3)表一个训练向量
        end
        
        %Forward();
        for j=1:hideNums  %对于每个隐藏节点，求其输出为样本各维乘以相应权重的累加和
            net=0.0;
            for i=1:inputNums
                net=net+x(i)*v(i,j);
            end
            y(j)=1/(1+exp(-net));
        end
        for k=1:outputNums %求每个输出节点的值
            net=0.0;
            for j=1:hideNums
                net=net+y(j)*w(j,k);
            end
            o(k)=1/(1+exp(-net));
            
        end
        
        %BpError(c)反馈/修改;
        errortmp=0.0;
        for k=1:outputNums
            errortmp=errortmp+(d(k)-o(k))^2; % 第一组训练后的误差计算
        end
        errorp(c)=0.5*errortmp;
        %end
        
        %Backward();
        for k=1:outputNums
            yitao(k)=(d(k)-o(k))*o(k)*(1-o(k)); %输出层误差偏导
        end
        for j=1:hideNums
            tem=0.0;
            for k=1:outputNums
                tem=tem+yitao(k)*w(j,k); %为了求隐层偏导，而计算的∑
            end
            yitay(j)=tem*y(j)*(1-y(j)); %隐层偏导
        end
        
        %调整各层权值
        for j=1:hideNums  %调节到每个隐藏点到输出点的权重
            for k=1:outputNums
                deltw(j,k)=alpha*yitao(k)*y(j); %权值w的调整量deltw(已乘学习率)
                w(j,k)=w(j,k)+deltw(j,k);%+a*dw(j,k);%权值调整，这里的dw=dletw(t-1)，实际是对BP算法的一个
                %dw(j,k)=deltw(j,k); %改进措施--增加动量项目的是提高训练速度
            end
        end
        for i=1:inputNums  %调节每个输入点到隐藏点的权重
            for j=1:hideNums
                deltv(i,j)=alpha*yitay(j)*x(i); %同上deltw
                v(i,j)=v(i,j)+deltv(i,j);%+a*dv(i,j);
                %dv(i,j)=deltv(i,j);
            end
        end
        c=c+1; %输入下一个样本数据
    end  %第二个while结束；表示一次BP训练结束
    
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



x=[-1,3,3]

%Forward();
for j=1:hideNums  %对于每个隐藏节点，求其输出为样本各维乘以相应权重的累加和
    net=0.0;
    for i=1:inputNums
        net=net+x(i)*v(i,j);
    end
    y(j)=1/(1+exp(-net));
end
for k=1:outputNums %求每个输出节点的值
    net=0.0;
    for j=1:hideNums
        net=net+y(j)*w(j,k);
    end
    
    o(k)=1/(1+exp(-net));

end
o
%% 再次使用（网格全扫描）


[X,Y]=meshgrid(0:0.02:1,0:0.02:1);
data=[X(:),Y(:)];

nnn=size(data,1)
xx=[ones(nnn,1),data]

for n=1:nnn
    x=xx(n,:);

%Forward();
for j=1:hideNums  %对于每个隐藏节点，求其输出为样本各维乘以相应权重的累加和
    net=0.0;
    for i=1:inputNums
        net=net+x(i)*v(i,j);
    end
    y(j)=1/(1+exp(-net));
end
for k=1:outputNums %求每个输出节点的值
    net=0.0;
    for j=1:hideNums
        net=net+y(j)*w(j,k);
    end
    
    o(k)=1/(1+exp(-net));

end
    oo(n)=o(k);
    
end
plot3(data(:,1),data(:,2),oo(:),'.')