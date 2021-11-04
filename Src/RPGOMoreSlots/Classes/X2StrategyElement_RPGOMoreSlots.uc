class X2StrategyElement_RPGOMoreSlots extends CHItemSlotSet config (RPGOMoreSlots);

var localized string strSlotLetter_TechGadget;
var localized string strSlotLetter_WristGadget;
var localized string strSlotLetter_HeavyGadget;

var config array<name> AbilityUnlocksSlot_TechGadget;
var config array<name> AbilityUnlocksSlot_WristGadget;
var config array<name> AbilityUnlocksSlot_HeavyGadget;

var config array<name> AllowedItemCategories_TechGadget;
var config array<name> AllowedItemCategories_WristGadget;
var config array<name> AllowedItemCategories_HeavyGadget;

var config array<name> AllowedSoldierClasses_TechGadget;
var config array<name> AllowedSoldierClasses_WristGadget;
var config array<name> AllowedSoldierClasses_HeavyGadget;

var config array<name> AllowedCharacterTemplates_TechGadget;
var config array<name> AllowedCharacterTemplates_WristGadget;
var config array<name> AllowedCharacterTemplates_HeavyGadget;

var config bool bAllowEmpty_TechGadget;
var config bool bAllowEmpty_WristGadget;
var config bool bAllowEmpty_HeavyGadget;

var config bool bLog;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	Templates.AddItem(CreateSlotTemplate('TechGadget'));
	Templates.AddItem(CreateSlotTemplate('WristGadget'));
	Templates.AddItem(CreateSlotTemplate('HeavyGadget'));
	return Templates;
}

static function X2DataTemplate CreateSlotTemplate(name slot)
{
	local CHItemSlot template;

	`CREATE_X2TEMPLATE(class'CHItemSlot', template, slot);

	switch(slot) {
		case 'TechGadget':
			template.InvSlot = eInvSlot_TacticalGadget;
			template.SlotCatMask = template.SLOT_WEAPON;
			// Unused for now
			template.IsUserEquipSlot = true;
			// Uses unique rule
			template.IsEquippedSlot = true;
			// Does not bypass unique rule
			template.BypassesUniqueRule = false;
			template.IsMultiItemSlot = false;
			template.IsSmallSlot = true;

			template.CanAddItemToSlotFn = CanAddItemToSlot_TechGadget;
			template.UnitHasSlotFn = HasSlot_TechGadget;
			template.GetPriorityFn = GetPriority;
			template.GetDisplayLetterFn = GetDisplayLetter_TechGadget;
			template.ShowItemInLockerListFn = ShowItemInLockerList_TechGadget;
			template.ValidateLoadoutFn = ValidateLoadout_TechGadget;
			template.GetSlotUnequipBehaviorFn = GetUnequipBehavior_TechGadget;
			break;
		case 'WristGadget':
			template.InvSlot = eInvSlot_PrimaryPayload;
			template.SlotCatMask = template.SLOT_WEAPON;
			// Unused for now
			template.IsUserEquipSlot = true;
			// Uses unique rule
			template.IsEquippedSlot = true;
			// Does not bypass unique rule
			template.BypassesUniqueRule = false;
			template.IsMultiItemSlot = false;
			template.IsSmallSlot = true;

			template.CanAddItemToSlotFn = CanAddItemToSlot_WristGadget;
			template.UnitHasSlotFn = HasSlot_WristGadget;
			template.GetPriorityFn = GetPriority;
			template.GetDisplayLetterFn = GetDisplayLetter_WristGadget;
			template.ShowItemInLockerListFn = ShowItemInLockerList_WristGadget;
			template.ValidateLoadoutFn = ValidateLoadout_WristGadget;
			template.GetSlotUnequipBehaviorFn = GetUnequipBehavior_WristGadget;
			break;
		case 'HeavyGadget':
			template.InvSlot = eInvSlot_SecondaryPayload;
			template.SlotCatMask = template.SLOT_WEAPON;
			// Unused for now
			template.IsUserEquipSlot = true;
			// Uses unique rule
			template.IsEquippedSlot = true;
			// Does not bypass unique rule
			template.BypassesUniqueRule = false;
			template.IsMultiItemSlot = false;
			template.IsSmallSlot = true;

			template.CanAddItemToSlotFn = CanAddItemToSlot_HeavyGadget;
			template.UnitHasSlotFn = HasSlot_HeavyGadget;
			template.GetPriorityFn = GetPriority;
			template.GetDisplayLetterFn = GetDisplayLetter_HeavyGadget;
			template.ShowItemInLockerListFn = ShowItemInLockerList_HeavyGadget;
			template.ValidateLoadoutFn = ValidateLoadout_HeavyGadget;
			template.GetSlotUnequipBehaviorFn = GetUnequipBehavior_HeavyGadget;
			break;
		default:
//			`LOG('Unsupported slot: ' @ slot, default.bLog, 'RPGOMoreSlots');
	}

	return template;
}

