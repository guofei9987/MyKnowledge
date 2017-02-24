%��ͼ��дһ��������BP������


%�ϸ���BP������㹫ʽ����Ƶ�һ��matlab����,��BP����������Ż����
%��������δʵ��
%yyy������o(k)���㹫ʽʱ�����������ƽ̹��ʱ(<0.0001)ѧϰ�ʼӴ� ������ѧϰ���ֻ�ԭ
%v(i,j)=v(i,j)+deltv(i,j)+a*dv(i,j); ������

clear
clc
close

numlayers=3;  %�������
num_per_layer=[3,10,1]; %ÿ���������Ԫ��������һ��1*numlayers�ľ���

for layer_ind=1:numlayers-1%����ÿ��layer��ÿ��neural֮���Ȩ��w
    
    w{1,layer_ind+1}=rand(num_per_layer(layer_ind),num_per_layer(layer_ind+1));%��i���Ȩ��,��1�㲻������
    delta_w_init{1,layer_ind+1}=zeros(num_per_layer(layer_ind+1),1);%��i+1����ݶ�
    u_init{1,layer_ind+1}=zeros(num_per_layer(layer_ind+1),1);%��i������룬��һ�㲻������
    v_init=u_init;%��i������
    
    d_w=delta_w_init;%!!!��������ʱ���漰
end



%%
da=random('unif',0,1,3000,2);
labels=(da(:,1)+da(:,2)<1);


samplenum=size(da,1);

c=ones(3000,1);%*(-1);%!!!-1������������


dat = [c da];%��������������

%
inputNums=3; %�����ڵ�
outputNums=1; %�����ڵ�
% hideNums=10; %����ڵ���

maxcount=100; %����������
precision=0.001; %Ԥ�辫��

eta=0.1; %ѧϰ���趨ֵ

a=0.5; %BP�Ż��㷨��һ���趨ֵ��������ѵ���ĵ���ֵ�������޸�

error=zeros(1,maxcount+1); %error�����ʼ����Ŀ����Ԥ�����ڴ�ռ�
errorp=zeros(1,samplenum); %ͬ��

%v=rand(inputNums,hideNums); %3*10;v��ʼ��Ϊһ��3*10�������һ����; v������㵽�����Ȩֵ
%deltv=zeros(inputNums,hideNums); %3*10;�ڴ�ռ�Ԥ����
%dv=zeros(inputNums,hideNums); %3*10;

%w=rand(hideNums,outputNums); %10*3;w�����㵽������Ȩֵ
%deltw=zeros(hideNums,outputNums);%10*3
%dw=zeros(hideNums,outputNums); %10*3

samplelist=dat;
expectlist=labels;

%samplelist=[0.1323,0.323,-0.132;0.321,0.2434,0.456;-0.6546,-0.3242,0.3255]; %3*3;ָ������ֵ3*3(ʵΪ3������)
%expectlist=[0.5435,0.422,-0.642;0.1,0.562,0.5675;-0.6464,-0.756,0.11]; %3*3;�������ֵ3*3(ʵΪ3������)
count=1;


