% m2 = 1.78;
% P0 = 5e5;
% sim('Taijia_Model');
% a = jiaosudu.signals.values(1,1,:)
% a = reshape(a,59,1)
%YResult �������

%############start#################
global m2
global P0

%ѡ����Ӧ�Ⱥ���
adaptFunc = @AdaptFunc;

%PSO������Ⱥ���������֣�������ά�ȸ��������֣������Ӹ�ά�����䣨���󣩣���Ӧ�Ⱥ������������������֣���
[XResult, YResult] = pso(20, 2, [1,3;3e5,7e5], adaptFunc, 5);
