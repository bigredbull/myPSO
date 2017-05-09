function [XResult, YResult]=pso(SwarmSize, ParameterSize, ParameterScope, adaptFunc, LoopCount)


if nargin < 5
    error('������������')
end
 

[row,colum] = size(ParameterSize);
if row>1 || colum>1
    error('��������ӵ�ά������');
end


[row,colum] = size(ParameterScope);
disp(row)
disp(colum)
if row ~= ParameterSize || colum ~= 2
    error('���ӷ�Χ����')
end
    
    
%ParSwarm ������Ⱥ��λ�ã��ٶȣ���Ӧ�Ⱦ��󣬺���Ϊ����x������1-sizeΪλ�ã�size-2sizeΪ�ٶȣ�2size+1Ϊ��Ӧ��
%OptSwarm
[ParSwarm,OptSwarm] = Init(SwarmSize,ParameterSize,ParameterScope,adaptFunc);

for k = 1:LoopCount
    disp('��������');
    disp(k);
    [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParameterScope,adaptFunc,LoopCount,k);
end

XResult = OptSwarm(ParameterSize,:);
YResult = adaptFunc(XResult);