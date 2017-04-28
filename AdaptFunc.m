function y = AdaptFunc(input)

global  P0
global m2

m2 = input(1,1);
P0 = input(1,2);

sim('Taijia_Model');

a = jiaosudu.signals.values(1,1,:);
a = reshape(a,59,1);

target = load('adapt_data.mat');
target = target.a;

S = zeros(59,1);
for i = 1:59
    if a(i) == target(i)
        S(i) = 1;
    else
        S(i) = 1 - abs(a(i) - target(i))/max(abs(a(i)), abs(target(i)));
    end
end

ebusen = a ./sum(a,2);

y = sum(ebusen .* S);






