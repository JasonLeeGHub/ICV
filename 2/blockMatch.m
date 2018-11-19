% 是分黑白还是彩色呢？
% （先假定黑白）
% 返回的是位置和MSE
% 只需要计算两帧之间的联系就行了, 其他的先不管
%inputBlock 需要一个位置信息--locX和locY--是searchblock的（1，1）; frame 是待检测帧
function [outputVal, vecX, vecY] = blockMatch(inputBlock,locX, locY, windowSize, frame)
    % 先写这个要求的block マッチング， 先在帧中找到相应的block
    % 使用MSE
    [b, ~] = size(inputBlock); 
    w = windowSize;
    MSE = zeros((w - b+1), (w - b+1));

%     [matchingBlock, matchingWindow] = blockSWsize(b, w);
    % 先把matchingWindow给抽出来 
    matchingWindow = double(frame(locX : (locX + windowSize - 1), locY : (locY + windowSize - 1)));
    % 再把block 从searchingWindow给抽出来
    for i = 1 : (w - b+1)
        for j = 1 : (w - b+1)
            matchingBlock = matchingWindow(i : i+b-1, j : j+b-1);
            temp = (matchingBlock - inputBlock) .^ 2;
            MSE(i, j) = sum(sum(temp));
        end
    end
    outputVal = min(min(MSE));
     [vecX, vecY]=find(MSE==min(min(MSE)));
end
            