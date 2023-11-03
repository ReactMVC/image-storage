#define FILTERSCRIPT

#include <a_samp.inc>
#include <zcmd.inc>
#include <sscanf2.inc>
#include <streamer.inc>
#include <foreach.inc>


#define COLOR_WHITE 		0xFFFFFFFF
#define COLOR_WHITEP 		0xFFE4C4FF
#define COLOR_ORANGE   		0xDB881AFF
#define COLOR_RED 			0xFF0000FF
#define COLOR_GREEN 		0x3BBD44FF
#define COLOR_GREY			0xBABABAFF
#define COLOR_GREY2 		0x778899FF
#define COLOR_GREY3			0xC8C8C8FF

#define MAX_GATES 201
#define Error(%1,%2) SendClientMessage(%1, COLOR_GREY3, "ERROR: "%2)

new gEdit[MAX_PLAYERS];
new gEditID[MAX_PLAYERS];
new Float:gPos[MAX_PLAYERS][3];
new Float:gRot[MAX_PLAYERS][3];

#pragma warning disable 238

enum gateInfo
{
	gGate,
	Text3D:gText,
	gModel,
	Float:gCX,
	Float:gCY,
	Float:gCZ,
	Float:gCRX,
	Float:gCRY,
	Float:gCRZ,
	Float:gOX,
	Float:gOY,
	Float:gOZ,
	Float:gORX,
	Float:gORY,
	Float:gORZ,
	gPassword[256],
	Float:gSpeed,
	gStatus
}
new GateInfo[MAX_GATES][gateInfo];

stock LoadGates()
{
	new dinfo[15][128];
	new string[256];
	new File:file = fopen("gates.cfg", io_read);
	if(file)
	{
	    new idx = 1;
		while(idx < MAX_GATES)
		{
		    fread(file, string);
		    split(string, dinfo, '|');
			GateInfo[idx][gModel] = strval(dinfo[0]);
			GateInfo[idx][gCX] = floatstr(dinfo[1]);
			GateInfo[idx][gCY] = floatstr(dinfo[2]);
			GateInfo[idx][gCZ] = floatstr(dinfo[3]);
			GateInfo[idx][gCRX] = floatstr(dinfo[4]);
			GateInfo[idx][gCRY] = floatstr(dinfo[5]);
			GateInfo[idx][gCRZ] = floatstr(dinfo[6]);
			GateInfo[idx][gOX] = floatstr(dinfo[7]);
			GateInfo[idx][gOY] = floatstr(dinfo[8]);
			GateInfo[idx][gOZ] = floatstr(dinfo[9]);
			GateInfo[idx][gORX] = floatstr(dinfo[10]);
			GateInfo[idx][gORY] = floatstr(dinfo[11]);
			GateInfo[idx][gORZ] = floatstr(dinfo[12]);
			format(GateInfo[idx][gPassword], 256, "%s", dinfo[13]);
			GateInfo[idx][gSpeed] = floatstr(dinfo[14]);
			if(GateInfo[idx][gModel])
			{
			    format(string, sizeof(string), "Gate ID : %d", idx);
				GateInfo[idx][gGate] = CreateDynamicObject(GateInfo[idx][gModel], GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ], GateInfo[idx][gCRX], GateInfo[idx][gCRY], GateInfo[idx][gCRZ]);
				GateInfo[idx][gText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ], 10);
				GateInfo[idx][gStatus] = 0;
			}
			idx++;
	    }
	}
	print("Gates loaded successfully.");
	return true;
}

stock SaveGates()
{
	new idx = 1, File:file;
	new string[256];
	while(idx < MAX_GATES)
	{
	    format(string, sizeof(string), "%d|%f|%f|%f|%f|%f|%f|%f|%f|%f|%f|%f|%f|%s|%f\r\n",
		GateInfo[idx][gModel],
		GateInfo[idx][gCX],
		GateInfo[idx][gCY],
		GateInfo[idx][gCZ],
		GateInfo[idx][gCRX],
		GateInfo[idx][gCRY],
		GateInfo[idx][gCRZ],
		GateInfo[idx][gOX],
		GateInfo[idx][gOY],
		GateInfo[idx][gOZ],
		GateInfo[idx][gORX],
		GateInfo[idx][gORY],
		GateInfo[idx][gORZ],
		GateInfo[idx][gPassword],
		GateInfo[idx][gSpeed]);
		GateInfo[idx][gStatus] = 0;
	    if(idx == 1)
	    {
	        file = fopen("gates.cfg", io_write);
	    }
	    else
	    {
	    	file = fopen("gates.cfg", io_append);
	    }
		fwrite(file, string);
		fclose(file);
		idx++;
	}
	print("Gates saved successfully.");
	return true;
}

