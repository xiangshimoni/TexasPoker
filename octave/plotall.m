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
path = 'C:\\Octave-3.6.4\\test\\octave\\replay\\';
%% �Լ���id
myID = 3086;

%% ��ȡ�����ļ�
Files = dir(path);
LengthFiles = length(Files);
for i = 1:LengthFiles;
    filename = Files(i).name;
    if(length(filename)>3 && strcmp(filename(length(filename)-3:length(filename)),'.txt') == 1)
        plotreplay([path '\\' filename],myID);
    end
end
