function plotreplay(filename,ID)
if nargin < 2
    ID = -1;
end

%% ���ļ�
fid = fopen(filename,'r');
if fid>0 
    disp('replay�ļ��򿪳ɹ�')
else
    disp('replay�ļ���ʧ��');
    return
end

%% ��������
data_ht = java.util.Hashtable;
round_ht = java.util.Hashtable;
id_name_ht = java.util.Hashtable;
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
            %��һ�ֽ�������һ�ֿ�ʼ���+����һ��
            if(round - round_ht.get(id) == 0)
                if ~data_ht.containsKey(id)
                    data_ht.put(id, jetton+money);
                else
                    data_ht.put(id, [data_ht.get(id);jetton+money]);
                end
            end
        else
            if ~data_ht.containsKey(id)
                data_ht.put(id, jetton+money);
            else
                data_ht.put(id, [data_ht.get(id);jetton+money]);
            end
        end
        round_ht.put(id,round);
    elseif(length(temp)>11 && strcmp(temp(1:11),'reg: player') == 1)
        idname = sscanf(temp,'reg: player id=%d name=%s money'); 
        id_name_ht.put(idname(1),char(idname(2:end)'));  
	end
end
fclose(fid);

%% ��ͼ
data_ht_keys = data_ht.keys;
figure;
cnt = 0;
while(data_ht_keys.hasNext)
    cnt = cnt+1;
    key = data_ht_keys.nextElement;
    if(key == ID)
        plot(data_ht.get(key),'-ro');
    else
        plot(data_ht.get(key),'color',[rand rand rand]);
    end
    %legend(['���id��' num2str(key)]);
    legends{cnt} = [num2str(key) '/' id_name_ht.get(key)];
    hold on
end
legend(legends);
title(filename);
grid on;

end