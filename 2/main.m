%% video in 
[frames, frameCount, videoHeight, videoWidth] = video2frames('DatasetB.avi');
%% Block match
frame = rgb2gray(frames(1).cdata); 
%����inputblock������
inputBlock = ones(16,16);
%�ҳ�����ƥ���λ�ã�vecXYָmatchingBlock����1��1λ���Լ�����
[Val,vecX,vecY] = blockMatch(inputBlock, 1, 1, 20, frame);
