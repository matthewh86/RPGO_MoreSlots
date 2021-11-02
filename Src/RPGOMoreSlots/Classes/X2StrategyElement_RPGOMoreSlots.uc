class X2StrategyElement_RPGOMoreSlots extends CHItemSlotSet config (VestSlot);

var localized string slotLetter_Ammo;
var localized string slotLetter_Vest;
var localized string slotLetter_TechGadget;
var localized string slotLetter_PsiGadget;
var localized string slotLetter_WristGadget;
var localized string slotLetter_HeavyGadget;

var config array<name> AbilityUnlocksSlot_Ammo;
var config array<name> AbilityUnlocksSlot_Vest;
var config array<name> AbilityUnlocksSlot_TechGadget;
var config array<name> AbilityUnlocksSlot_PsiGadget;
var config array<name> AbilityUnlocksSlot_WristGadget;
var config array<name> AbilityUnlocksSlot_HeavyGadget;

var config array<name> AllowedItemCategories_Ammo;
var config array<name> AllowedItemCategories_Vest;
var config array<name> AllowedItemCategories_TechGadget;
var config array<name> AllowedItemCategories_PsiGadget;
var config array<name> AllowedItemCategories_WristGadget;
var config array<name> AllowedItemCategories_HeavyGadget;

var config array<name> AllowedSoldierClasses_Ammo;
var config array<name> AllowedSoldierClasses_Vest;
var config array<name> AllowedSoldierClasses_TechGadget;
var config array<name> AllowedSoldierClasses_PsiGadget;
var config array<name> AllowedSoldierClasses_WristGadget;
var config array<name> AllowedSoldierClasses_HeavyGadget;

var config array<name> AllowedCharacterTemplates_Ammo;
var config array<name> AllowedCharacterTemplates_Vest;
var config array<name> AllowedCharacterTemplates_TechGadget;
var config array<name> AllowedCharacterTemplates_PsiGadget;
var config array<name> AllowedCharacterTemplates_WristGadget;
var config array<name> AllowedCharacterTemplates_HeavyGadget;

var config bool bAllowEmpty_Ammo;
var config bool bAllowEmpty_Vest;
var config bool bAllowEmpty_TechGadget;
var config bool bAllowEmpty_PsiGadget;
var config bool bAllowEmpty_WristGadget;
var config bool bAllowEmpty_HeavyGadget;

var config bool bLog;

