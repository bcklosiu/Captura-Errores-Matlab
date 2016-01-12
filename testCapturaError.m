function [c]=testCapturaError(a,b)
try 
c=[a;b];
disp('No error!!')

catch ME %en caso de error en try, captura la excepción (ME) y ejecuta el código de catch
    fname='testCapturaError Log.txt';
    err_mess=ME.message;
    err_id=ME.identifier;
    err_file=ME.stack.name;  
    err_linenr=ME.stack.line;
    date_time=clock;
    str2file=sprintf('%i-%02i-%02i@%02i:%02i:%02i, File:%s, %s:%s, Line Nr.:%i',...
        date_time(1),date_time(2),date_time(3),date_time(4),date_time(5),uint8(date_time(6)),err_file,err_id,err_mess,err_linenr);
    fid = fopen(fname, 'a+');
    fprintf(fid, '%s\r\n', str2file);
    fclose(fid);
    c=[];
end