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
        sscanf(cmdtext, "s[16]s[16]", cmd, colorName); // 解析命令和颜色名

        if (strlen(colorName) == 0)
        {
            SendClientMessage(playerid, COLOR_RED, "用法: /setcolor [red|green|blue|yellow]");
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
            SendClientMessage(playerid, COLOR_RED, "无效颜色！可用颜色: red, green, blue, yellow");
            return 1;
        }

        SetPlayerColor(playerid, color);
        new msg[64];
        format(msg, sizeof(msg), "你已将颜色设置为 %s", colorName);
        SendClientMessage(playerid, color, msg);
        return 1;
    }
    return 0;
}

