% m2 = 1.78;
% P0 = 5e5;
% sim('Taijia_Model');
% a = jiaosudu.signals.values(1,1,:)
% a = reshape(a,59,1)
%YResult �������

%############start#################
global m2;
global P0;

%ѡ����Ӧ�Ⱥ���
adaptFunc = @AdaptFunc;

%PSO������Ⱥ���������֣�������ά�ȸ��������֣������Ӹ�ά�����䣨���󣩣���Ӧ�Ⱥ������������������֣���
[XResult, YResult] = pso(10, 2, [1,3;3,7], adaptFunc, 2);
