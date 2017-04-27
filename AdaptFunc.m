function y = AdaptFunc(m1_input,P0_input)
m1 = m1_input;
P0 = P0_input;
sim('Taijia_Model');
a = jiaosudu.signals.values(1,1,:);
target = 
S = zero(1,150);
for i = 1:150
    if a(i) == target(i)
        S(i) = 1;
    else
        S(i) = 1 - abs(a(i) - target(i))/max(abs(a(i)), abs(target(i)));
    end
end

ebusen = a ./sum(a,2);
y = sum(ebusen .* S,2);






