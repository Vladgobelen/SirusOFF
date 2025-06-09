#!/usr/bin/env lua

os.execute("sh servMesg.sh")

while true do
    -- Получаем список TCP-соединений с портом 11294
    local cmd = [[ss -t state established '( dport = :11294 or sport = :11294 )' | awk 'NR>1 {print $2, $3}']]
    local handle = io.popen(cmd)
    local output = handle:read("*a")
    handle:close()

    local recv_q_total = 0
    local send_q_total = 0
    local connection_count = 0

    for line in output:gmatch("[^\r\n]+") do
        local recv_q, send_q = line:match("(%d+)%s+(%d+)")
        if recv_q and send_q then
            recv_q = tonumber(recv_q)
            send_q = tonumber(send_q)

            recv_q_total = recv_q_total + recv_q
            send_q_total = send_q_total + send_q
            connection_count = connection_count + 1
        end
    end

    -- Проверяем количество соединений
    if connection_count == 0 then
        os.execute("sh alarm1.sh")
        print("Нет активных соединений")
        print(os.date())
    end

    -- Проверяем очередь полученных пакетов
    if recv_q_total > 50000 then
        os.execute("sh alarm.sh")
        print("Очередь получения пакетов превышена")
        print(os.date())
        print("Recv-Q:", recv_q_total)
    end

    -- Проверяем очередь отправленных пакетов
    if send_q_total > 1000 then
        os.execute("sh alarm.sh")
        print("Очередь отправки пакетов превышена")
        print(os.date())
        print("Send-Q:", send_q_total)
    end

    -- Ждём 30 секунд перед следующей проверкой
    os.execute("sleep 30")
end