stock split(const strsrc[], strdest[][], delimiter)
{
    new i, li;
    new aNum;
    new len;
    while(i <= strlen(strsrc))
    {
        if(strsrc[i] == delimiter || i == strlen(strsrc))
        {
            len = strmid(strdest[aNum], strsrc, li, i, 128);
            strdest[aNum][len] = 0;
            li = i+1;
            aNum++;
        }
        i++;
    }
    return true;
}

stock CheckFiles()
{
	if(!dini_Exists("gates.cfg")) dini_Create("gates.cfg");
	return true;
}

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print("Gates System By @BeGo_ZeRo Loaded");
	print("Join To My Channel : @BeGo_ZeRo");
	print("--------------------------------------\n");
    LoadGates();
	return true;
}

public OnFilterScriptExit()
{
    SaveGates();
	return true;
}

public OnPlayerConnect(playerid)
{
	return true;
}

public OnPlayerDisconnect(playerid, reason)
{
	return true;
}

public OnPlayerSpawn(playerid)
{
	return true;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return true;
}

public OnVehicleSpawn(vehicleid)
{
	return true;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return true;
}

public OnPlayerText(playerid, text[])
{
	return true;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return true;

}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return true;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return true;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return true;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return true;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return true;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return true;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return true;
}

public OnRconCommand(cmd[])
{
	return true;
}

public OnPlayerRequestSpawn(playerid)
{
	return true;
}

public OnObjectMoved(objectid)
{
	return true;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return true;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return true;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return true;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return true;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return true;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return true;
}

public OnPlayerExitedMenu(playerid)
{
	return true;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return true;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return true;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return true;
}

public OnPlayerUpdate(playerid)
{
	return true;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return true;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return true;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return true;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return true;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)

{
	new Float:oldX, Float:oldY, Float:oldZ,
		Float:oldRotX, Float:oldRotY, Float:oldRotZ;
	GetDynamicObjectPos(objectid, oldX, oldY, oldZ);
	GetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);

 	MoveDynamicObject(objectid, x, y, z, 10.0, rx, ry, rz);


	if(response == EDIT_RESPONSE_FINAL)
	{
		SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
	}
	else if(response == EDIT_RESPONSE_CANCEL)
	{
		SetDynamicObjectPos(objectid, oldX, oldY, oldZ);
		SetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
	}

	new string[128], idx = gEditID[playerid];
	if(response == EDIT_RESPONSE_UPDATE)
	{
	    SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
	}
	else if(response == EDIT_RESPONSE_CANCEL)
	{
	    SetDynamicObjectPos(objectid, gPos[playerid][0], gPos[playerid][1], gPos[playerid][2]);
		SetDynamicObjectRot(objectid, gRot[playerid][0], gRot[playerid][1], gRot[playerid][2]);
		gPos[playerid][0] = 0; gPos[playerid][1] = 0; gPos[playerid][2] = 0;
		gRot[playerid][0] = 0; gRot[playerid][1] = 0; gRot[playerid][2] = 0;
		format(string, sizeof(string), " You have canceled editing gate ID %d.", idx);
		SendClientMessage(playerid, COLOR_WHITE, string);
	}
	else if(response == EDIT_RESPONSE_FINAL)
	{
		SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
		if(gEdit[playerid] == 1)
		{
		    GateInfo[idx][gCX] = x;
			GateInfo[idx][gCY] = y;
			GateInfo[idx][gCZ] = z;
			GateInfo[idx][gCRX] = rx;
			GateInfo[idx][gCRY] = ry;
			GateInfo[idx][gCRZ] = rz;
			if(IsValidDynamic3DTextLabel(GateInfo[idx][gText])) DestroyDynamic3DTextLabel(GateInfo[idx][gText]);
			format(string, sizeof(string), "Gate ID : %d", idx);
			GateInfo[idx][gText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ], 10);
		    gEdit[playerid] = 0;
		    gEditID[playerid] = 0;
		    format(string, sizeof(string), " You have finished editing gate ID %d's closing position.", idx);
		    SendClientMessage(playerid, COLOR_WHITE, string);
		    GateInfo[idx][gStatus] = 0;
		}
		else if(gEdit[playerid] == 2)
		{
		    GateInfo[idx][gOX] = x;
			GateInfo[idx][gOY] = y;
			GateInfo[idx][gOZ] = z;
			GateInfo[idx][gORX] = rx;
			GateInfo[idx][gORY] = ry;
			GateInfo[idx][gORZ] = rz;
			gEdit[playerid] = 0;
			gEditID[playerid] = 0;
			format(string, sizeof(string), " You have finished editing gate ID %d's opening position.", idx);
		    SendClientMessage(playerid, COLOR_WHITE, string);
		    GateInfo[idx][gStatus] = 1;
		}
	}
}

