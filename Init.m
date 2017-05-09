function [ParSwarm, OptSwarm] = Init(SwarmSize, ParameterSize, ParameterScope, adaptFunc)
%
ParSwarm = rand(SwarmSize, 2 * ParameterSize + 1);

%位置,对于每个维度
for k=1:ParameterSize
    ParSwarm(:,k)=ParSwarm(:,k)*(ParameterScope(k,2)-ParameterScope(k,1))+ParameterScope(k,1);
%速度
    ParSwarm(:,ParameterSize+k)=ParSwarm(:,ParameterSize+k)*(ParameterScope(k,2)-ParameterScope(k,1))+ParameterScope(k,1);
end
%适应度，对于每个粒子
for k=1:SwarmSize
    ParSwarm(k,2*ParameterSize+1)=adaptFunc(ParSwarm(k,1:ParameterSize));
end
disp('init wancheng')
OptSwarm = zeros(SwarmSize + 1, ParameterSize);
[~,row]=max(ParSwarm(:,2*ParameterSize+1));
OptSwarm(1:SwarmSize,:) = ParSwarm(1:SwarmSize,1:ParameterSize);
OptSwarm(SwarmSize+1,:)=ParSwarm(row,1:ParameterSize);
disp('init opt wancheng')