#include <stdio.h>
#include <stdlib.h>
int main()
{
    system ("sh servMesg.sh");
    while (1)
        {
            long int line1;
            FILE *TwoNull;
            char line[2];
            TwoNull = popen("netstat |grep '7776 ESTABLISHED' | awk '{print $2}'", "r");
            while ( fread(line, 2, sizeof(line), TwoNull))
            {
                line1 = atoi (line);
                if (line1 > 50000)
                {
                    system ("sh alarm.sh");
                    printf ("количество пакетов превышено\n");
                    printf ("%ld\n", line1);

                }
            }
            pclose(TwoNull);

            FILE *TwoStr;
            char lineS;
            TwoStr = popen("netstat |grep '7776 ESTABLISHED' | wc -l", "r");
            lineS = fgetc(TwoStr);
            pclose(TwoStr);
            if (lineS != "2")
            {
                system ("sh alarm1.sh");
                printf ("Строк меньше двух\n");
                printf ("%c\n", lineS);
            }
            printf ("%c\n", lineS);
            system ("sleep 30");
        }

}
