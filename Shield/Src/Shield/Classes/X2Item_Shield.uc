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
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem(CreateTemplate_Shield_CV());
	Weapons.AddItem(CreateTemplate_Shield_MG());
	Weapons.AddItem(CreateTemplate_Shield_BM());

	return Weapons;
}

static function X2DataTemplate CreateTemplate_Shield_CV()
{
	local X2WeaponTemplate Template;
	`Create_X2Template(class 'X2WeaponTemplate', Template, 'Shield_CV');

	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.Itemcat = 'weapon';
	Template.WeaponCat = 'shield';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.GatekeeperEyeball";
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
	
	Template.iPhysicsImpulse = 25;
	Template.fKnockbackDamageAmount = 50.0f;
	Template.fKnockbackDamageRadius = 80.0f;
	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	return Template;
}

static function X2DataTemplate CreateTemplate_Shield_MG()
{
	local X2WeaponTemplate Template;
	`Create_X2Template(class 'X2WeaponTemplate', Template, 'Shield_MG');

	Template.Itemcat = 'weapon';
	Template.WeaponCat = 'shield';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.GatekeeperEyeball";
	
	Template.EquipSound = "Magnetic_Weapon_Equip";
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
	
	Template.iPhysicsImpulse = 25;
	Template.fKnockbackDamageAmount = 50.0f;
	Template.fKnockbackDamageRadius = 80.0f;
	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.CreatorTemplateName = 'Shield_MG_Schematic';
	Template.BaseItem = 'Shield_CV';

	//Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_Shield_BM()
{
	local X2WeaponTemplate Template;
	`Create_X2Template(class 'X2WeaponTemplate', Template, 'Shield_BM');

	Template.EquipSound = "Beam_Weapon_Equip";

	Template.Itemcat = 'weapon';
	Template.WeaponCat = 'shield';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.AlienWeapons.GatekeeperEyeball";
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
	
	Template.iPhysicsImpulse = 25;
	Template.fKnockbackDamageAmount = 50.0f;
	Template.fKnockbackDamageRadius = 80.0f;
	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.CreatorTemplateName = 'Shield_BM_Schematic';
	Template.BaseItem = 'Shield_MG';
	
	//Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}