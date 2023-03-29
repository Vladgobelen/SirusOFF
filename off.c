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
            TwoNull = popen("echo '50000\n20000'", "r");
            //TwoNull = popen("netstat |grep '7776 ESTABLISHED' | awk '{print $2}'", "r");
            while ( fread(line, sizeof(line), 2, TwoNull))
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
            printf ("%ld\n", line1);
            printf ("%s\n", line);
/*
            FILE *TwoStr;
            int lineSi;
            char lineS;
            TwoStr = popen("netstat |grep '7776 ESTABLISHED' | wc -l", "r");
            lineS = fgetc(TwoStr);
            lineSi = lineS - '0';
            printf ("%d\n", lineSi);
            pclose(TwoStr);
            if (lineS != '2')
            {
                system ("sh alarm1.sh");
                printf ("Строк меньше двух\n");
                printf ("%c\n", lineS);
            }
            printf ("%c\n", lineS);
            system ("sleep 30");
  */

        }

}
