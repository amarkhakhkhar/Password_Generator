#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

void randomPasswordGeneration(int N, char UC, char NUM, char SYM)
{   
    bool iUC = false;
    bool iNUM = false;
    bool iSYM = false;

    if (UC == 'Y')
    {
        iUC = true;
    }
    else{
        iUC = false;
    }
    
    if (NUM == 'Y')
    {
        iNUM = true;
        }    
    else {
        iNUM = false;
    }
    if (SYM == 'Y')
    {
        iSYM = true;
    }
    else{
        iSYM = false;
    }

    int i = 0;
    int randomizer = 0;
    srand((unsigned int)(time(NULL)));
    char numbers[] = "0123456789";
    char letter[] = "abcdefghijklmnoqprstuvwyzx";
    char LETTER[] = "ABCDEFGHIJKLMNOQPRSTUYWVZX";
    char symbols[] = "!@#$^&*?";
    char password[N];

    if (iUC==true && iNUM == true && iSYM == true)
    {
        randomizer = rand() % 4;
        for (i = 0; i < N; i++)
    {
        if (randomizer == 1)
        {
            password[i] = numbers[rand() % 10];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else if (randomizer == 2)
        {
            password[i] = symbols[rand() % 8];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else if (randomizer == 3)
        {
            password[i] = LETTER[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else
        {
            password[i] = letter[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
    }
    }
    else if (iUC==true && iNUM == false && iSYM == false)
    {
        randomizer = rand() % 2;
        for (i = 0; i < N; i++)
    {
        if (randomizer == 1)
        {
            password[i] = LETTER[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else
        {
            password[i] = letter[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
    }
    }
    else if (iUC==false && iNUM == true && iSYM == false)
    {
        randomizer = rand() % 2;
        for (i = 0; i < N; i++)
    {
        if (randomizer == 1)
        {
            password[i] = numbers[rand() % 10];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else
        {
            password[i] = letter[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
    }
    }
    else if (iUC==false && iNUM == false && iSYM == true)
    {
        randomizer = rand() % 2;
        for (i = 0; i < N; i++)
    {
        if (randomizer == 2)
        {
            password[i] = symbols[rand() % 8];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else
        {
            password[i] = letter[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
    }
    }
    else if (iUC==true && iNUM == true && iSYM == false)
    {
        randomizer = rand() % 3;
        for (i = 0; i < N; i++)
    {
        if (randomizer == 1)
        {
            password[i] = numbers[rand() % 10];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else if (randomizer == 2)
        {
            password[i] = LETTER[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else
        {
            password[i] = letter[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
    }
    }
    else if (iUC==true && iNUM == false && iSYM == true)
    {
        randomizer = rand() % 3;
        for (i = 0; i < N; i++)
    {
         if (randomizer == 1)
        {
            password[i] = symbols[rand() % 8];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else if (randomizer == 2)
        {
            password[i] = LETTER[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else
        {
            password[i] = letter[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
    }
    }
    else if (iUC==false && iNUM == true && iSYM == true)
    {
        randomizer = rand() % 3;
        for (i = 0; i < N; i++)
    {
        if (randomizer == 1)
        {
            password[i] = numbers[rand() % 10];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else if (randomizer == 2)
        {
            password[i] = symbols[rand() % 8];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
        else
        {
            password[i] = letter[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
        }
    }
    }
    else if (iUC==false && iNUM == false && iSYM == false)
    {
        randomizer = rand();
        for (i = 0; i < N; i++)
    {
            password[i] = letter[rand() % 26];
            randomizer = rand() % 4;
            printf("%c", password[i]);
    }
    }
}

int main()
{
    int N;
    char incUC, incNUM, incSYM;
    printf("Enter the length of password required:\n");
    scanf("%d", &N);
    printf("Do you want to include UpperCase letters?\n(Y/N):");
    scanf(" %c", &incUC);
    printf("Do you want to include Numbers?\n(Y/N):");
    scanf(" %c", &incNUM);
    printf("Do you want to include Symbols?\n(Y/N):");
    scanf(" %c", &incSYM);
    randomPasswordGeneration(N, incUC, incNUM, incSYM);

    return 0;
}
