function frameDiff =  binaryDiff(videoHeight, videoWidth, frameCount, frameDiff, threshold) 
    %1. ����frameDiff�ѹؼ�����
    %2. �ӱ��֡���ҳ�δ��ǵ㸴��
    %����ʼ����all zero
    %��ȡDiff��ĵڶ�֡����һ֡�Ĳ����ȫ������0    
    for k = 2 : frameCount
        for i = 1 : videoHeight
            for j = 1 : videoWidth

                if frameDiff(k).data(i, j) < 0 || frameDiff(2).data(i, j) <= threshold  
                    frameDiff(k).binData(i, j) = 0;
                end
                if frameDiff(k).data(i, j) > threshold
                    frameDiff(k).binData(i, j) = 255;
                end     

            end
        end
    end
    
end