function [XResult, YResult]=pso(SwarmSize, ParticleSize, ParticleScope, adaptFunc, LoopCount)


if nargin < 5
    error('������������')
end
 

[row,colum] = size(ParticleSize);
if row>1 || colum>1
    error('��������ӵ�ά������');
end


[row,colum] = size(ParticleScope);
disp(row)
disp(colum)
if row ~= ParticleSize || colum ~= 2
    error('���ӷ�Χ����')
end
    
    
%��ͼ
%DrawObjGraphic(ParticleSize,ParticleScope,AdaptFunc);

[ParSwarm,OptSwarm] = Init(SwarmSize,ParticleSize,ParticleScope,adaptFunc);

for k = 1:LoopCount
    disp('��������');
    disp(k);
    [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParticleScope,adaptFunc,LoopCount,k);
end

XResult = OptSwarm(ParticleSize,:);
YResult = adaptFunc(XResult);