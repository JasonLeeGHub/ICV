%���������������ͼƬ�ϻ�SearchWindow��MatchingBlock
%˼·��1����Ҫ����MatchingBlock�������SW��λ����SearchWindow�������Frame��λ����ͼƬ��Ϣ
%           2������� ͼƬ�����SW��MB����ͬ��ɫ��
%           3*�����Լ��л�MotionVector��
% videoHeight, videoWidth,
function adFrame = windowPaint(MBx, MBy, MBsz, SWx, SWy, SWsz, frame)
    % �ȶ���ͼ��
     adFrame = frame;
    % ��ɫ�� ��SW, Ч����һ�ڿ�
    for i = SWx : SWx + SWsz - 1 
        for j = SWy : SWy + SWsz -1
            if (i == SWx) || (i == (SWx + SWsz - 1)) ||...
                    (j == SWy) || (j == (SWy + SWsz -1))
                adFrame(i, j) = 0;
            end
        end
    end
    %��MW��Ч��Ϊһ�׿�
    for i = SWx + MBx - 1 : SWx + MBx + MBsz  - 1 - 1
        for j = SWy + MBy - 1 : SWy + MBy + MBsz  - 1 - 1
            if (i == (SWx + MBx - 1)) || (i == (SWx + MBx+ MBsz  - 1 - 1)) ||...
                    (j == (SWy + MBy - 1)) || (j == (SWy + MBy + MBsz  - 1 - 1))
                adFrame(i, j) = 255;
            end
        end
    end
    
    
end