while (count<=maxcount) %��������1����1000��
    count
    c=1;
    while (c<=samplenum)%����ÿ���������룬�������������һ��BPѵ��
        for k=1:outputNums  %���ÿ���������������
            d(k)=expectlist(c,k); %����������������,d(1:3)��ʾһ�����������ڵ�ֵ
        end
        
        for i=1:inputNums  %���ÿ����������������
            x(i)=samplelist(c,i); % x(1:3)��һ��ѵ������
        end
        
        %Forward();
        
        
        u=u_init;
        v=v_init;%���u��v���Ա����
        
        %��һ��:forward
        for i=1:num_per_layer(1)
            v{1}(i)=x(i);%��һ����Ԫ����������
        end
        %end
        
        %�м�㣺forward
        for layer_ind=2:numlayers-1
            for j=1:num_per_layer(layer_ind)
                for i=1:num_per_layer(layer_ind-1)
                    
                    u{layer_ind}(j)=u{layer_ind}(j)+w{layer_ind}(i,j)*v{layer_ind-1}(i);
                end
                v{layer_ind}(j)= 1/(1+exp(-u{layer_ind}(j)));%�м��ȫ��sigmoid
            end
        end
        %end
        
        %���һ�㣺forward
        for i=1:num_per_layer(numlayers-1)
            for j=1:num_per_layer(numlayers)
                u{numlayers}(j)=u{numlayers}(j)+w{numlayers}(i,j)*v{numlayers-1}(j);
            end
            v{numlayers}(j)= u{numlayers}(j);%���һ����������Ԫ
        end
        %end
        
        %BpError(c)�������
        errortmp=0.0;
        for j=1:num_per_layer(numlayers)
            errortmp=errortmp+0.5*(d(j)-v{numlayers}(j))^2; % �������ά�ȵ����ƽ����
        end
        errorp(c)=0.5*errortmp;
        %end
        
        
        %Backward();���򴫲�
        delta_w=delta_w_init;%�ݶȹ�0
        
        %���һ����ݶ�
        
            for j=1:num_per_layer(numlayers)
                delta_w{numlayers}(j)=(d(j)-v{numlayers}(j))*(-1);
            end
    
        
        %�м����ݶ�
        for layer_ind=(numlayers-1):-1:2
            for i=1:num_per_layer(layer_ind)
                for j=1:num_per_layer(layer_ind+1)
                    delta_w{layer_ind}(i)=delta_w{layer_ind}(i)+w{layer_ind+1}(i,j)*delta_w{layer_ind+1}(j)*v{layer_ind}(j)*(1-v{layer_ind}(j));
                end
            end
        end
        
        %����Ȩ��
        for layer_ind=2:numlayers
            for i=1:num_per_layer(layer_ind-1)
                for j=1:num_per_layer(layer_ind)
                    w{layer_ind}(i,j)=w{layer_ind}(i,j)-eta*delta_w{layer_ind}(j)*v{layer_ind-1}(i);
                end
            end
        end
        
        
        
        c=c+1; %������һ����������
    end  %�ڶ���while��������ʾһ��BPѵ������
    
    w{2}
    w{3}
    
    double tmp;
    tmp=0.0; %�ִ�8
    for i=1:samplenum
        tmp=tmp+errorp(i)*errorp(i);%������
    end
    tmp=tmp/c;
    error(count)=sqrt(tmp);%�������count�ֵ�����������,������
    
    if (error(count)<precision)%��һ����������
        break;
    end
    count=count+1;%ѵ��������1
end% ��һ��while����
error(maxcount+1)=error(maxcount);
p=1:count;
pp=p/50;
plot(pp,error(p),'-'); %��ʾ���

%% �������������ʹ��



[X,Y]=meshgrid(0:0.1:1,0:0.1:1);

ddd=[X(:),Y(:)]
nnnn=size(ddd,1)
for nnn=1:nnnn
    x=[1,ddd(nnn,:)]
    u=u_init;
    v=v_init;%���u��v���Ա����
    
    %��һ��:forward
    for i=1:num_per_layer(1)
        v{1}(i)=x(i);%��һ����Ԫ����������
    end
    %end
    
    %�м�㣺forward
    for layer_ind=2:numlayers-1
        
        for i=1:num_per_layer(layer_ind-1)
            for j=1:num_per_layer(layer_ind)
                u{layer_ind}(j)=u{layer_ind}(j)+w{layer_ind}(i,j)*v{layer_ind-1}(i);
            end
            v{layer_ind}(j)= 1/(1+exp(-u{layer_ind}(j)));%�м��ȫ��sigmoid
        end
    end
    %end
    
    %���һ�㣺forward
    for i=1:num_per_layer(numlayers-1)
        for j=1:num_per_layer(numlayers)
            u{numlayers}(j)=u{numlayers}(j)+w{numlayers}(i,j)*v{numlayers-1}(j);
        end
        v{numlayers}(j)= u{numlayers}(j);%���һ����������Ԫ
    end
    
    z(nnn)=v{numlayers};
    
end
figure
plot3(X(:),Y(:),z,'.')