%从图片获得点阵坐标
clear;clc
x=imread('fei.png');%64*64点阵
n=82;fei=[];
for i=round(linspace(3,size(x,1),n))
    for j=round(linspace(3,size(x,2),n))
        if x(i,j,1)<20
            fei=[fei;[i,j]]  ;
        end
    end
end

%读第二张字体点阵
y=imread('fei2.png');%64*64点阵
jing=[];
for i=round(linspace(3,size(y,1),n))
    for j=round(linspace(3,size(y,2),n))
        if y(i,j,1)<20
            jing=[jing;[i,j]]  ;
        end
    end
end

%%
%黏合生成起点
first_point=[fei;[jing(:,1),1500+jing(:,2)]];
first_point=[first_point(:,2),-first_point(:,1)]



%%
%生成终点
m=size(first_point,1)

t=linspace(0,2*pi,m)
x=16*(sin(t)).^3;
y=13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);
last_point=[x'*17.5+900,y'*17.5-250];


%%
%展示数据
%plot(first_point(:,1),first_point(:,2),'o')
%figure
%plot(last_point(:,1),last_point(:,2),'o')


%%
figure
plot(last_point(:,1),last_point(:,2),'o')
step_length=50;%步长
set(gca,'XLim',[0,2500],'YLim',[-600,0])
set(gcf,'position',[300,370,1250,350]);
for i=0:1:step_length
    data=i/step_length.*(last_point-first_point)+first_point;
    plot(data(:,1),data(:,2),'o')
    set(gca,'XLim',[0,2500],'YLim',[-600,0])
    pause(0.1)
    
end