static function string GetDisplayLetter_TechGadget(CHItemSlot Slot)
{
	return default.strSlotLetter_TechGadget;
}

static function string GetDisplayLetter_WristGadget(CHItemSlot Slot)
{
	return default.strSlotLetter_WristGadget;
}

static function string GetDisplayLetter_HeavyGadget(CHItemSlot Slot)
{
	return default.strSlotLetter_HeavyGadget;
}

static function bool CanAddItemToSlot_TechGadget(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	return CanAddItemToSlot(default.AllowedItemCategories_TechGadget, Slot, Unit, Template, CheckGameState, Quantity, ItemState);
}

static function bool CanAddItemToSlot_WristGadget(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	return CanAddItemToSlot(default.AllowedItemCategories_WristGadget, Slot, Unit, Template, CheckGameState, Quantity, ItemState);
}

static function bool CanAddItemToSlot_HeavyGadget(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	return CanAddItemToSlot(default.AllowedItemCategories_HeavyGadget, Slot, Unit, Template, CheckGameState, Quantity, ItemState);
}

static function bool CanAddItemToSlot(array<name> AllowedItemCategories, CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	local string strDummy;

	if (!Slot.UnitHasSlot(Unit, strDummy, CheckGameState) || Unit.GetItemInSlot(Slot.InvSlot, CheckGameState) != none)
	{
		`LOG(Unit.GetFullName() @ "can NOT add item to Slot:" @ Template.FriendlyName @ Template.DataName @ ", because unit does not have the Slot:" @ !Slot.UnitHasSlot(Unit, strDummy, CheckGameState) @ "or" @ "the Slot is already occupied:" @ Unit.GetItemInSlot(Slot.InvSlot, CheckGameState) != none, default.bLog, 'RPGOMoreSlots');
		return false;
	}
	if (AllowedItemCategories.Find(Template.ItemCat) != INDEX_NONE)
	{
		`LOG(Unit.GetFullName() @ "can add item to Slot:" @ Template.FriendlyName @ Template.DataName @ ", because it has a matching Item Category:" @ Template.ItemCat, default.bLog, 'RPGOMoreSlots');
		return true;
	}
}

static function bool HasSlot_TechGadget(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState) {
	return HasSlot(default.AllowedSoldierClasses_TechGadget, default.AllowedCharacterTemplates_TechGadget, default.AbilityUnlocksSlot_TechGadget, Slot, UnitSTate, LockedReason, CheckGameState);
}

static function bool HasSlot_WristGadget(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState) {
	return HasSlot(default.AllowedSoldierClasses_WristGadget, default.AllowedCharacterTemplates_WristGadget, default.AbilityUnlocksSlot_WristGadget, Slot, UnitSTate, LockedReason, CheckGameState);
}

static function bool HasSlot_HeavyGadget(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState) {
	return HasSlot(default.AllowedSoldierClasses_HeavyGadget, default.AllowedCharacterTemplates_HeavyGadget, default.AbilityUnlocksSlot_HeavyGadget, Slot, UnitSTate, LockedReason, CheckGameState);
}

static function bool HasSlot(array<name> SoldierClassArray, array<name> AllowedCharacterTemplates, array<name> AbilityUnlocksSlot, CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState)
{
	local name Ability;
	local X2EquipmentTemplate EquipmentTemplate;
	local array<XComGameState_Item> CurrentInventory;
	local XComGameState_Item InventoryItem;

	//	Check for whitelisted soldier classes first.
	if (SoldierClassArray.Find(UnitState.GetSoldierClassTemplateName()) != INDEX_NONE)
	{
		`LOG(UnitState.GetFullName() @ "has Slot, because they have a matching Soldier Class:" @ UnitState.GetSoldierClassTemplateName(), default.bLog, 'RPGOMoreSlots');
		return true;
	}
	//	Then check whitelisted character templates. Can come in handy if there are any robotic soldier classes.
	if (AllowedCharacterTemplates.Find(UnitState.GetMyTemplateName()) != INDEX_NONE)
	{	
		`LOG(UnitState.GetFullName() @ "has Slot, because they have a matching Character Template Name:" @ UnitState.GetMyTemplateName(), default.bLog, 'RPGOMoreSlots');
		return true;
	}
	//	If there is no soldier class match, check if there are any entries in the config array for abilities that unlock the Slot.
	if (AbilityUnlocksSlot.Length != 0)
	{
		foreach AbilityUnlocksSlot(Ability)
		{
			if (UnitState.HasSoldierAbility(Ability, true))
			{
				`LOG(UnitState.GetFullName() @ "has Slot, because they have a matching Ability:" @ Ability, default.bLog, 'RPGOMoreSlots');
				return true;
			}
		}

		CurrentInventory = UnitState.GetAllInventoryItems(CheckGameState);
		foreach CurrentInventory(InventoryItem)
		{
			EquipmentTemplate = X2EquipmentTemplate(InventoryItem.GetMyTemplate());
			if (EquipmentTemplate != none)
			{
				foreach EquipmentTemplate.Abilities(Ability)
				{
					if (AbilityUnlocksSlot.Find(Ability) != INDEX_NONE)
					{
						`LOG(UnitState.GetFullName() @ "has Slot, because they have a matching Ability:" @ Ability @ "on an equipped Item:" @ EquipmentTemplate.DataName @ "in slot:" @ InventoryItem.InventorySlot, default.bLog, 'RPGOMoreSlots');
						return true;
					}
				}
			}
		}

		//	If the config array has at least one ability, we do not add the slot to all soldiers.
		`LOG(UnitState.GetFullName() @ "does not have Slot, because they do not have any abilities from the configured list.", default.bLog, 'RPGOMoreSlots');
		return false;

	}	//	If there are no entries in the ability config array, allow the Slot for all non-robotic soldiers.
	else if(UnitState.IsSoldier() && !UnitState.IsRobotic())
	{
		`LOG(UnitState.GetFullName() @ "has Slot, because they are a non-robotic soldier.", default.bLog, 'RPGOMoreSlots');
		return true;
	}
	return false;	
}

