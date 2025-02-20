#include <sourcemod>
#include <cstrike>
#include <sdktools>

#pragma newdecls required

int iUseTime[MAXPLAYERS + 1] = 0;

public void OnPluginStart()
{
	RegConsoleCmd("sm_respawn", Respawn);
	RegConsoleCmd("sm_re", Respawn);
	RegConsoleCmd("sm_res", Respawn);
}

public Action Respawn(int Client, int Args)
{
	if ((GetTime() - iUseTime[Client]) < 1.0) {
		PrintToChat(Client, "重生过快");
		return Plugin_Handled;
	}
	
	iUseTime[Client] = GetTime();
	CS_RespawnPlayer(Client)

	return Plugin_Handled;
}

public void OnClientPostAdminCheck(int Client)
{
	iUseTime[Client] = GetTime();
}