static enum SlotType

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	Templates.AddItem(CreateSlotTemplate('Ammo');
	Templates.AddItem(CreateSlotTemplate('Vest');
	Templates.AddItem(CreateSlotTemplate('TechGadget');
	Templates.AddItem(CreateSlotTemplate('PsiGadget');
	Templates.AddItem(CreateSlotTemplate('WristGadget');
	Templates.AddItem(CreateSlotTemplate('HeavyGadget');
	return Templates;
}

static function X2DataTemplate CreateSlotTemplate(string slot)
{
	local CHItemSlot template;

	`CREATE_X2TEMPLATE(class'CHItemSlot', template, slot);

	switch(slot) {
		case 'Ammo':
			template.InvSlot = eInvSlot_Ammo;
			template.SlotCatMask = CHItemSlot.SLOT_ITEM;
			// Unused for now
			template.IsUserEquipSlot = true;
			// Uses unique rule
			template.IsEquippedSlot = true;
			// Does not bypass unique rule
			template.BypassesUniqueRule = false;
			template.IsMultiItemSlot = false;
			template.IsSmallSlot = true;

			template.CanAddItemToSlotFn = CanAddItemToSlot_Ammo;
			template.UnitHasSlotFn = HasSlot_Ammo;
			template.GetPriorityFn = GetPriority;
			template.GetDisplayLetter = default.slotLetter_Ammo;
			template.ShowItemInLockerListFn = ShowItemInLockerList_Ammo;
			template.ValidateLoadoutFn = ValidateLoadout_Ammo;
			template.GetSlotUnequipBehaviorFn = GetUnequipBehavior_Ammo;
			break;
		case: 'Vest':
			template.InvSlot = eInvSlot_Vest;
			template.SlotCatMask = CHItemSlot.SLOT_ITEM;
			// Unused for now
			template.IsUserEquipSlot = true;
			// Uses unique rule
			template.IsEquippedSlot = true;
			// Does not bypass unique rule
			template.BypassesUniqueRule = false;
			template.IsMultiItemSlot = false;
			template.IsSmallSlot = true;

			template.CanAddItemToSlotFn = CanAddItemToSlot_Vest;
			template.UnitHasSlotFn = HasSlot_Vest;
			template.GetPriorityFn = GetPriority;
			template.GetDisplayLetter = default.slotLetter_Vest;
			template.ShowItemInLockerListFn = ShowItemInLockerList_Vest;
			template.ValidateLoadoutFn = ValidateLoadout_Vest;
			template.GetSlotUnequipBehaviorFn = GetUnequipBehavior_Vest;
			break;
		case: 'TechGadget':
			template.InvSlot = eInvSlot_TechGadget;
			template.SlotCatMask = CHItemSlot.SLOT_WEAPON;
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
			template.GetDisplayLetter = default.slotLetter_TechGadget;
			template.ShowItemInLockerListFn = ShowItemInLockerList_TechGadget;
			template.ValidateLoadoutFn = ValidateLoadout_TechGadget;
			template.GetSlotUnequipBehaviorFn = GetUnequipBehavior_TechGadget;
			break;
		case: 'PsiGadget':
			template.InvSlot = eInvSlot_PsiGadget;
			template.SlotCatMask = CHItemSlot.SLOT_WEAPON;
			// Unused for now
			template.IsUserEquipSlot = true;
			// Uses unique rule
			template.IsEquippedSlot = true;
			// Does not bypass unique rule
			template.BypassesUniqueRule = false;
			template.IsMultiItemSlot = false;
			template.IsSmallSlot = true;

			template.CanAddItemToSlotFn = CanAddItemToSlot_PsiGadget;
			template.UnitHasSlotFn = HasSlot_PsiGadget;
			template.GetPriorityFn = GetPriority;
			template.GetDisplayLetter = default.slotLetter_PsiGadget;
			template.ShowItemInLockerListFn = ShowItemInLockerList_PsiGadget;
			template.ValidateLoadoutFn = ValidateLoadout_PsiGadget;
			template.GetSlotUnequipBehaviorFn = GetUnequipBehavior_PsiGadget;
			break;
		case: 'WristGadget':
			template.InvSlot = eInvSlot_WristGadget;
			template.SlotCatMask = CHItemSlot.SLOT_WEAPON;
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
			template.GetDisplayLetter = default.slotLetter_WristGadget;
			template.ShowItemInLockerListFn = ShowItemInLockerList_WristGadget;
			template.ValidateLoadoutFn = ValidateLoadout_WristGadget;
			template.GetSlotUnequipBehaviorFn = GetUnequipBehavior_WristGadget;
			break;
		case: 'HeavyGadget':
			template.InvSlot = eInvSlot_HeavyGadget;
			template.SlotCatMask = CHItemSlot.SLOT_WEAPON;
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
			template.GetDisplayLetter = default.slotLetter_HeavyGadget;
			template.ShowItemInLockerListFn = ShowItemInLockerList_HeavyGadget;
			template.ValidateLoadoutFn = ValidateLoadout_HeavyGadget;
			template.GetSlotUnequipBehaviorFn = GetUnequipBehavior_HeavyGadget;
			break;
		default:
			`LOG('Unsupported slot: ' @ slot, default.bLog, 'RPGOMoreSlots');
	}

	return template;
}

static function bool CanAddItemToSlot_Ammo(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	return CanAddItemToSlot(Slot, Unit, Template, CheckGameState, Quantity, ItemState, default.AllowedItemCategories_Ammo);
}

static function bool CanAddItemToSlot_Vest(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	return CanAddItemToSlot(Slot, Unit, Template, CheckGameState, Quantity, ItemState, default.AllowedItemCategories_Vest);
}

static function bool CanAddItemToSlot_TechGadget(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	return CanAddItemToSlot(Slot, Unit, Template, CheckGameState, Quantity, ItemState, default.AllowedItemCategories_TechGadget);
}

static function bool CanAddItemToSlot_PsiGadget(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	return CanAddItemToSlot(Slot, Unit, Template, CheckGameState, Quantity, ItemState, default.AllowedItemCategories_PsiGadget);
}

static function bool CanAddItemToSlot_WristGadget(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	return CanAddItemToSlot(Slot, Unit, Template, CheckGameState, Quantity, ItemState, default.AllowedItemCategories_WristGadget);
}

static function bool CanAddItemToSlot_HeavyGadget(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState)
{
	return CanAddItemToSlot(Slot, Unit, Template, CheckGameState, Quantity, ItemState, default.AllowedItemCategories_HeavyGadget);
}

static function bool CanAddItemToSlot(CHItemSlot Slot, XComGameState_Unit Unit, X2ItemTemplate Template, optional XComGameState CheckGameState, optional int Quantity = 1, optional XComGameState_Item ItemState, array<name> AllowedItemCategories)
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

static function bool HasSlot_Ammo(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState) {
	return HasSlot(Slot, UnitSTate, LockedReason, CheckGameState, default.AllowedSoldierClasses_Ammo, default.AllowedCharacterTemplates_Ammo, default.AbilityUnlocksSlot_Ammo);
}

static function bool HasSlot_Vest(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState) {
	return HasSlot(Slot, UnitSTate, LockedReason, CheckGameState, default.AllowedSoldierClasses_Vest, default.AllowedCharacterTemplates_Vest, default.AbilityUnlocksSlot_Vest);
}

static function bool HasSlot_TechGadget(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState) {
	return HasSlot(Slot, UnitSTate, LockedReason, CheckGameState, default.AllowedSoldierClasses_TechGadget, default.AllowedCharacterTemplates_TechGadget, default.AbilityUnlocksSlot_TechGadget);
}

static function bool HasSlot_PsiGadget(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState) {
	return HasSlot(Slot, UnitSTate, LockedReason, CheckGameState, default.AllowedSoldierClasses_PsiGadget, default.AllowedCharacterTemplates_PsiGadget, default.AbilityUnlocksSlot_PsiGadget);
}

static function bool HasSlot_WristGadget(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState) {
	return HasSlot(Slot, UnitSTate, LockedReason, CheckGameState, default.AllowedSoldierClasses_WristGadget, default.AllowedCharacterTemplates_WristGadget, default.AbilityUnlocksSlot_WristGadget);
}

static function bool HasSlot_HeavyGadget(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState) {
	return HasSlot(Slot, UnitSTate, LockedReason, CheckGameState, default.AllowedSoldierClasses_HeavyGadget, default.AllowedCharacterTemplates_HeavyGadget, default.AbilityUnlocksSlot_HeavyGadget);
}

static function bool HasSlot(CHItemSlot Slot, XComGameState_Unit UnitState, out string LockedReason, optional XComGameState CheckGameState, array<name> SoldierClassArray, array<name> AllowedCharacterTemplates, array<name> AbilityUnlocksSlot)
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
					if (default.AbilityUnlocksSlot.Find(Ability) != INDEX_NONE)
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

static function bool ShowItemInLockerList_Ammo(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	return ShowItemInLockerList(Slot, Unit, ItemState, ItemTemplate, default.AllowedItemCategories_Ammo);
}

static function bool ShowItemInLockerList_Vest(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	return ShowItemInLockerList(Slot, Unit, ItemState, ItemTemplate, default.AllowedItemCategories_Vest);
}

static function bool ShowItemInLockerList_TechGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	return ShowItemInLockerList(Slot, Unit, ItemState, ItemTemplate, default.AllowedItemCategories_TechGadget);
}

static function bool ShowItemInLockerList_PsiGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	return ShowItemInLockerList(Slot, Unit, ItemState, ItemTemplate, default.AllowedItemCategories_PsiGadget);
}

static function bool ShowItemInLockerList_WristGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	return ShowItemInLockerList(Slot, Unit, ItemState, ItemTemplate, default.AllowedItemCategories_WristGadget);
}

static function bool ShowItemInLockerList_HeavyGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_Item ItemState, X2ItemTemplate ItemTemplate, XComGameState CheckGameState)
{
	return ShowItemInLockerList(Slot, Unit, ItemState, ItemTemplate, default.AllowedItemCategories_HeavyGadget);
}