static function int GetPriority(CHItemSlot Slot, XComGameState_Unit UnitState, optional XComGameState CheckGameState)
{
	return 120; // Ammo Pocket is 110 
}

static function bool ShowItemInLockerList_TechGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	`LOG("ShowItemInLockerList_TechGadget.length:" @ default.AllowedItemCategories_TechGadget.length, true, 'RPGOMoreSlots');
	return ShowItemInLockerList(default.AllowedItemCategories_TechGadget, Slot, Unit, ItemState, ItemTemplate, CheckGameState);
}

static function bool ShowItemInLockerList_WristGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	`LOG("ShowItemInLockerList_WristGadget.length:" @ default.AllowedItemCategories_WristGadget.length, true, 'RPGOMoreSlots');
	return ShowItemInLockerList(default.AllowedItemCategories_WristGadget, Slot, Unit, ItemState, ItemTemplate, CheckGameState);
}

static function bool ShowItemInLockerList_HeavyGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	`LOG("ShowItemInLockerList_HeavyGadget.length:" @ default.AllowedItemCategories_HeavyGadget.length, true, 'RPGOMoreSlots');
	return ShowItemInLockerList(default.AllowedItemCategories_HeavyGadget, Slot, Unit, ItemState, ItemTemplate, CheckGameState);
}

static function bool ShowItemInLockerList(array<name> AllowedItemCategories, CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	local X2WeaponTemplate WeaponTemplate;
	local name ItemCatStr;
	`LOG("ShowItemInLockerList item:" @ ItemTemplate.FriendlyName, true, 'RPGOMoreSlots');
	`LOG("ShowItemInLockerList item is of ItemCat:" @ ItemTemplate.ItemCat, true, 'RPGOMoreSlots');
	`LOG("ShowItemInLockerList AllowedItemCategories.length:" @ AllowedItemCategories.length, true, 'RPGOMoreSlots');
	foreach AllowedItemCategories(ItemCatStr) {
		`LOG("ShowItemInLockerList foreach AllowedItemCategories:" @ ItemCatStr, true, 'RPGOMoreSlots');
	}

	if (ItemTemplate.IsA('X2WeaponTemplate'))
	{
		WeaponTemplate = X2WeaponTemplate(ItemTemplate);
		`LOG("ShowItemInLockerList is a weapon of WeaponCat:" @ WeaponTemplate.WeaponCat, true, 'RPGOMoreSlots');
		return AllowedItemCategories.Find(WeaponTemplate.WeaponCat) != INDEX_NONE;
	}
	else
	{
		return AllowedItemCategories.Find(ItemTemplate.ItemCat) != INDEX_NONE;
	}
}

static function ValidateLoadout_TechGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState)
{
	ValidateLoadout(default.bAllowEmpty_TechGadget, default.AllowedItemCategories_TechGadget, eInvSlot_TacticalGadget, Slot, Unit, XComHQ, NewGameState);
}

static function ValidateLoadout_WristGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState)
{
	ValidateLoadout(default.bAllowEmpty_WristGadget, default.AllowedItemCategories_WristGadget, eInvSlot_PrimaryPayload, Slot, Unit, XComHQ, NewGameState);
}

static function ValidateLoadout_HeavyGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState)
{
	ValidateLoadout(default.bAllowEmpty_HeavyGadget, default.AllowedItemCategories_HeavyGadget, eInvSlot_SecondaryPayload, Slot, Unit, XComHQ, NewGameState);
}

