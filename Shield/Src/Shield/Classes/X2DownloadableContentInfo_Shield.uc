//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_ShieldWeapon.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_Shield extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{
	`Log("Shield Update");
	UpdateStorage();
}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
//static event InstallNewCampaign(XComGameState StartState){}

static function UpdateStorage()
{
	local XComGameState NewGameState;
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local X2ItemTemplateManager ItemTemplateMgr;
	local X2ItemTemplate ItemTemplate;
	local XComGameState_Item NewItemState;

	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Updating HQ Storage to add Shields");
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	NewGameState.AddStateObject(XComHQ);
	ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	`Log("Shield : Updated Conventional Shields");
	ItemTemplate = ItemTemplateMgr.FindItemTemplate('Shield_CV');
	if(ItemTemplate != none)
	{
		`Log("Shield : Found Shield_CV item template");
		if (!XComHQ.HasItem(ItemTemplate))
		{
			`Log("Shield : Shield_CV not found, adding to inventory");
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			History.AddGameStateToHistory(NewGameState);
		} else {
			`Log("Shield : Shield_CV found, skipping inventory add");
			History.CleanupPendingGameState(NewGameState);
		}
	}
}