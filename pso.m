function [XResult, YResult]=pso(SwarmSize, ParticleSize, ParticleScope, AdaptFunc, LoopCount)


if nargin < 5
    error('参数数量错误')
end
 

[row,colum] = size(ParticleSize);
if row>1 || colum>1
    error('输入的粒子的维数错误');
end


[row,colum] = size(ParticleScope);
if row ~= ParticleSize && colum ~= 2
    error('粒子范围错误')
end
    
    
%画图
%DrawObjGraphic(ParticleSize,ParticleScope,AdaptFunc);

[ParSwarm,OptSwarm] = Init(SwarmSize,ParticleSize,ParticleScope,AdaptFunc);

for k = 1:LoopCount
    disp('第%g次迭代',k);
    [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParticleScope,AdaptFunc,LoopCount,k);
end

XResult = OptSwarm(ParticleSize,:);
YResult = AdaptFunc(XResult);