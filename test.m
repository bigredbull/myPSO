




target = load('adapt_data.mat');
target = target.a;
a = target;

S = zeros(59,1);

for i = 1:59
    if a(i) * target(i) <= 0
        S(i) = 0;
    else
        S(i) = 1 - abs(a(i) - target(i))/max(abs(a(i)), abs(target(i)));
    end
end
disp(S);
abs_a = abs(a);
ebusen = abs_a ./sum(abs_a,2);

y_val = ebusen .* S;
disp(y_val);
y = sum(y_val);
if isnan(y)
    error('适应度计算出现NaN')
end 
disp(y);