static function ValidateLoadout_Ammo(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState) {
	return ValidateLoadout(Slot, Unit, XComHQ, NewGameState, default.bAllowEmpty_Ammo, eInvSlot_Ammo);
}

static function ValidateLoadout_Vest(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState) {
	return ValidateLoadout(Slot, Unit, XComHQ, NewGameState, default.bAllowEmpty_Vest, eInvSlot_Vest);
}

static function ValidateLoadout_TechGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState) {
	return ValidateLoadout(Slot, Unit, XComHQ, NewGameState, default.bAllowEmpty_TechGadget, eInvSlot_TechGadget);
}

static function ValidateLoadout_PsiGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState) {
	return ValidateLoadout(Slot, Unit, XComHQ, NewGameState, default.bAllowEmpty_PsiGadget, eInvSlot_PsiGadget);
}

static function ValidateLoadout_WristGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState) {
	return ValidateLoadout(Slot, Unit, XComHQ, NewGameState, default.bAllowEmpty_WristGadget, eInvSlot_WristGadget);
}

static function ValidateLoadout_HeavyGadget(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState) {
	return ValidateLoadout(Slot, Unit, XComHQ, NewGameState, default.bAllowEmpty_HeavyGadget, eInvSlot_HeavyGadget);
}

static function ValidateLoadout(CHItemSlot Slot, XComGameState_Unit Unit, XComGameState_HeadquartersXCom XComHQ, XComGameState NewGameState, bool AllowEmpty, array<name> AllowedItemCategories, EInventorySlot InventorySlot)
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

