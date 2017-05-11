function [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParameterScope,adaptFunc,LoopCount,CurCount)

%ParSwarm ����Ⱥλ�ã��ٶȣ���Ӧ��
%����  λ��  �ٶ�  ��Ӧ��
% 1     1,2  3,4    5
% 2     1,3  4,5    6

%OptSwarm ����Ⱥ�����Ⱥ������ֵ
%����  λ��
%1    1,2
%2    5,3
%n+1  2,3

%w
MaxW = 1;
MinW = 0.5;
%w=MaxW-CurCount*((MaxW-MinW)/LoopCount);

%*************************************************
%w = 0.7;                                          %����Ȩ��
w = MaxW - CurCount*((MaxW - MinW) / LoopCount);  %���Եݼ�����
c1 = 2;                                           %��������Ȩ��
c2 = 2;                                           %����Ⱥ��Ȩ��
a  = 1;                                           %Լ������
%**************************************************
sudu = 0.1 .* ParameterScope(:,2);

[ParRow,ParCol]=size(ParSwarm);
ParCol=(ParCol-1)/2;

SubTract1 = OptSwarm(1:ParRow, 1:ParCol) - ParSwarm(:,1:ParCol);

for row=1:ParRow
    SubTract2 = OptSwarm(ParRow+1,1:ParCol) - ParSwarm(row,1:ParCol);
    TempV=w.*ParSwarm(row,ParCol+1:2*ParCol) + c1 * unifrnd(0,1).*SubTract1(row,:) + c2 * unifrnd(0,1).*SubTract2;

    
    %����
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
  
 %����ÿ�����ӵ��µ���Ӧ��ֵ
    ParSwarm(row,2*ParCol+1)=adaptFunc(ParSwarm(row,1:ParCol));
    if ParSwarm(row,2*ParCol+1) > OptSwarm(ParRow + 1,ParCol+1)
        OptSwarm(ParRow + 1,1:ParCol) = ParSwarm(row,1:ParCol);
        OptSwarm(ParRow + 1,ParCol+1) = ParSwarm(row,2*ParCol+1);
    end
end
%disp(ParSwarm);
%disp(OptSwarm);
























