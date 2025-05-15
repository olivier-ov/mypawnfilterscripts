#include <a_samp>
#include <sscanf2>

#define COLOR_RED        0xFF0000FF
#define COLOR_GREEN      0x00FF00FF
#define COLOR_BLUE       0x0000FFFF
#define COLOR_YELLOW     0xFFFF00FF

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp(cmdtext, "/setcolor", bool:true, 9) == 0)
    {
        new cmd[16], colorName[16];
        sscanf(cmdtext, "s[16]s[16]", cmd, colorName); // �����������ɫ��

        if (strlen(colorName) == 0)
        {
            SendClientMessage(playerid, COLOR_RED, "�÷�: /setcolor [red|green|blue|yellow]");
            return 1;
        }

        new color;
        if (!strcmp(colorName, "red", bool:true))
        {
            color = COLOR_RED;
        }
        else if (!strcmp(colorName, "green", bool:true))
        {
            color = COLOR_GREEN;
        }
        else if (!strcmp(colorName, "blue", bool:true))
        {
            color = COLOR_BLUE;
        }
        else if (!strcmp(colorName, "yellow", bool:true))
        {
            color = COLOR_YELLOW;
        }
        else
        {
            SendClientMessage(playerid, COLOR_RED, "��Ч��ɫ��������ɫ: red, green, blue, yellow");
            return 1;
        }

        SetPlayerColor(playerid, color);
        new msg[64];
        format(msg, sizeof(msg), "���ѽ���ɫ����Ϊ %s", colorName);
        SendClientMessage(playerid, color, msg);
        return 1;
    }
    return 0;
}

