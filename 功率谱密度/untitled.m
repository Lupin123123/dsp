clc
clear      
pr=[0.25 0.75];        %各字符出现的概率
temp=[0.0 0.25 1.0];
orignal = temp;
in = 'babba';
n=length(in);
%编码
for i=1:n
    width=temp(3)-temp(1);
    w=temp(1);
    switch in(i)
        case 'a'
            m=1;
        case 'b'
            m=2;
        otherwise
            error('do not input other character');
    end
    temp(1) = w + orignal(m)*width;
    temp(3) = w + orignal(m+1)*width;
    left = temp(1);
    right = temp(3);
    fprintf('left=%.6f',left);
    fprintf('    ');
    fprintf('right=%.6f\n',right);
end
encode=(temp(1)+temp(3))/2

% %解码
% decode=['0'];
% for i=1:n
%     fprintf('tmp=%.6f\n',encode);
%     if(encode>=orignal(1)& encode<orignal(2))
%         decode(i)='a';
%         t=1;
%     elseif(encode>=orignal(2)& encode<orignal(3))
%         decode(i)='b';
%         t=2;
%     else
%         decode(i)='c';
%         t=3;
%     end
%     encode=(encode-orignal(t));
%     encode=encode/pr(t);
% end
% decode