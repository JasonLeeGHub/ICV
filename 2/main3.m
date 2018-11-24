%% video in 
[frames, frameCount, videoHeight, videoWidth] = video2frames('NewDatasetC.avi');
%SWsz - MBsz������ż��
MBsz = 16;
SWsz = 20;
detectFtrame = 47;
center = (SWsz - MBsz) / 2;

%% �������
singleFrame1 = frames(detectFtrame).cdata;
singleFrame2 = frames(detectFtrame + 1).cdata;
singleFrameGrey1 = c2g(videoHeight, videoWidth, frames(detectFtrame).cdata); 
singleFrameGreyC = c2g(videoHeight, videoWidth, frames(detectFtrame + 1).cdata);

%�������궼���ɾ��������ٽ��д洢
%����Matchingblock, ��ͼƬ�ֳ�����С��
matchingBlock = frameCut(videoHeight, videoWidth, MBsz, singleFrameGrey1); 

%% searching blockmatch
singleFrameGrey2 = zeros(videoHeight + 2 * SWsz ,videoWidth + 2 * SWsz);
singleFrameGrey2(SWsz + 1 : videoHeight + SWsz , SWsz + 1: videoWidth + SWsz) = singleFrameGreyC;

a = 1; b = 1;
SWx = SWsz - (SWsz - MBsz) / 2;
SWy = SWsz - (SWsz - MBsz) / 2;

for i = 1 : MBsz :  videoHeight
    SWx =  i - (SWsz - MBsz) / 2 + SWsz;
    a = (i-1)/MBsz + 1;
    
    for j = 1 : MBsz : videoWidth
        SWy = j - (SWsz - MBsz) / 2 + SWsz;
        b = (j-1)/MBsz + 1;        
    
        [minMSE,MBx,MBy] = blockMatch(matchingBlock(a,b).data, SWx, SWy, SWsz, singleFrameGrey2);
        matchingBlock(a, b).mbXY = [MBx, MBy];
        
%         %������껹ԭ �������+��������ԭ��
%         realX = SWsz + 1+MBsz*(a-1)+(MBx-center);
%         realY = SWsz + 1+MBsz*(b-1)+(MBy-center);       
%         matchingBlock(a, b).realMBXY = [realX, realY]; %����Ǿ�������
%         matchingBlock(a, b).MSE = minMSE;

    end
end

%% �Լ���vector
figure(1);
drawVector(videoHeight, videoWidth, MBsz, SWsz, matchingBlock, singleFrame1);
figure(2);
subplot(1,2,1);
imshow(singleFrame2);

%% Ԥ�⶯̬����ͼƬ
reconstructFrame = reconstruct(videoHeight, videoWidth, MBsz, matchingBlock);
subplot(1,2,2);
imshow(uint8(reconstructFrame));


