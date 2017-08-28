class X2Item_ShieldSchematics extends X2Item config(Shield);

var config int SHIELD_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int SHIELD_BEAM_SCHEMATIC_SUPPLYCOST;

var config int SHIELD_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int SHIELD_BEAM_SCHEMATIC_ALLOYCOST;

var config int SHIELD_MAGNETIC_SCHEMATIC_ELERIUMCOST;
var config int SHIELD_BEAM_SCHEMATIC_ELERIUMCOST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;

	Schematics.AddItem(CreateTemplate_Shield_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_Shield_Beam_Schematic());

	return Schematics;
}

static function X2DataTemplate CreateTemplate_Shield_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Shield_MG_Schematic');
	
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Hammer_Armor";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;
	
	// Items being created
	Template.ReferenceItemTemplate = 'Shield_MG';
	Template.HideIfPurchased = 'Shield_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	//Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SHIELD_MAGNETIC_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	if(default.SHIELD_MAGNETIC_SCHEMATIC_ALLOYCOST > 0)
	{
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SHIELD_MAGNETIC_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if(default.SHIELD_MAGNETIC_SCHEMATIC_ELERIUMCOST > 0){
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SHIELD_MAGNETIC_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Shield_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Shield_BM_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Warden_Armor";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	//Items being created
	Template.ReferenceItemTemplate = 'Shield_BM';

	//Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	//Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SHIELD_BEAM_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	if(default.SHIELD_BEAM_SCHEMATIC_ALLOYCOST > 0)
	{
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.SHIELD_BEAM_SCHEMATIC_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	if(default.SHIELD_BEAM_SCHEMATIC_ELERIUMCOST > 0)
	{
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SHIELD_BEAM_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}