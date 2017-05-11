function [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParameterScope,adaptFunc,LoopCount,CurCount)

%ParSwarm 粒子群位置，速度，适应度
%粒子  位置  速度  适应度
% 1     1,2  3,4    5
% 2     1,3  4,5    6

%OptSwarm 粒子群个体和群体最优值
%粒子  位置
%1    1,2
%2    5,3
%n+1  2,3

%w
MaxW = 1;
MinW = 0.5;
%w=MaxW-CurCount*((MaxW-MinW)/LoopCount);

%*************************************************
%w = 0.7;                                          %惯性权重
w = MaxW - CurCount*((MaxW - MinW) / LoopCount);  %线性递减策略
c1 = 2;                                           %粒子自身权重
c2 = 2;                                           %粒子群体权重
a  = 1;                                           %约束因子
%**************************************************
sudu = 0.1 .* ParameterScope(:,2);

[ParRow,ParCol]=size(ParSwarm);
ParCol=(ParCol-1)/2;

SubTract1 = OptSwarm(1:ParRow, 1:ParCol) - ParSwarm(:,1:ParCol);

for row=1:ParRow
    SubTract2 = OptSwarm(ParRow+1,1:ParCol) - ParSwarm(row,1:ParCol);
    TempV=w.*ParSwarm(row,ParCol+1:2*ParCol) + c1 * unifrnd(0,1).*SubTract1(row,:) + c2 * unifrnd(0,1).*SubTract2;

    
    %限速
    for h=1:ParCol
        if TempV(:,h) > sudu(h)
            TempV(:,h) =  sudu(h);
        end
        if TempV(:,h) < -sudu(h)
            TempV(:,h) = -sudu(h);
        end
    end
 %   disp(TempV);
    
    ParSwarm(row,ParCol+1:2*ParCol)=TempV;
    TempPos=ParSwarm(row,1:ParCol) +   TempV;
    
    for h=1:ParCol
        if TempPos(:,h)>ParameterScope(h,2)
            TempPos(:,h)=ParameterScope(h,2);
        end
        if TempPos(:,h)<ParameterScope(h,1)
            TempPos(:,h)=ParameterScope(h,1); 
        end
    end

    ParSwarm(row,1:ParCol)=TempPos;
  
 %计算每个粒子的新的适应度值
    ParSwarm(row,2*ParCol+1)=adaptFunc(ParSwarm(row,1:ParCol));
    if ParSwarm(row,2*ParCol+1) > OptSwarm(ParRow + 1,ParCol+1)
        OptSwarm(ParRow + 1,1:ParCol) = ParSwarm(row,1:ParCol);
        OptSwarm(ParRow + 1,ParCol+1) = ParSwarm(row,2*ParCol+1);
    end
end
%disp(ParSwarm);
%disp(OptSwarm);
























