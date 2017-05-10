function y = AdaptFunc(input)

global m2
global  P0


m2 = input(1,1);
P0 = input(1,2);

sim('Taijia_Model');
a = jiaosudu.signals.values(1,1,:);
a = reshape(a,59,1);
a = a(2:59);

target = load('adapt_data.mat');
target = target.a;
target = target(2:59);

S = zeros(58,1);

for i = 1:58
    if a(i) * target(i) <= 0
        S(i) = 0;
    else
        S(i) = 1 - abs(a(i) - target(i))/max(abs(a(i)), abs(target(i)));
    end
end

abs_a = abs(a);
ebusen = abs_a ./sum(abs_a,2);
y_val = ebusen .* S;
y = sum(y_val);
%disp(y)
if isnan(y)
    error('适应度计算出现NaN');
end








