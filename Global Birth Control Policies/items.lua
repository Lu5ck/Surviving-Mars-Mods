return {
PlaceObj('ModItemCode', {
	'name', "GlobalBirthControlPolicy",
	'comment', "The one file to change them all",
	'FileName', "Code/GlobalBirthControlPolicy.lua",
}),
PlaceObj('ModItemOptionNumber', {
	'name', "GBCP_MaxChildren",
	'comment', "How many children?",
	'DisplayName', "Maximum Children",
	'Help', "Default is 20",
	'DefaultValue', 20,
	'MaxValue', 500,
}),
PlaceObj('ModItemOptionToggle', {
	'name', "GBCP_Toggle",
	'comment', "Enable or Disable",
	'DisplayName', "Double Click it",
	'Help', "Default is Off",
	'DefaultValue', true,
}),
}
