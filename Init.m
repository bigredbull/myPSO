function [ParSwarm, OptSwarm] = Init(SwarmSize, ParameterSize, ParameterScope, adaptFunc)
%
ParSwarm = rand(SwarmSize, 2 * ParameterSize + 1);

%λ��,����ÿ��ά��
for k=1:ParameterSize
    ParSwarm(:,k)=ParSwarm(:,k)*(ParameterScope(k,2)-ParameterScope(k,1))+ParameterScope(k,1);
%�ٶ�
    ParSwarm(:,ParameterSize+k)=ParSwarm(:,ParameterSize+k)*(ParameterScope(k,2)-ParameterScope(k,1))+ParameterScope(k,1);
end
%��Ӧ�ȣ�����ÿ������
for k=1:SwarmSize
    ParSwarm(k,2*ParameterSize+1)=adaptFunc(ParSwarm(k,1:ParameterSize));
end
disp('init wancheng')
OptSwarm = zeros(SwarmSize + 1, ParameterSize);
[~,row]=max(ParSwarm(:,2*ParameterSize+1));
OptSwarm(1:SwarmSize,:) = ParSwarm(1:SwarmSize,1:ParameterSize);
OptSwarm(SwarmSize+1,:)=ParSwarm(row,1:ParameterSize);
disp('init opt wancheng')