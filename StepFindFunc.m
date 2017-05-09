function [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParameterScope,adaptFunc,LoopCount,CurCount)


%w
%MaxW = 
%MinW = 
%w=MaxW-CurCount*((MaxW-MinW)/LoopCount);

%*************************************************
w = 0.7;                                          %惯性权重
%w = MaxW - CurCount*((MaxW - MinW) / LoopCount);  %线性递减策略
c1 = 2;                                           %粒子自身权重
c2 = 2;                                           %粒子群体权重
a  = 1;                                           %约束因子
%**************************************************


[ParRow,ParCol]=size(ParSwarm);

ParCol=(ParCol-1)/2;
SubTract1 = OptSwarm(1:ParRow, :) - ParSwarm(:,1:ParCol);

for row=1:ParRow
    SubTract2 = OptSwarm(ParRow+1,:) - ParSwarm(row,1:ParCol);
    TempV=w.*ParSwarm(row,ParCol+1:2*ParCol) + c1 * unifrnd(0,1).*SubTract1(row,:) + c2 * unifrnd(0,1).*SubTract2;

    %限速
    for h=1:ParCol
        if TempV(h)>ParameterScope(h,2)
            TempV(h)=ParameterScope(h,2);
        end
        if TempV(:,h)<-ParameterScope(h,2)
            TempV(:,h)=-ParameterScope(h,2)+1e-10;
        end
    end
    
    ParSwarm(row,ParCol+1:2*ParCol)=TempV;
    TempPos=ParSwarm(row,1:ParCol)+a*TempV;
    
    for h=1:ParCol
        if TempPos(:,h)>ParameterScope(h,2)
            TempPos(:,h)=ParameterScope(h,2);
        end
        if TempPos(:,h)<=ParameterScope(h,1)
            TempPos(:,h)=ParameterScope(h,1)+1e-10; 
        end
    end

    ParSwarm(row,1:ParCol)=TempPos;
  
 %计算每个粒子的新的适应度值
    ParSwarm(row,2*ParCol+1)=adaptFunc(ParSwarm(row,1:ParCol));
    if ParSwarm(row,2*ParCol+1) > adaptFunc(OptSwarm(row,1:ParCol))
        OptSwarm(row,1:ParCol) = ParSwarm(row,1:ParCol);
    end
end

























