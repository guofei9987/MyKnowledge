%文件目录生成器
%使用方法:把这么m文件所在目录添加到path即可使用
%my_dir('C:\Users\guofei\Desktop\module')
%my_dir()

function str_output=mydir(j,path_file,str_output)
if nargin<3,str_output='';end
if nargin<2,path_file=pwd;end
if nargin<1,j=0;end

j=j+1;
path_detail=dir(path_file);

if length(path_detail)>2
    
    for i=3:length(path_detail)
        if ~path_detail(i).isdir
            
            for k=1:j
                str_output=[str_output,'   '];
            end
            str_output=[str_output,'| '];
            str_output=[str_output,path_detail(i).name];
            str_output=[str_output,char(10)];
        end
    end
    for i=3:length(path_detail)
        
        if path_detail(i).isdir
            for k=1:j
                str_output=[str_output,'   '];
            end
            str_output=[str_output,'└-'];
            str_output=[str_output,path_detail(i).name];
            str_output=[str_output,char(10)];
            
            str_output=mydir(j,[path_file,'/',path_detail(i).name],str_output);
        end
    end
    
end

end