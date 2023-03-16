#! /bin/env lua
os.execute("sh servMesg.sh");
while(true) do
local two_null = io.popen("netstat |grep sir | awk '{print $2}'", 'r');

--отладка
print ("успешно выполнилась команда проверки на два нуля");
--отладка

    for line in two_null:lines() do
        line = tonumber (line);
        print (line);
        if line > 1500 then

            --отладка
            local date_time = os.date()
            print ("успешная проверка на ноль - было больше нуля, музыки еще нет");
            print (date_time);
            --отладка

            os.execute("sh alarm1.sh");

            --отладка
            local date_time = os.date()
            print ("успешно прошла музыка");
            print (date_time);
            --отладка

        else

            --отладка
            local date_time = os.date()
            print ("успешная проверка на ноль - был ноль");
            print (date_time);
            --отладка

        end
    end;
    two_null:close();

    --отладка
    local date_time = os.date()
    print ("проверка на нули успешно завершилась");
    print (date_time);
    --отладка

    local two_str = io.popen('netstat |grep "sir8.antoshin.exam:7776 ESTABLISHED" | wc -l', 'r');

    local data_two_str = two_str:read('*a');
	local number_data_two_stat = tonumber(data_two_str);

	--отладка
	local date_time = os.date()
    print ("успешно считал, что две строки");
    print (date_time);
    --отладка

    if number_data_two_stat ~= nil then
        if number_data_two_stat < 2 then
            print (number_data_two_stat);
            os.execute("sh alarm1.sh");

            --отладка
            local date_time = os.date()
            print ("строки было не две, но успешно");
            print (date_time);
            --отладка

        else
            print (number_data_two_stat);

           --отладка
            local date_time = os.date()
            print ("успешно было две строки");
            print (date_time);
            --отладка
        end
    else
    end
    os.execute("sleep 30");
end;
