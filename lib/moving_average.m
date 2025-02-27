
function pdata=moving_average(data,window)
 
%�ú���ʵ�ֶ����ݵ��ƶ�����ƽ��ƽ��
%dataΪ�����ԭʼ���ݣ�windowΪ���ڴ�С��pdataΪ�������
%Author���ȵȵǵ�-ande
%Email��18356768364@163.com
 
[m,n] = size(data);	
pdata = zeros(m,n);	
%������ʼ��
if nargin == 1
	window = 3;	 
elseif round(window/2) == window/2
	error('���״��ڿ�ȱ���������')
end
%��ԭʼ���ݽ��в���
center = floor(window/2);
extdata = [zeros(m,center) data zeros(m,center)];
%�Բ��������ݽ������
for k = 1:m
	start = polyfit(center+1:center+4,extdata(k,center+1:center+4),2);	
    extdata(k,1:center) = polyval(start,1:center);
	bend = polyfit(n-3+center:n+center,extdata(k,n-3+center:n+center),2);
	extdata(k,n+center+1:n+window-1) = polyval(bend,n+center+1:n+window-1);
end
%��ƽ���������
for i = 1+center:n+center
	pdata(:,i-center) = mean(extdata(:,i-center:i+center)')';	
end

