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
    
y_plot = zeros(LoopCount+1);
x1_plot = zeros(LoopCount+1);
x2_plot = zeros(LoopCount+1);
%ParSwarm 是粒子群的位置，速度，适应度矩阵，横轴为粒子x，纵轴1-size为位置，size-2size为速度，2size+1为适应度
%OptSwarm
disp('start')

[ParSwarm,OptSwarm] = Init(SwarmSize,ParameterSize,ParameterScope,adaptFunc);
x1_plot(1) = OptSwarm(SwarmSize + 1, 1);
x2_plot(1) = OptSwarm(SwarmSize + 1, 2);
y_plot(1) = OptSwarm(SwarmSize + 1,3);
if LoopCount ~= 0
    
    for k = 1:LoopCount
        disp('迭代次数');
        disp(k);
        [ParSwarm,OptSwarm] = StepFindFunc(ParSwarm,OptSwarm,ParameterScope,adaptFunc,LoopCount,k);
        x1_plot(k+1) = OptSwarm(SwarmSize + 1, 1);
        x2_plot(k+1) = OptSwarm(SwarmSize + 1, 2);
        y_plot(k+1) = OptSwarm(SwarmSize + 1,3);
    end
end
XResult = OptSwarm(SwarmSize + 1, 1:ParameterSize);
YResult = OptSwarm(SwarmSize + 1, ParameterSize + 1);
figure(1);
plot(x1_plot);
axis([1 LoopCount+1 1 3]);
figure(2);
plot(x2_plot);
axis([1 LoopCount+1 3 7]);
figure(3);
plot(y_plot);
axis([1 LoopCount+1 0.97 1]);