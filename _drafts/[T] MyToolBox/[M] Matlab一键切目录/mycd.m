%�ô����л���ǰĿ¼
function mycd()
ButtonName = questdlg('ѡ������Ŀ¼','����','Matlab','Work','toolbox', 'Matlab');
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