function reconstructFrame = reconstruct(videoHeight, videoWidth, MBsz, matchingBlock) 

reconstructFrame = zeros(videoHeight + 5 , videoWidth + 5);
  for i = 1 : MBsz :  videoHeight
    a = (i-1)/MBsz + 1;    
    for j = 1 : MBsz : videoWidth
        b = (j-1)/MBsz + 1;        
        
        for ii = 1 : MBsz
            for jj = 1 : MBsz
                mbXY = matchingBlock(a, b).mbXY;
                %mbXY�ǣ�3��3����searchWindow
                %��������Ϊ�����ļӵĻ����ײ���������reconstructFrame�޷����У�����ֱ�Ӽ��ϣ�3��3��
                reconstructFrame((ii - 1) + mbXY(1) + (i - 1),  jj - 1 + mbXY(2) + (j - 1)) ...
                = matchingBlock(a, b).data(ii, jj);
            end
        end     
        
    end
  end
  
  

end
