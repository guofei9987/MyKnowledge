%Դ�����޳����ٹ���
%�ϸ���BP������㹫ʽ����Ƶ�һ��matlab����,��BP����������Ż����
%yyy������o(k)���㹫ʽʱ�����������ƽ̹��ʱ(<0.0001)ѧϰ�ʼӴ� ������ѧϰ���ֻ�ԭ
%v(i,j)=v(i,j)+deltv(i,j)+a*dv(i,j); ������

clear all
clc   %��������
close

da=random('unif',0,1,3000,2);
labels=((da(:,1)-0.5).^2+(da(:,2)-0.5).^2<0.12);

%da=random('unif',0,5,3000,2);
%labels=(((da(:,1)-2.5).^2+2*(da(:,2)-2.5).^2)<2);

c=ones(3000,1);
dat = [c da];%��������������
%labels=d(:,3);
inputNums=3; %�����ڵ�
outputNums=1; %�����ڵ�
hideNums=10; %����ڵ���
maxcount=1000; %����������
samplenum=3000; %һ����������������
precision=0.001; %Ԥ�辫��
yyy=1.3; %yyy�ǰ�����������߳�ƽ̹��

alpha=0.01; %ѧϰ���趨ֵ
a=0.5; %BP�Ż��㷨��һ���趨ֵ��������ѵ���ĵ���ֵ�������޸�
error=zeros(1,maxcount+1); %error�����ʼ����Ŀ����Ԥ�����ڴ�ռ�
errorp=zeros(1,samplenum); %ͬ��

v=rand(inputNums,hideNums); %3*10;v��ʼ��Ϊһ��3*10�������һ����; v������㵽�����Ȩֵ
deltv=zeros(inputNums,hideNums); %3*10;�ڴ�ռ�Ԥ����
dv=zeros(inputNums,hideNums); %3*10;

w=rand(hideNums,outputNums); %10*3;w�����㵽������Ȩֵ
deltw=zeros(hideNums,outputNums);%10*3
dw=zeros(hideNums,outputNums); %10*3

samplelist=dat;
expectlist=labels;

%samplelist=[0.1323,0.323,-0.132;0.321,0.2434,0.456;-0.6546,-0.3242,0.3255]; %3*3;ָ������ֵ3*3(ʵΪ3������)
%expectlist=[0.5435,0.422,-0.642;0.1,0.562,0.5675;-0.6464,-0.756,0.11]; %3*3;�������ֵ3*3(ʵΪ3������)
count=1;
while (count<=maxcount) %��������1����1000��
    c=1;
    while (c<=samplenum)%����ÿ���������룬�������������һ��BPѵ��
        for k=1:outputNums  %���ÿ���������������
            d(k)=expectlist(c,k); %����������������,d(1:3)��ʾһ�����������ڵ�ֵ
        end
        
        for i=1:inputNums  %���ÿ����������������
            x(i)=samplelist(c,i); % x(1:3)��һ��ѵ������
        end
        
        %Forward();
        for j=1:hideNums  %����ÿ�����ؽڵ㣬�������Ϊ������ά������ӦȨ�ص��ۼӺ�
            net=0.0;
            for i=1:inputNums
                net=net+x(i)*v(i,j);
            end
            y(j)=1/(1+exp(-net));
        end
        for k=1:outputNums %��ÿ������ڵ��ֵ
            net=0.0;
            for j=1:hideNums
                net=net+y(j)*w(j,k);
            end
            o(k)=1/(1+exp(-net));
            
        end
        
        %BpError(c)����/�޸�;
        errortmp=0.0;
        for k=1:outputNums
            errortmp=errortmp+(d(k)-o(k))^2; % ��һ��ѵ�����������
        end
        errorp(c)=0.5*errortmp;
        %end
        
        %Backward();
        for k=1:outputNums
            yitao(k)=(d(k)-o(k))*o(k)*(1-o(k)); %��������ƫ��
        end
        for j=1:hideNums
            tem=0.0;
            for k=1:outputNums
                tem=tem+yitao(k)*w(j,k); %Ϊ��������ƫ����������ġ�
            end
            yitay(j)=tem*y(j)*(1-y(j)); %����ƫ��
        end
        
        %��������Ȩֵ
        for j=1:hideNums  %���ڵ�ÿ�����ص㵽������Ȩ��
            for k=1:outputNums
                deltw(j,k)=alpha*yitao(k)*y(j); %Ȩֵw�ĵ�����deltw(�ѳ�ѧϰ��)
                w(j,k)=w(j,k)+deltw(j,k);%+a*dw(j,k);%Ȩֵ�����������dw=dletw(t-1)��ʵ���Ƕ�BP�㷨��һ��
                %dw(j,k)=deltw(j,k); %�Ľ���ʩ--���Ӷ�����Ŀ�������ѵ���ٶ�
            end
        end
        for i=1:inputNums  %����ÿ������㵽���ص��Ȩ��
            for j=1:hideNums
                deltv(i,j)=alpha*yitay(j)*x(i); %ͬ��deltw
                v(i,j)=v(i,j)+deltv(i,j);%+a*dv(i,j);
                %dv(i,j)=deltv(i,j);
            end
        end
        c=c+1; %������һ����������
    end  %�ڶ���while��������ʾһ��BPѵ������
    
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



x=[-1,3,3]

%Forward();
for j=1:hideNums  %����ÿ�����ؽڵ㣬�������Ϊ������ά������ӦȨ�ص��ۼӺ�
    net=0.0;
    for i=1:inputNums
        net=net+x(i)*v(i,j);
    end
    y(j)=1/(1+exp(-net));
end
for k=1:outputNums %��ÿ������ڵ��ֵ
    net=0.0;
    for j=1:hideNums
        net=net+y(j)*w(j,k);
    end
    
    o(k)=1/(1+exp(-net));

end
o
%% �ٴ�ʹ�ã�����ȫɨ�裩


[X,Y]=meshgrid(0:0.02:1,0:0.02:1);
data=[X(:),Y(:)];

nnn=size(data,1)
xx=[ones(nnn,1),data]

for n=1:nnn
    x=xx(n,:);

%Forward();
for j=1:hideNums  %����ÿ�����ؽڵ㣬�������Ϊ������ά������ӦȨ�ص��ۼӺ�
    net=0.0;
    for i=1:inputNums
        net=net+x(i)*v(i,j);
    end
    y(j)=1/(1+exp(-net));
end
for k=1:outputNums %��ÿ������ڵ��ֵ
    net=0.0;
    for j=1:hideNums
        net=net+y(j)*w(j,k);
    end
    
    o(k)=1/(1+exp(-net));

end
    oo(n)=o(k);
    
end
plot3(data(:,1),data(:,2),oo(:),'.')