#! /bin/env lua
os.execute("sh servMesg.sh");
while(true) do
local two_null = io.popen("netstat |grep sir | awk '{print $2}'", 'r');

    for line in two_null:lines() do
        line = tonumber (line);
        print (line);
        if line > 1500 then
            os.execute("sh alarm1.sh");
        else
        end
    end;
    two_null:close();
    local two_str = io.popen('netstat |grep "sir8.antoshin.exam:7776 ESTABLISHED" | wc -l', 'r');
    local data_two_str = two_str:read('*a');
	local number_data_two_stat = tonumber(data_two_str);
    if number_data_two_stat ~= nil then
        if number_data_two_stat < 2 then
            print (number_data_two_stat);
            os.execute("sh alarm1.sh");
        else
            print (number_data_two_stat);
        end
    else
    end
    os.execute("sleep 30");
end;
