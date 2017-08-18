class X2Item_Shield extends X2Item config(Shield);

var config WeaponDamageValue SHIELD_BASEDAMAGE;

var config array<int> SHIELD_RANGE;

var config int SHIELD_AIM;
var config int SHIELD_CRITCHANCE;
var config int SHIELD_ICLIPSIZE;
var config int SHIELD_ISOUNDRANGE;
var config int SHIELD_IENVIRONMENTDAMAGE;
var config int SHIELD_ISUPPLIES;
var config int SHIELD_TRADINGPOSTVALUES;
var config int SHIELD_IPOINTS;
var config int SHIELD_IUPGRADESLOTS;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> MyWeapons;
	MyWeapons.AddItem(CreateTemplate_Shield_CV());
	MyWeapons.AddItem(CreateTemplate_Shield_MG());
	MyWeapons.AddItem(CreateTemplate_Shield_BM());

	return MyWeapons;
}

static function X2DataTemplate CreateTemplate_Shield_CV()
{
	local X2WeaponTemplate Template;
	`Create_X2Template(class 'X2WeaponTemplate', Template, 'Shield_CV');

	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.Itemcat = 'weapon';
	Template.WeaponCat = 'shield';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base";
	Template.Tier = 0;

	Template.Abilities.AddItem('Shield_CV_StatBonus');
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class 'X2Ability_Shield'.default.SHIELD_CONVENTIONAL_ARMORMITIGATION_BONUS);
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.DodgeLabel, eStat_Dodge, class 'X2Ability_Shield'.default.SHIELD_CONVENTIONAL_DODGE_BONUS);
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.HealthLabel, eStat_HP, class 'X2Ability_Shield'.default.SHIELD_CONVENTIONAL_HP_BONUS);
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.DefenseLabel, eStat_Defense, class 'X2Ability_Shield'.default.SHIELD_CONVENTIONAL_DEFENSE_BONUS);

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.BaseDamage = default.SHIELD_BASEDAMAGE;
	Template.RangeAccuracy = default.SHIELD_RANGE;
	Template.Aim = default.SHIELD_AIM;
	Template.CritChance = default.SHIELD_CRITCHANCE;
	Template.iClipSize = default.SHIELD_ICLIPSIZE;
	Template.iSoundRange = default.SHIELD_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SHIELD_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.SHIELD_IUPGRADESLOTS;

	//Template.Abilities.AddItem('Sacrifice');
	Template.Abilities.AddItem('Bulwark');
	Template.Abilities.AddItem('HotLoadAmmo');

	
	Template.GameArchetype = "ConvShield.WP_Shield_CV"; //Unreal Asset

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	
	Template.iPhysicsImpulse = 25;
	Template.fKnockbackDamageAmount = 50.0f;
	Template.fKnockbackDamageRadius = 80.0f;
	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;
	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateTemplate_Shield_MG()
{
	local X2WeaponTemplate Template;
	`Create_X2Template(class 'X2WeaponTemplate', Template, 'Shield_MG');

	Template.WeaponPanelImage = "_MagneticRifle";
	Template.EquipSound = "Magnetic_Weapon_Equip";

	Template.Itemcat = 'weapon';
	Template.WeaponCat = 'shield';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.MagAssaultRifle.MagAssault_Base";
	Template.Tier = 2;

	Template.Abilities.AddItem('Shield_MG_StatBonus');
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class 'X2Ability_Shield'.default.SHIELD_MAGNETIC_ARMORMITIGATION_BONUS);
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.DodgeLabel, eStat_Dodge, class 'X2Ability_Shield'.default.SHIELD_MAGNETIC_DODGE_BONUS);
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.HealthLabel, eStat_HP, class 'X2Ability_Shield'.default.SHIELD_MAGNETIC_HP_BONUS);
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.DefenseLabel, eStat_Defense, class 'X2Ability_Shield'.default.SHIELD_MAGNETIC_DEFENSE_BONUS);

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.BaseDamage = default.SHIELD_BASEDAMAGE;
	Template.RangeAccuracy = default.SHIELD_RANGE;
	Template.Aim = default.SHIELD_AIM;
	Template.CritChance = default.SHIELD_CRITCHANCE;
	Template.iClipSize = default.SHIELD_ICLIPSIZE;
	Template.iSoundRange = default.SHIELD_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SHIELD_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.SHIELD_IUPGRADESLOTS;

	//Template.Abilities.AddItem('Sacrifice');
	Template.Abilities.AddItem('Bulwark');
	Template.Abilities.AddItem('HotLoadAmmo');

	
	Template.GameArchetype = "ConvShield.WP_Shield_CV"; //Unreal Asset

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	
	Template.iPhysicsImpulse = 25;
	Template.fKnockbackDamageAmount = 50.0f;
	Template.fKnockbackDamageRadius = 80.0f;
	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;
	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateTemplate_Shield_BM()
{
	local X2WeaponTemplate Template;
	`Create_X2Template(class 'X2WeaponTemplate', Template, 'Shield_BM');

	Template.WeaponPanelImage = "_BeamRifle";
	Template.EquipSound = "Beam_Weapon_Equip";

	Template.Itemcat = 'weapon';
	Template.WeaponCat = 'shield';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.BeamAssaultRifle.BeamAssault_Base";
	Template.Tier = 4;

	Template.Abilities.AddItem('Shield_BM_StatBonus');
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class 'X2Ability_Shield'.default.SHIELD_BEAM_ARMORMITIGATION_BONUS);
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.DodgeLabel, eStat_Dodge, class 'X2Ability_Shield'.default.SHIELD_BEAM_DODGE_BONUS);
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.HealthLabel, eStat_HP, class 'X2Ability_Shield'.default.SHIELD_BEAM_HP_BONUS);
	Template.SetUIStatMarkup(class 'XLocalizedData'.default.DefenseLabel, eStat_Defense, class 'X2Ability_Shield'.default.SHIELD_BEAM_DEFENSE_BONUS);


	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.BaseDamage = default.SHIELD_BASEDAMAGE;
	Template.RangeAccuracy = default.SHIELD_RANGE;
	Template.Aim = default.SHIELD_AIM;
	Template.CritChance = default.SHIELD_CRITCHANCE;
	Template.iClipSize = default.SHIELD_ICLIPSIZE;
	Template.iSoundRange = default.SHIELD_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SHIELD_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.SHIELD_IUPGRADESLOTS;

	//Template.Abilities.AddItem('Sacrifice');
	Template.Abilities.AddItem('Bulwark');
	Template.Abilities.AddItem('HotLoadAmmo');

	
	Template.GameArchetype = "ConvShield.WP_Shield_CV"; //Unreal Asset

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	
	Template.iPhysicsImpulse = 25;
	Template.fKnockbackDamageAmount = 50.0f;
	Template.fKnockbackDamageRadius = 80.0f;
	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;
	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}