function [XResult, YResult]=pso(SwarmSize, ParticleSize, ParticleScope, AdaptFunc, LoopCount)


if nargin < 5
    error('������������')
end
 

[row,colum] = size(ParticleSize);
if row>1 || colum>1
    error('��������ӵ�ά������');
end


[row,colum] = size(ParticleScope);
if row ~= ParticleSize && colum ~= 2
    error('���ӷ�Χ����')
end
    
    
%��ͼ
%DrawObjGraphic(ParticleSize,ParticleScope,AdaptFunc);

[ParSwarm,OptSwarm] = Init(SwarmSize,ParticleSize,ParticleScope,AdaptFunc);

for k = 1:LoopCount
    disp('��%g�ε���',k);
    [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParticleScope,AdaptFunc,LoopCount,k);
end

XResult = OptSwarm(ParticleSize,:);
YResult = AdaptFunc(XResult);