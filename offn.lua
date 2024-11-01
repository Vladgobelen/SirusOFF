#! /bin/env lua
os.execute("sh servMesg.sh");
while(true) do
local two_null = io.popen("netstat |grep ':11294 ' | awk '{print $3}'", 'r');

    for line in two_null:lines() do
        if line then
            line = tonumber (line);
            if  line ~= nil then
                if line > 500 then
                    os.execute("sh alarm.sh");
                    print ("количество пакетов превышено");
                    print (os.date());
                    print (line)
                else
                end
            end
        else
            os.execute("sh alarm.sh");
        end
    end;
    two_null:close();

    local two_null1 = io.popen("netstat |grep 11294 | awk '{print $2}'", 'r');

    for line in two_null1:lines() do
        if line ~= nil then
            line = tonumber (line);
            if line > 50000 then
                os.execute("sh alarm.sh");
                print ("количество пакетов превышено");
                print (os.date());
                print (line)
            else
            end
        else
            os.execute("sh alarm.sh");
        end
    end;
    two_null1:close();


    local two_str = io.popen('netstat |grep "11294" | wc -l', 'r');
    local data_two_str = two_str:read('*a');
	local number_data_two_stat = tonumber(data_two_str);
    if number_data_two_stat ~= nil then
        if number_data_two_stat < 1 then
            os.execute("sh alarm1.sh");
            print ("строк меньше двух");
            print (os.date());
            print (number_data_two_stat)
        else
        end
    else
    end
    two_str:close();
    os.execute("sleep 30");
end;
