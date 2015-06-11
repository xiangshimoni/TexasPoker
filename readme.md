#使用说明
---
本脚本包含两个目录：  

- matlab
- octave

分别是两种版本的脚本：  
matlab使用matlab R2010b编写  
octave使用octave Octave 3.6.4编写  

目前没有在其他环境下测试过。

---
脚本均包含两个文件：

- **plotall.m**  
  输入一个包含多个replay文件的目录，可以直接在文件中修改path和myID参数。该脚本调用另外一个plotreplay.m函数进行处理。  
  参数：  
  path——包含一个或者多个replay文件的目录路径  
  id——期望突出显示的曲线对应的id，一般为玩家自己的id
- **plotreplay.m**  
  处理单个replay文件的函数，使用方法  
  在命令窗口输入plotreplay(filename,id)
  或者plotreplay(filename)，  
  参数：  
  filename——replay文件路径  
  id——期望突出显示的曲线对应的id，一般为玩家自己的id


---

使用octave时，现在命令行窗口进行源码所在目录，提前设置好参数，然后输入plotall即可。

octave 下载地址：  
http://www.gnu.org/software/octave/