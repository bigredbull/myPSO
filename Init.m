function [ParSwarm, OptSwarm] = Init(SwarmSize, ParameterSize, ParameterScope, adaptFunc)

ParSwarm = rand(SwarmSize, 2 * ParameterSize + 1);
%ParSwarm ����Ⱥλ�ã��ٶȣ���Ӧ��
%����  λ��  �ٶ�  ��Ӧ��
% 1     1,2  3,4    5
% 2     1,3  4,5    6

%OptSwarm ����Ⱥ�����Ⱥ������ֵ
%����  λ��
%1    1,2
%2    5,3
%n+1  2,3
sudu = 0.1 .* ParameterScope(:,2);
%λ��,����ÿ��ά��
for k=1:ParameterSize
    ParSwarm(:,k)=ParSwarm(:,k)*(ParameterScope(k,2)-ParameterScope(k,1))+ParameterScope(k,1);
%�ٶ�
    %ParSwarm(:,ParameterSize+k)=ParSwarm(:,ParameterSize+k)*(ParameterScope(k,2)-ParameterScope(k,1))+ParameterScope(k,1);
    ParSwarm(:,ParameterSize+k)=ParSwarm(:,ParameterSize+k)*sudu(k);
    for i = 1: SwarmSize
        for j = 1: ParameterSize
            if ParSwarm(i,ParameterSize + j) > sudu(j)
                ParSwarm(i,ParameterSize + j) = sudu(j);
            end
        end
    end
end
%��Ӧ�ȣ�����ÿ������
for k=1:SwarmSize
    ParSwarm(k,2*ParameterSize+1)=adaptFunc(ParSwarm(k,1:ParameterSize));
end

OptSwarm = zeros(SwarmSize + 1, ParameterSize + 1);
[~,row]=min(ParSwarm(:,2*ParameterSize+1));
OptSwarm(1:SwarmSize,1:ParameterSize ) = ParSwarm(:,1:ParameterSize );
OptSwarm(1:SwarmSize,ParameterSize + 1) = ParSwarm(:,2 * ParameterSize + 1);
OptSwarm(SwarmSize+1,1:ParameterSize)=ParSwarm(row,1:ParameterSize);
OptSwarm(SwarmSize+1,ParameterSize + 1)=ParSwarm(row,2 * ParameterSize + 1);
disp(ParSwarm)
disp(OptSwarm)
disp('init done')










