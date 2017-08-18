class X2Ability_Shield extends X2Ability
	dependson (XComGameStateContext_Ability) config(Shield);

var config int SHIELD_CONVENTIONAL_DODGE_BONUS;
var config int SHIELD_MAGNETIC_DODGE_BONUS;
var config int SHIELD_BEAM_DODGE_BONUS;

var config int SHIELD_CONVENTIONAL_ARMORMITIGATION_BONUS;
var config int SHIELD_MAGNETIC_ARMORMITIGATION_BONUS;
var config int SHIELD_BEAM_ARMORMITIGATION_BONUS;

var config int SHIELD_CONVENTIONAL_HP_BONUS;
var config int SHIELD_MAGNETIC_HP_BONUS;
var config int SHIELD_BEAM_HP_BONUS;

var config int SHIELD_CONVENTIONAL_DEFENSE_BONUS;
var config int SHIELD_MAGNETIC_DEFENSE_BONUS;
var config int SHIELD_BEAM_DEFENSE_BONUS;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddShieldConventionalBonusAbility());
	Templates.AddItem(AddShieldMagneticBonusAbility());
	Templates.AddItem(AddShieldBeamBonusAbility());

	return Templates;
}

static function X2AbilityTemplate AddShieldConventionalBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Shield_CV_StatBonus');

	Template.IconImage = "img:///gfxXcomIcons.NanofiberVest"; //Does nothing, apparently

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class 'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_Dodge, default.SHIELD_CONVENTIONAL_DODGE_BONUS);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.SHIELD_CONVENTIONAL_ARMORMITIGATION_BONUS);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_HP, default.SHIELD_CONVENTIONAL_HP_BONUS);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_Defense, default.SHIELD_CONVENTIONAL_DEFENSE_BONUS);


	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AddShieldMagneticBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Shield_MG_StatBonus');

	Template.IconImage = "img:///gfxXcomIcons.NanofiberVest"; //Does nothing, apparently

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class 'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_Dodge, default.SHIELD_MAGNETIC_DODGE_BONUS);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.SHIELD_MAGNETIC_ARMORMITIGATION_BONUS);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_HP, default.SHIELD_MAGNETIC_HP_BONUS);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_Defense, default.SHIELD_MAGNETIC_DEFENSE_BONUS);

	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AddShieldBeamBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Shield_BM_StatBonus');

	Template.IconImage = "img:///gfxXcomIcons.NanofiberVest"; //Does nothing, apparently

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class 'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_Dodge, default.SHIELD_BEAM_DODGE_BONUS);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.SHIELD_BEAM_ARMORMITIGATION_BONUS);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_HP, default.SHIELD_BEAM_HP_BONUS);
	PersistentStatchangeEffect.AddPersistentStatChange(eStat_Defense, default.SHIELD_BEAM_DEFENSE_BONUS);

	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