CMD:gatehelp(playerid)
{
	SendClientMessage(playerid, COLOR_WHITE, "[::WELCOME TO GATE SYSTEM COMMANDS BY Zero_Joker::]");
	SendClientMessage(playerid, COLOR_WHITE, "1. /creategate >> Jahat Sakht Gate");
	SendClientMessage(playerid, COLOR_WHITE, "2. /gedit 	 >> Baz Kardan Menu Setting Gate");
	SendClientMessage(playerid, COLOR_WHITE, "3. /gused 	 >> Baray Estefade Az Gate");
	SendClientMessage(playerid, COLOR_WHITE, "4. /deletegate >> Baraye Pak Kardan Gate");
	SendClientMessage(playerid, COLOR_WHITE, "5. /gotogate   >> Baray Teleport Shodan Pish Gate");
	SendClientMessage(playerid, COLOR_WHITE, "6. /gate 	 	 >> Baray Control Gate");
	SendClientMessage(playerid, COLOR_WHITE, "7. /savegates  >> for saving all gate");
	return true;
		
}

CMD:savegates(playerid)
{
    SaveGates();
    SendClientMessage(playerid, COLOR_WHITE, "Your Has Saving All gates!");
	return true;
}

CMD:gedit(playerid, params[])
{
	new string[128], idx;
 	if(sscanf(params, "s[128]", params))
	{
		SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gedit [option] [gateid]");
		SendClientMessage(playerid, COLOR_GREY, "OPTIONS: object | close | open | speed | password");
		return true;
	}
	if(!strcmp(params, "object", true, 5))
	{
	    new object;
	    if(sscanf(params, "s[128]ii", params, idx, object)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gedit object [gateid] [objectid]");
        if(!GateInfo[idx][gModel]) return SendClientMessage(playerid, COLOR_GREY, "Invalid gate id.");
        if(object == 0)
		{
			format(string, sizeof(string), "%d", object);
			cmd_deletegate(playerid, string);
			return true;
		}
		GateInfo[idx][gModel] = object;
		DestroyDynamicObject(GateInfo[idx][gGate]);
		GateInfo[idx][gGate] = CreateDynamicObject(GateInfo[idx][gModel], GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ], GateInfo[idx][gCRX], GateInfo[idx][gCRY], GateInfo[idx][gCRZ]);
	    format(string, sizeof(string), " You have set gate ID %d's object ID to %d.", idx, object);
	    SendClientMessage(playerid, COLOR_WHITE, string);
	}
	else if(!strcmp(params, "close", true, 5))
	{
	    if(sscanf(params, "s[128]i", params, idx)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gedit position [gateid]");
        if(!GateInfo[idx][gModel]) return SendClientMessage(playerid, COLOR_GREY, "Invalid gate id.");
		gEdit[playerid] = 1;
		gEditID[playerid] = idx;
		GetDynamicObjectPos(GateInfo[idx][gGate], gPos[playerid][0], gPos[playerid][1], gPos[playerid][2]);
		GetDynamicObjectRot(GateInfo[idx][gGate], gRot[playerid][0], gRot[playerid][1], gRot[playerid][2]);
		EditDynamicObject(playerid, GateInfo[idx][gGate]);
	    format(string, sizeof(string), " You are now editing gate ID %d's closing position.", idx);
	    SendClientMessage(playerid, COLOR_WHITE, string);
	}
	else if(!strcmp(params, "open", true, 4))
	{
	    if(sscanf(params, "s[128]i", params, idx)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gedit open [gateid]");
        if(!GateInfo[idx][gModel]) return SendClientMessage(playerid, COLOR_GREY, "Invalid gate id.");
		gEdit[playerid] = 2;
		gEditID[playerid] = idx;
		GetDynamicObjectPos(GateInfo[idx][gGate], gPos[playerid][0], gPos[playerid][1], gPos[playerid][2]);
		GetDynamicObjectRot(GateInfo[idx][gGate], gRot[playerid][0], gRot[playerid][1], gRot[playerid][2]);
		EditDynamicObject(playerid, GateInfo[idx][gGate]);
	    format(string, sizeof(string), " You are now editing gate ID %d's opening position.", idx);
	    SendClientMessage(playerid, COLOR_WHITE, string);
	}
	else if(!strcmp(params, "speed", true, 5))
	{
	    new Float:speed;
	    if(sscanf(params, "s[128]if", params, idx, speed)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gedit open [gateid] [speed]");
        if(!GateInfo[idx][gModel]) return SendClientMessage(playerid, COLOR_GREY, "Invalid gate id.");
		GateInfo[idx][gSpeed] = speed;
	    format(string, sizeof(string), " You have set gate ID %d's moving speed to %f.", idx, speed);
	    SendClientMessage(playerid, COLOR_WHITE, string);
	}
	else if(!strcmp(params, "password", true, 8))
	{
	    new password[256];
	    if(sscanf(params, "s[128]is[256]", params, idx, password)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gedit open [gateid] [password]");
        if(!GateInfo[idx][gModel]) return SendClientMessage(playerid, COLOR_GREY, "Invalid gate id.");
		format(GateInfo[idx][gPassword], 256, "%s", password);
	    format(string, sizeof(string), " You have set gate ID %d's password to {FF6347}%s", idx, password);
	    SendClientMessage(playerid, COLOR_WHITE, string);
	}
	return true;
}

CMD:gotogate(playerid, params[])
{
    new idx, string[128];
	if(sscanf(params, "i", idx)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gotogate [gateid]");
	if(!GateInfo[idx][gModel]) return SendClientMessage(playerid, COLOR_GREY, "Invalid gate id.");
	SetPlayerPos(playerid, GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ]);
	format(string, sizeof(string), " You have teleported to gate ID %d.", idx);
	SendClientMessage(playerid, COLOR_WHITE, string);
	return true;
}

CMD:gused(playerid, params[])
{
	new string[128];
	SendClientMessage(playerid, COLOR_ORANGE, "[Used Gates]:");
	for(new idx=1; idx<MAX_GATES; idx++)
	{
	    if(GateInfo[idx][gModel])
	    {
			format(string, sizeof(string), "ID: %d | Object: %d | Speed: %f | Password: %s", idx, GateInfo[idx][gModel], GateInfo[idx][gSpeed], GateInfo[idx][gPassword]);
			SendClientMessage(playerid, COLOR_ORANGE, string);
	    }
	}
	return true;
}

CMD:deletegate(playerid, params[])
{
    new idx, string[128];
	if(sscanf(params, "i", idx)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /deletegate [gateid]");
	if(!GateInfo[idx][gModel]) return SendClientMessage(playerid, COLOR_GREY, "Invalid gate id.");
	GateInfo[idx][gModel] = 0;
	GateInfo[idx][gCX] = 0;
	GateInfo[idx][gCY] = 0;
	GateInfo[idx][gCZ] = 0;
	GateInfo[idx][gCRX] = 0;
	GateInfo[idx][gCRY] = 0;
	GateInfo[idx][gCRZ] = 0;
	GateInfo[idx][gOX] = 0;
	GateInfo[idx][gOY] = 0;
	GateInfo[idx][gOZ] = 0;
	GateInfo[idx][gORX] = 0;
	GateInfo[idx][gORY] = 0;
	GateInfo[idx][gORZ] = 0;
	GateInfo[idx][gStatus] = 0;
	format(GateInfo[idx][gPassword], 256, "");
	GateInfo[idx][gSpeed] = 0;
	DestroyDynamicObject(GateInfo[idx][gGate]);
	DestroyDynamic3DTextLabel(GateInfo[idx][gText]);
	format(string, sizeof(string), "AdmWarn: you has deleted gate ID %d.", idx);
    SendClientMessage(playerid, COLOR_WHITE, string);
	return true;
}

CMD:creategate(playerid, params[])
{
	new string[128], object;
	if(sscanf(params, "i", object)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /creategate [objectid]");
	for(new idx=1; idx<MAX_GATES; idx++)
	{
	    if(!GateInfo[idx][gModel])
	    {
	        GetPlayerPos(playerid, GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ]);
  			GateInfo[idx][gModel] = object;
			GateInfo[idx][gCX] = GateInfo[idx][gCX] + 2;
			GateInfo[idx][gCY] = GateInfo[idx][gCY] + 2;
			GateInfo[idx][gCRX] = 0;
			GateInfo[idx][gCRY] = 0;
			GateInfo[idx][gCRZ] = 0;
			GetPlayerPos(playerid, GateInfo[idx][gOX], GateInfo[idx][gOY], GateInfo[idx][gOZ]);
			GateInfo[idx][gOX] = GateInfo[idx][gOX] + 2;
			GateInfo[idx][gOY] = GateInfo[idx][gOY] + 2;
			GateInfo[idx][gORX] = 0;
			GateInfo[idx][gORY] = 0;
			GateInfo[idx][gORZ] = 0;
			GateInfo[idx][gStatus] = 0;
			format(GateInfo[idx][gPassword], 256, "");
			GateInfo[idx][gSpeed] = 2;
			format(string, sizeof(string), "Gate ID : %d", idx);
			GateInfo[idx][gGate] = CreateDynamicObject(GateInfo[idx][gModel], GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ], GateInfo[idx][gCRX], GateInfo[idx][gCRY], GateInfo[idx][gCRZ]);
			GateInfo[idx][gText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ], 10);
			format(string, sizeof(string), "AdmWarn: you has created gate ID %d. (Object: %d)", idx, object);
		    SendClientMessage(playerid, COLOR_WHITE, string);
			idx = MAX_GATES;
		}
	}
	return true;
}

CMD:gate(playerid, params[])
{
    for(new idx=1; idx<MAX_GATES; idx++)
	{
	    if(GateInfo[idx][gModel] && IsPlayerInRangeOfPoint(playerid, 8, GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ]))
	    {
	        if(strlen(GateInfo[idx][gPassword]))
	        {
	            if(sscanf(params, "s[256]", params)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gate [password]");
	            if(strcmp(params, GateInfo[idx][gPassword])) return SendClientMessage(playerid, COLOR_GREY, "Invalid gate password.");
	            if(!GateInfo[idx][gStatus])
		        {
		            GateInfo[idx][gStatus] = 1;
		            MoveDynamicObject(GateInfo[idx][gGate], GateInfo[idx][gOX], GateInfo[idx][gOY], GateInfo[idx][gOZ], GateInfo[idx][gSpeed]);
		            SetDynamicObjectRot(GateInfo[idx][gGate], GateInfo[idx][gORX], GateInfo[idx][gORY], GateInfo[idx][gORZ]);
		        }
		        else
		        {
		            GateInfo[idx][gStatus] = 0;
		            MoveDynamicObject(GateInfo[idx][gGate], GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ], GateInfo[idx][gSpeed]);
		            SetDynamicObjectRot(GateInfo[idx][gGate], GateInfo[idx][gCRX], GateInfo[idx][gCRY], GateInfo[idx][gCRZ]);
		        }
	        }
	        else
	        {
		        if(!GateInfo[idx][gStatus])
		        {
		            GateInfo[idx][gStatus] = 1;
		            MoveDynamicObject(GateInfo[idx][gGate], GateInfo[idx][gOX], GateInfo[idx][gOY], GateInfo[idx][gOZ], GateInfo[idx][gSpeed]);
		            SetDynamicObjectRot(GateInfo[idx][gGate], GateInfo[idx][gORX], GateInfo[idx][gORY], GateInfo[idx][gORZ]);
		        }
		        else
		        {
		            GateInfo[idx][gStatus] = 0;
		            MoveDynamicObject(GateInfo[idx][gGate], GateInfo[idx][gCX], GateInfo[idx][gCY], GateInfo[idx][gCZ], GateInfo[idx][gSpeed]);
		            SetDynamicObjectRot(GateInfo[idx][gGate], GateInfo[idx][gCRX], GateInfo[idx][gCRY], GateInfo[idx][gCRZ]);
		        }
	        }
	        idx = MAX_GATES;
	        return true;
	    }
	}
	return true;
}
