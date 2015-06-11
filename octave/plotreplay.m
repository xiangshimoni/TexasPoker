function plotreplay(filename,ID)

if nargin < 2
    ID = -1;
end

pkg load java

%% ���ļ�
fid = fopen(filename,'r');
if fid>0 
    disp('replay�ļ��򿪳ɹ�')
else
    disp('replay�ļ���ʧ��');
    return
end

%% ��������
%data_ht = javaObject("java.util.Hashtable");
round_ht = javaObject("java.util.Hashtable");
id_name_ht = javaObject("java.util.Hashtable");
player_count = 0;

while ~feof(fid)
    temp=fgetl(fid); 
	if(length(temp)>5 && strcmp(temp(1:5),'score') == 1)
        %disp(temp)%��ʾ����
		data = sscanf(temp,'score of %d: %d %d %d 0'); 
        id = data(1);
        round = data(2);
        jetton = data(3);
        money = data(4);
        if(round_ht.containsKey(id))
            %����ͬһ�ֵ�����
            if(round - round_ht.get(id) == 0)
                eval(["player_" num2str(id) " = [player_" num2str(id) ";" num2str(jetton+money) "];"]);
            end
        else
            eval(["player_" num2str(id) " = [player_" num2str(id) ";" num2str(jetton+money) "];"]);
        end
        round_ht.put(id,round);
    elseif(length(temp)>11 && strcmp(temp(1:11),'reg: player') == 1)
		%ע����Ϣ
        idname = sscanf(temp,'reg: player id=%d name=%s money'); 
		id = idname(1,:);
		name = char(idname(2:end)');
        id_name_ht.put(id,name); 
		%ѡ�ָ���
		player_count++;
		%��ʼ������
		eval(["player_" num2str(id) " = [];"]);
	end
end
fclose(fid);

%% ��ͼ
figure;
cnt = 0;
keys = id_name_ht.keys;
while(keys.hasNext)
    cnt = cnt+1;
    key = keys.nextElement;
	if(key == ID)
		eval(["plot(player_" num2str(key) ",'-ro')"])
	else
		eval(["plot(player_" num2str(key) ",'color',[rand rand rand])"])
	end
	legends{cnt} = [num2str(key) '/' id_name_ht.get(key)];
	hold on
end
legend(legends);
title(filename);
grid on;

end