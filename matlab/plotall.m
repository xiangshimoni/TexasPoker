%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���ڽ�replay�ļ����������ͼ
% ����replay�ļ�·��������Լ���ID(��ѡ),���б��ű�����
% ����뵥������ĳ���ļ�������ʹ�ú���plotreplay(filename,id);
% ʹ�÷�����
% �����������plotreplay(filename,id)
%          ����plotreplay(filename)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;clear;clc;
%% ���빤��Ŀ¼
path = uigetdir('ѡ��replayĿ¼') ;
%path = 'M:\Personal\Work\��Ϊ�����Ӣ��ս��\matlab����\replay\';
%% �Լ���id
myID = 74;
%% ��ȡ�����ļ�
Files = dir(path);
LengthFiles = length(Files);
for i = 1:LengthFiles;
    filename = Files(i).name;
    if(length(filename)>3 && strcmp(filename(length(filename)-3:length(filename)),'.txt') == 1)
        plotreplay([path '\' filename],myID);
    end
end
