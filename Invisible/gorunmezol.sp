#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "HestiaN"
#define PLUGIN_VERSION "0.01"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
//#include <sdkhooks>

#pragma newdecls required

EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "Görünmez Ol",
	author = PLUGIN_AUTHOR,
	description = "Görünmez olma plugini.",
	version = PLUGIN_VERSION,
	url = "#"
};

public bool invisibility = false;

public void OnPluginStart()
{
	g_Game = GetEngineVersion();
	if(g_Game != Engine_CSGO && g_Game != Engine_CSS)
	{
		SetFailState("Bu plugin sadece CS:GO/CS:S'da çalışabilir!");	
	}
	PrintToServer("Görünmezlik Plugin'i Aktif!");
	RegAdminCmd("sm_gorunmezol", Command_Invinsible, ADMFLAG_SLAY);
}

public Action Command_Invinsible (int client, int args){
	
	if(!invisibility) {
		invisibility = true;
		SetEntityRenderColor(client, 255, 255, 255, 0);
		ReplyToCommand(client, "\x02[SM] \x04Görünmez Oldunuz!");
	} else {
		invisibility = false;
		SetEntityRenderColor(client, 255,255,255,255);
		ReplyToCommand(client, "\x02[SM] \x04Görünmezlikten Çıktınız!");
	}		
	return Plugin_Handled;
}
