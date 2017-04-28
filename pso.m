function [XResult, YResult]=pso(SwarmSize, ParticleSize, ParticleScope, adaptFunc, LoopCount)


if nargin < 5
    error('参数数量错误')
end
 

[row,colum] = size(ParticleSize);
if row>1 || colum>1
    error('输入的粒子的维数错误');
end


[row,colum] = size(ParticleScope);
disp(row)
disp(colum)
if row ~= ParticleSize || colum ~= 2
    error('粒子范围错误')
end
    
    
%画图
%DrawObjGraphic(ParticleSize,ParticleScope,AdaptFunc);

[ParSwarm,OptSwarm] = Init(SwarmSize,ParticleSize,ParticleScope,adaptFunc);

for k = 1:LoopCount
    disp('迭代次数');
    disp(k);
    [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParticleScope,adaptFunc,LoopCount,k);
end

XResult = OptSwarm(ParticleSize,:);
YResult = adaptFunc(XResult);