function ECHSlotUnequipBehavior GetUnequipBehavior_Ammo(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState) {
	return GetUnequipBehavior(Slot, DefaultBehavior, Unit, ItemState, CheckGameState, default.bAllowEmpty_Ammo);
}

function ECHSlotUnequipBehavior GetUnequipBehavior_Vest(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState) {
	return GetUnequipBehavior(Slot, DefaultBehavior, Unit, ItemState, CheckGameState, default.bAllowEmpty_Vest);
}

function ECHSlotUnequipBehavior GetUnequipBehavior_TechGadget(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState) {
	return GetUnequipBehavior(Slot, DefaultBehavior, Unit, ItemState, CheckGameState, default.bAllowEmpty_TechGadget);
}

function ECHSlotUnequipBehavior GetUnequipBehavior_PsiGadget(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState) {
	return GetUnequipBehavior(Slot, DefaultBehavior, Unit, ItemState, CheckGameState, default.bAllowEmpty_PsiGadget);
}

function ECHSlotUnequipBehavior GetUnequipBehavior_WristGadget(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState) {
	return GetUnequipBehavior(Slot, DefaultBehavior, Unit, ItemState, CheckGameState, default.bAllowEmpty_WristGadget);
}

function ECHSlotUnequipBehavior GetUnequipBehavior_HeavyGadget(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState) {
	return GetUnequipBehavior(Slot, DefaultBehavior, Unit, ItemState, CheckGameState, default.bAllowEmpty_HeavyGadget);
}

function ECHSlotUnequipBehavior GetUnequipBehavior(CHItemSlot Slot, ECHSlotUnequipBehavior DefaultBehavior, XComGameState_Unit Unit, XComGameState_Item ItemState, optional XComGameState CheckGameState, bool AllowEmpty)
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