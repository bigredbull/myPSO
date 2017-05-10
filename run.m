% m2 = 1.78;
% P0 = 5e5;
% sim('Taijia_Model');
% a = jiaosudu.signals.values(1,1,:)
% a = reshape(a,59,1)
%YResult 输出不对

%############start#################
global m2;
global P0;

%选择适应度函数
adaptFunc = @AdaptFunc;

%PSO（粒子群数量（数字），粒子维度个数（数字），粒子各维度区间（矩阵），适应度函数，迭代次数（数字））
[XResult, YResult] = pso(10, 2, [1,3;3,7], adaptFunc, 2);
