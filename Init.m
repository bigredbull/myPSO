function [ParSwarm, OptSwarm] = Init(SwarmSize, ParticleSize, ParticleScope, AdaptFunc)

ParSwarm = rand(SwarmSize, 2 * ParticleSize + 1);

%λ��,����ÿ��ά��
for k=1:ParticleSize
    ParSwarm(:,k)=ParSwarm(:,k)*(ParticleScope(k,2)-ParticleScope(k,1))+ParticleScope(k,1);
%�ٶ�
    ParSwarm(:,ParticleSize+k)=ParSwarm(:,ParticleSize+k)*(ParticleScope(k,2)-ParticleScope(k,1))+ParticleScope(k,1);
end
%��Ӧ�ȣ�����ÿ������
for k=1:SwarmSize
    ParSwarm(k,2*ParticleSize+1)=AdaptFunc(ParSwarm(k,1:ParticleSize));
end

OptSwarm = zeros(SwarmSize + 1, ParticleSize);
[~,row]=max(ParSwarm(:,2*ParticleSize+1));
OptSwarm(1:SwarmSize,:) = ParSwarm(1:SwarmSize,1:ParticleSize);
OptSwarm(SwarmSize+1,:)=ParSwarm(row,1:ParticleSize);
