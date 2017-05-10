function [XResult, YResult]=pso(SwarmSize, ParameterSize, ParameterScope, adaptFunc, LoopCount)


if nargin < 5
    error('参数数量错误')
end
 

[row,colum] = size(ParameterSize);
if row>1 || colum>1
    error('输入的粒子的维数错误');
end


[row,colum] = size(ParameterScope);

if row ~= ParameterSize || colum ~= 2
    error('粒子范围错误')
end
    
    
%ParSwarm 是粒子群的位置，速度，适应度矩阵，横轴为粒子x，纵轴1-size为位置，size-2size为速度，2size+1为适应度
%OptSwarm
disp('start')

[ParSwarm,OptSwarm] = Init(SwarmSize,ParameterSize,ParameterScope,adaptFunc);
if LoopCount ~= 0
    
    for k = 1:LoopCount
        disp('迭代次数');
        disp(k);
        [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParameterScope,adaptFunc,LoopCount,k);
    end
end
XResult = OptSwarm(SwarmSize + 1, 1:ParameterSize);
YResult = OptSwarm(SwarmSize + 1, ParameterSize + 1);