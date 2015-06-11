%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 用于将replay文件处理成曲线图
% 输入replay文件路径和玩家自己的ID(可选),运行本脚本即可
% 如果想单独分析某个文件，可以使用函数plotreplay(filename,id);
% 使用方法：
% 在命令窗口输入plotreplay(filename,id)
%          或者plotreplay(filename)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;clear;clc;
%% 进入工作目录
path = 'C:\\Octave-3.6.4\\test\\octave\\replay\\';
%% 自己的id
myID = 3086;

%% 获取所有文件
Files = dir(path);
LengthFiles = length(Files);
for i = 1:LengthFiles;
    filename = Files(i).name;
    if(length(filename)>3 && strcmp(filename(length(filename)-3:length(filename)),'.txt') == 1)
        plotreplay([path '\\' filename],myID);
    end
end
