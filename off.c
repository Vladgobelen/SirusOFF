#include <stdio.h>
#include <stdlib.h>
int main()
{
    system ("sh servMesg.sh");
    while (1)
        {
            FILE *TwoNull;
            char line[2];
            TwoNull = popen("netstat |grep sir | awk '{print $1}'", "r");
            while ( fgets( line, sizeof line, TwoNull))
            {
                long int line1 = atoi (line);
                if (line1 > 50000)
                {
                    system ("sh alarm.sh");
                    printf ("%ld\n", line1);
                    printf ("количество пакетов превышено\n");
                }
            }
            pclose(TwoNull);

            FILE *TwoStr;
            char lineS[1];
            size_t i;
            int lineSi;
            TwoStr = popen("netstat |grep '7776 ESTABLISHED' | wc -l", "r");
            i = fread(lineS, 1, sizeof(lineS), TwoStr);
            pclose(TwoStr);
            lineSi = atoi (lineS);
            if (lineSi != 2)
            {
                system ("sh alarm1.sh");
                printf ("%d\n", lineSi);
                printf ("Строк меньше двух");
            }


        }

}
