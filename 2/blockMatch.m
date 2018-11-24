% �Ƿֺڰ׻��ǲ�ɫ�أ�
% ���ȼٶ��ڰף�
% ���ص���λ�ú�MSE
% ֻ��Ҫ������֮֡�����ϵ������, �������Ȳ���
%inputBlock ��Ҫһ��λ����Ϣ--SWx��SWy--��searchblock�ģ�1��1��; frame �Ǵ����֡
function [minMSE, MBx, MBy] = blockMatch(matchingBlock,SWx, SWy, windowSize, frame)
    % ��д���Ҫ���block �ޥå��󥰣� ����֡���ҵ���Ӧ��block
    % ʹ��MSE
    frame = double(frame);
    matchingBlock = double(matchingBlock);
    [b, ~] = size(matchingBlock); 
    w = windowSize;
    
    MSE = zeros((w - b+1), (w - b+1));

%     [matchingBlock, matchingWindow] = blockSWsize(b, w);
    % �Ȱ�searchingWindow������� 
    searchingWindow = frame(SWx : (SWx + windowSize - 1), SWy : (SWy + windowSize - 1));
    % �ٰ�block ��searchingWindow�������
    for i = 1 : (w - b+1)
        for j = 1 : (w - b+1)
            tempMatchingBlock = searchingWindow(i : i+b-1, j : j+b-1);
            tempMSE = (tempMatchingBlock - matchingBlock) .^ 2;
            MSE(i, j) = sum(sum(tempMSE));
        end
    end
    minMSE = min(min(MSE));
     [MBx, MBy]=find(MSE==min(min(MSE)));
end
            