
function pdata=moving_average(data,window)
 
%该函数实现对数据的移动窗口平均平滑
%data为输入的原始数据，window为窗口大小，pdata为输出数据
%Author：等等登登-ande
%Email：18356768364@163.com
 
[m,n] = size(data);	
pdata = zeros(m,n);	
%参数初始化
if nargin == 1
	window = 3;	 
elseif round(window/2) == window/2
	error('光谱窗口宽度必须是奇数')
end
%对原始数据进行补零
center = floor(window/2);
extdata = [zeros(m,center) data zeros(m,center)];
%对补零后的数据进行拟合
for k = 1:m
	start = polyfit(center+1:center+4,extdata(k,center+1:center+4),2);	
    extdata(k,1:center) = polyval(start,1:center);
	bend = polyfit(n-3+center:n+center,extdata(k,n-3+center:n+center),2);
	extdata(k,n+center+1:n+window-1) = polyval(bend,n+center+1:n+window-1);
end
%求平滑后的数据
for i = 1+center:n+center
	pdata(:,i-center) = mean(extdata(:,i-center:i+center)')';	
end

