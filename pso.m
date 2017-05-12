function [XResult, YResult]=pso(SwarmSize, ParameterSize, ParameterScope, adaptFunc, LoopCount)


if nargin < 5
    error('������������')
end
 

[row,colum] = size(ParameterSize);
if row>1 || colum>1
    error('��������ӵ�ά������');
end


[row,colum] = size(ParameterScope);

if row ~= ParameterSize || colum ~= 2
    error('���ӷ�Χ����')
end
    
y_plot = zeros(LoopCount+1);
%ParSwarm ������Ⱥ��λ�ã��ٶȣ���Ӧ�Ⱦ��󣬺���Ϊ����x������1-sizeΪλ�ã�size-2sizeΪ�ٶȣ�2size+1Ϊ��Ӧ��
%OptSwarm
disp('start')

[ParSwarm,OptSwarm] = Init(SwarmSize,ParameterSize,ParameterScope,adaptFunc);
y_plot(1) = OptSwarm(SwarmSize + 1, 2);
if LoopCount ~= 0
    
    for k = 1:LoopCount
        disp('��������');
        disp(k);
        [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParameterScope,adaptFunc,LoopCount,k);
        y_plot(k+1) =  OptSwarm(SwarmSize + 1, 2);
    end
end
XResult = OptSwarm(SwarmSize + 1, 1:ParameterSize);
YResult = OptSwarm(SwarmSize + 1, ParameterSize + 1);
plot(y_plot);
axis([1 LoopCount+1 3 7]);