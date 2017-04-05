%用代码切换当前目录
function mycd()
ButtonName = questdlg('选择跳的目录','跳跳','Matlab','Work','toolbox', 'Matlab');
switch ButtonName
    case 'Matlab'
        try
        cd('C:\Users\guofei\Desktop\Module\Matlab')
        catch
            cd('C:\Users\guofe\Desktop\Module\Matlab')
        end
        disp('cd to Matlab');
    case 'Work'
        cd('Z:\Matlab_work')
        disp('cd to work');
    case 'toolbox'
        try
        cd('C:\Users\guofei\Desktop\Module\My_Toolbox')
        catch
            cd('C:\Users\guofe\Desktop\Module\My_Toolbox')
        end
        disp('cd to My_Toolbox');
    otherwise
        
        
end





end