static function ValidateLoadout(bool AllowEmpty, array<name> AllowedItemCategories, EInventorySlot InventorySlot, CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState)
{
	local XComGameState_Item EquippedItem;
	local string strDummy;
	local bool HasSlot;
	EquippedItem = Unit.GetItemInSlot(Slot.InvSlot, NewGameState);
	HasSlot = Slot.UnitHasSlot(Unit, strDummy, NewGameState);

	`LOG(Unit.GetFullName() @ "validating Slot. Unit has slot:" @ HasSlot @ EquippedItem == none ? ", slot is empty." : ", slot contains item:" @ EquippedItem.GetMyTemplateName(), default.bLog, 'RPGOMoreSlots');

	if(EquippedItem == none && HasSlot && !AllowEmpty)
	{
		EquippedItem = FindBestItem(Unit, XComHQ, NewGameState, AllowedItemCategories, InventorySlot);
		if (EquippedItem != none)
		{
			`LOG("Empty slot is not allowed, equipping:" @ EquippedItem.GetMyTemplateName(), default.bLog, 'RPGOMoreSlots');
			Unit.AddItemToInventory(EquippedItem, InventorySlot, NewGameState);
		}
		else `LOG("Empty slot is not allowed, but the mod was unable to find an infinite item to fill the slot.", default.bLog, 'RPGOMoreSlots');
	}
	else if(EquippedItem != none && !HasSlot)
	{
		`LOG("WARNING Unit has an item equipped in the Slot, but they do not have the Slot. Unequipping the item and putting it into HQ Inventory.", default.bLog, 'RPGOMoreSlots');
		EquippedItem = XComGameState_Item(NewGameState.ModifyStateObject(class'XComGameState_Item', EquippedItem.ObjectID));
		Unit.RemoveItemFromInventory(EquippedItem, NewGameState);
		XComHQ.PutItemInInventory(NewGameState, EquippedItem);
		EquippedItem = none;
	}
}

private static function XComGameState_Item FindBestItem(const XComGameState_Unit UnitState, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState, array<name> AllowedItemCategories, EInventorySlot InventorySlot)
{
	local X2EquipmentTemplate				EquipmentTemplate;
	local XComGameStateHistory				History;
	local int								HighestTier;
	local XComGameState_Item				ItemState;
	local XComGameState_Item				BestItemState;
	local StateObjectReference				ItemRef;

	HighestTier = -999;
	History = `XCOMHISTORY;

	//	Cycle through all items in HQ Inventory
	foreach XComHQ.Inventory(ItemRef)
	{
		ItemState = XComGameState_Item(History.GetGameStateForObjectID(ItemRef.ObjectID));
		if (ItemState != none)
		{
			EquipmentTemplate = X2EquipmentTemplate(ItemState.GetMyTemplate());

			if (EquipmentTemplate != none &&	//	If this is an equippable item
				AllowedItemCategories.Find(EquipmentTemplate.ItemCat) != INDEX_NONE &&	//	That has a matching Item Category
				EquipmentTemplate.bInfiniteItem && EquipmentTemplate.Tier > HighestTier &&		//	And is of higher Tier than previously found items
				UnitState.CanAddItemToInventory(EquipmentTemplate, InventorySlot, NewGameState, ItemState.Quantity, ItemState))	//	And can be equipped on the soldier
			{
				//	Remember this item as the currently best replacement option.
				HighestTier = EquipmentTemplate.Tier;
				BestItemState = ItemState;
			}
		}
	}

	if (BestItemState != none)
	{
		//	This will set up the Item State for modification automatically, or create a new Item State in the NewGameState if the template is infinite.
		XComHQ.GetItemFromInventory(NewGameState, BestItemState.GetReference(), BestItemState);
		return BestItemState;
	}
	else
	{
		return none;
	}
}

function ECHSlotUnequipBehavior GetUnequipBehavior_TechGadget(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState) {
	return GetUnequipBehavior(default.bAllowEmpty_TechGadget, Slot, DefaultBehavior, Unit, ItemState, CheckGameState);
}

function ECHSlotUnequipBehavior GetUnequipBehavior_WristGadget(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState) {
	return GetUnequipBehavior(default.bAllowEmpty_WristGadget, Slot, DefaultBehavior, Unit, ItemState, CheckGameState);
}

function ECHSlotUnequipBehavior GetUnequipBehavior_HeavyGadget(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState) {
	return GetUnequipBehavior(default.bAllowEmpty_HeavyGadget, Slot, DefaultBehavior, Unit, ItemState, CheckGameState);
}

function ECHSlotUnequipBehavior GetUnequipBehavior(bool AllowEmpty, CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState)
{	
	if (AllowEmpty)
	{
		return eCHSUB_AllowEmpty;
	}
	else
	{
		return eCHSUB_AttemptReEquip;
	}
}