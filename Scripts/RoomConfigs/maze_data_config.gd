extends Node


@export var door_info: MazeData #true = open, false = closed

#Find player coordinates
const PLAYER = preload("res://Scenes/Player/Player_FreeMove.tscn")
var PlayerPlaced: bool = false
var PlayerCoords: Vector2
var temp_GetRidOfMe

#Determine if Doors are placed or not
const DOOR = preload("res://Scenes/Enviornment/MazeRooms/Doors.tscn")
var DoorExit:   bool = false #true = placed, false = not placed
var DoorOne:    bool = false #true = placed, false = not placed
var DoorTwo:    bool = false #true = placed, false = not placed
var DoorThree:  bool = false #true = placed, false = not placed
var DoorFour:   bool = false #true = placed, false = not placed
var DoorFive:   bool = false #true = placed, false = not placed
var DoorSix:    bool = false #true = placed, false = not placed
var DoorSeven:  bool = false #true = placed, false = not placed
var DoorEight:  bool = false #true = placed, false = not placed
var DoorNine:   bool = false #true = placed, false = not placed
var DoorTen:    bool = false #true = placed, false = not placed
var DoorEleven: bool = false #true = placed, false = not placed
var DoorTwelve: bool = false #true = placed, false = not placed
#Determine if Stairs are placed or not
const STAIR = preload("res://Scenes/Enviornment/MazeRooms/Stairs.tscn")
var StairExit:   bool = false #true = placed, false = not placed
var StairOne:    bool = false #true = placed, false = not placed
var StairTwo:    bool = false #true = placed, false = not placed
var StairThree:  bool = false #true = placed, false = not placed
var StairFour:   bool = false #true = placed, false = not placed
var StairFive:   bool = false #true = placed, false = not placed
var StairSix:    bool = false #true = placed, false = not placed
var StairSeven:  bool = false #true = placed, false = not placed
var StairEight:  bool = false #true = placed, false = not placed
var StairNine:   bool = false #true = placed, false = not placed
var StairTen:    bool = false #true = placed, false = not placed
var StairEleven: bool = false #true = placed, false = not placed
var StairTwelve: bool = false #true = placed, false = not placed

#func _ready() -> void:
	#pass
	##print(self.get_parent().get_children())
	##print(SaveManager.load_data(SaveManager.Save1))
	##THIS WILL BE WHERE I LOAD IN SAVED LOCATIONS FOR ALL STAIR OBJECTS
	##AND SAVED DATA ON DOOR OBJECTS BEING EITHER OPENED OR CLOSED
	#
	##SAVE STUFF:
	##	door_info.Keys["Number"] = true or false
	##	


func PlacePlayer(player_loc: Vector2):
	var new_player = PLAYER.instantiate()
	new_player.position = player_loc
	get_parent().add_child(new_player)

func PlaceDoor(door_name: String, door_loc: String, door_dir: String, door_num: String):
	var new_door = DOOR.instantiate()
	new_door.name = door_name
	new_door.position = Vector2(new_door.DoorLocs[door_loc]["x"],new_door.DoorLocs[door_loc]["y"])
	new_door.DoorDirection = door_dir
	new_door.DoorNumber = door_num
	get_parent().add_child(new_door)
func PlaceMultiDoor(door_name: String, door_loc: String, which_door: String, door_dir: String, door_num: String):
	var new_door = DOOR.instantiate()
	new_door.name = door_name
	new_door.position = Vector2(new_door.DoorLocs[door_loc][which_door]["x"],new_door.DoorLocs[door_loc][which_door]["y"])
	new_door.DoorDirection = door_dir
	new_door.DoorNumber = door_num
	get_parent().add_child(new_door)

func PlaceStair(stair_name: String, stair_loc: String, stair_num: String):
	var new_stair = STAIR.instantiate()
	new_stair.name = stair_name
	if new_stair.StairLocs[stair_loc]["PickLoc"] == 1:
		new_stair.position = Vector2(new_stair.StairLocs[stair_loc]["Loc1"]["x"],new_stair.StairLocs[stair_loc]["Loc1"]["y"])
		new_stair.StairDirection = new_stair.StairLocs[stair_loc]["Loc1"]["StairDir"]
		new_stair.RoomSpotChoice = 1 #REFERENCE THIS FOR SAVING PURPOSES
		SaveFileTracker.StairCoords[stair_loc] = "Loc1"
	elif new_stair.StairLocs[stair_loc]["PickLoc"] == 2:
		new_stair.position = Vector2(new_stair.StairLocs[stair_loc]["Loc2"]["x"],new_stair.StairLocs[stair_loc]["Loc2"]["y"])
		new_stair.StairDirection = new_stair.StairLocs[stair_loc]["Loc2"]["StairDir"]
		new_stair.RoomSpotChoice = 2 #REFERENCE THIS FOR SAVING PURPOSES
		SaveFileTracker.StairCoords[stair_loc] = "Loc2"
	elif new_stair.StairLocs[stair_loc]["PickLoc"] == 3:
		new_stair.position = Vector2(new_stair.StairLocs[stair_loc]["Loc3"]["x"],new_stair.StairLocs[stair_loc]["Loc3"]["y"])
		new_stair.StairDirection = new_stair.StairLocs[stair_loc]["Loc3"]["StairDir"]
		new_stair.RoomSpotChoice = 3 #REFERENCE THIS FOR SAVING PURPOSES
		SaveFileTracker.StairCoords[stair_loc] = "Loc3"
	new_stair.StairNumber = stair_num
	new_stair.GoToLevel = new_stair.StairLocs[stair_loc]["Level"]
	get_parent().add_child(new_stair)
func ReplaceStair(stair_name: String, stair_loc: String, stair_num: String):
	var old_stair = STAIR.instantiate()
	old_stair.name = stair_name
	if SaveFileTracker.StairCoords[stair_loc] == "Loc1":
		old_stair.position = Vector2(old_stair.StairLocs[stair_loc]["Loc1"]["x"],old_stair.StairLocs[stair_loc]["Loc1"]["y"])
		old_stair.StairDirection = old_stair.StairLocs[stair_loc]["Loc1"]["StairDir"]
		old_stair.RoomSpotChoice = 1 #REFERENCE THIS FOR SAVING PURPOSES
	elif SaveFileTracker.StairCoords[stair_loc] == "Loc2":
		old_stair.position = Vector2(old_stair.StairLocs[stair_loc]["Loc2"]["x"],old_stair.StairLocs[stair_loc]["Loc2"]["y"])
		old_stair.StairDirection = old_stair.StairLocs[stair_loc]["Loc2"]["StairDir"]
		old_stair.RoomSpotChoice = 2 #REFERENCE THIS FOR SAVING PURPOSES
	elif SaveFileTracker.StairCoords[stair_loc] == "Loc3":
		old_stair.position = Vector2(old_stair.StairLocs[stair_loc]["Loc3"]["x"],old_stair.StairLocs[stair_loc]["Loc3"]["y"])
		old_stair.StairDirection = old_stair.StairLocs[stair_loc]["Loc3"]["StairDir"]
		old_stair.RoomSpotChoice = 3 #REFERENCE THIS FOR SAVING PURPOSES
	old_stair.StairNumber = stair_num
	old_stair.GoToLevel = old_stair.StairLocs[stair_loc]["Level"]
	get_parent().add_child(old_stair)


func _ready() -> void:
	pass
	#if SaveFileTracker.PlayerCoords_MazeReturn == Vector2(0.0,0.0):
		#PlacePlayer(Vector2(744.0,128.0))
	#else: PlacePlayer(SaveFileTracker.PlayerCoords_MazeReturn)
	#PlacePlayer(Vector2(744.0,128.0))
	#print(get_tree().current_scene.get_children())

func _process(_delta: float) -> void:
	
	if PlayerPlaced == false:
		if SaveFileTracker.PlayerCoords_MazeReturn == Vector2(0.0,0.0):
			PlacePlayer(Vector2(744.0,128.0))
		else: PlacePlayer(SaveFileTracker.PlayerCoords_MazeReturn)
		PlayerPlaced = true
	#var TempDeleteDoor1 = Input.is_action_just_pressed("TempOne")
	#if TempDeleteDoor1:
		#save_data(SaveManager.Save1)
	#var TempDeleteDoor2 = Input.is_action_just_pressed("TempTwo")
	#if TempDeleteDoor2:
		#load_data(SaveManager.Save1)
	#var TempDeleteDoor3 = Input.is_action_just_pressed("TempThree")
	#if TempDeleteDoor3:
		#door_info.Keys["Three"] = true
	#var TempDeleteDoor4 = Input.is_action_just_pressed("TempFour")
	#if TempDeleteDoor4:
		#door_info.Keys["Four"] = true
	
	#print(temp_GetRidOfMe)
	#if self.get_parent().get_node("PlayerFreeMove"):
		##PlayerCoords.x = self.get_parent().get_node("PlayerFreeMove").get
		#print(roundi(self.get_parent().get_node("PlayerFreeMove").transform.origin.x))
	#region Check Maze Doors
	door_info.Keys["Exit"]   = SaveFileTracker.DoorsOpened["DoorExit"]
	door_info.Keys["One"]    = SaveFileTracker.DoorsOpened["DoorOne"]
	door_info.Keys["Two"]    = SaveFileTracker.DoorsOpened["DoorTwo"]
	door_info.Keys["Three"]  = SaveFileTracker.DoorsOpened["DoorThree"]
	door_info.Keys["Four"]   = SaveFileTracker.DoorsOpened["DoorFour"]
	door_info.Keys["Five"]   = SaveFileTracker.DoorsOpened["DoorFive"]
	door_info.Keys["Six"]    = SaveFileTracker.DoorsOpened["DoorSix"]
	door_info.Keys["Seven"]  = SaveFileTracker.DoorsOpened["DoorSeven"]
	door_info.Keys["Eight"]  = SaveFileTracker.DoorsOpened["DoorEight"]
	door_info.Keys["Nine"]   = SaveFileTracker.DoorsOpened["DoorNine"]
	door_info.Keys["Ten"]    = SaveFileTracker.DoorsOpened["DoorTen"]
	door_info.Keys["Eleven"] = SaveFileTracker.DoorsOpened["DoorEleven"]
	door_info.Keys["Twelve"] = SaveFileTracker.DoorsOpened["DoorTwelve"]
	#endregion
	#region Place Maze Doors
	if door_info.Keys["Exit"] == false:
		pass #spawn door
	else: pass #despawn door
	if door_info.Keys["One"] == false: #spawn door One
		if DoorOne == false:
			PlaceDoor("DoorOne", "DoorOneLoc", "Horizontal", "One")
			DoorOne = true
	elif door_info.Keys["One"] == true: #despawn door One
		if DoorOne == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorOne"))
			DoorOne = false
	if door_info.Keys["Two"] == false: #spawn door Two
		if DoorTwo == false:
			PlaceDoor("DoorTwo", "DoorTwoLoc", "Horizontal", "Two")
			DoorTwo = true
	elif door_info.Keys["Two"] == true: #despawn door Two
		if DoorTwo == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorTwo"))
			DoorTwo = false
	if door_info.Keys["Three"] == false: #spawn door Three
		if DoorThree == false:
			PlaceDoor("DoorThree", "DoorThreeLoc", "Horizontal", "Three")
			DoorThree = true
	elif door_info.Keys["Three"] == true: #despawn door Three
		if DoorThree == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorThree"))
			DoorThree = false
	if door_info.Keys["Four"] == false: #spawn door Four
		if DoorFour == false:
			PlaceMultiDoor("DoorFour_One", "DoorFourLoc", "One", "Horizontal", "Four")
			PlaceMultiDoor("DoorFour_Two", "DoorFourLoc", "Two", "Horizontal", "Four")
			DoorFour = true
	elif door_info.Keys["Four"] == true: #despawn door Four
		if DoorFour == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorFour_One"))
			self.get_parent().remove_child(self.get_parent().get_node("DoorFour_Two"))
			DoorFour = false
	if door_info.Keys["Five"] == false: #spawn door Five
		if DoorFive == false:
			PlaceDoor("DoorFive", "DoorFiveLoc", "Vertical", "Five")
			DoorFive = true
	elif door_info.Keys["Five"] == true: #despawn door Five
		if DoorFive == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorFive"))
			DoorFive = false
	if door_info.Keys["Six"] == false: #spawn door Six
		if DoorSix == false:
			PlaceDoor("DoorSix", "DoorSixLoc", "Vertical", "Six")
			DoorSix = true
	elif door_info.Keys["Six"] == true: #despawn door Six
		if DoorSix == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorSix"))
			DoorSix = false
	if door_info.Keys["Seven"] == false: #spawn door Seven
		if DoorSeven == false:
			PlaceMultiDoor("DoorSeven_One", "DoorSevenLoc", "One", "Horizontal", "Seven")
			PlaceMultiDoor("DoorSeven_Two", "DoorSevenLoc", "Two", "Vertical", "Seven")
			DoorSeven = true
	elif door_info.Keys["Seven"] == true: #despawn door Seven
		if DoorSeven == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorSeven_One"))
			self.get_parent().remove_child(self.get_parent().get_node("DoorSeven_Two"))
			DoorSeven = false
	if door_info.Keys["Eight"] == false: #spawn door Eight
		if DoorEight == false:
			PlaceDoor("DoorEight", "DoorEightLoc", "Horizontal", "Eight")
			DoorEight = true
	elif door_info.Keys["Eight"] == true: #despawn door Eight
		if DoorEight == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorEight"))
			DoorEight = false
	if door_info.Keys["Nine"] == false: #spawn door Nine
		if DoorNine == false:
			PlaceDoor("DoorNine", "DoorNineLoc", "Horizontal", "Nine")
			DoorNine = true
	elif door_info.Keys["Nine"] == true: #despawn door Nine
		if DoorNine == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorNine"))
			DoorNine = false
	if door_info.Keys["Ten"] == false: #spawn door Ten
		if DoorTen == false:
			PlaceDoor("DoorTen", "DoorTenLoc", "Horizontal", "Ten")
			DoorTen = true
	elif door_info.Keys["Ten"] == true: #despawn door Ten
		if DoorTen == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorTen"))
			DoorTen = false
	if door_info.Keys["Eleven"] == false: #spawn door Eleven
		if DoorEleven == false:
			PlaceDoor("DoorEleven", "DoorElevenLoc", "Horizontal", "Eleven")
			DoorEleven = true
	elif door_info.Keys["Eleven"] == true: #despawn door Eleven
		if DoorEleven == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorEleven"))
			DoorEleven = false
	if door_info.Keys["Twelve"] == false: #spawn door Twelve
		if DoorTwelve == false:
			PlaceDoor("DoorTwelve", "DoorTwelveLoc", "Vertical", "Twelve")
			DoorTwelve = true
	elif door_info.Keys["Twelve"] == true: #despawn door Twelve
		if DoorTwelve == true:
			self.get_parent().remove_child(self.get_parent().get_node("DoorTwelve"))
			DoorTwelve = false
	#endregion
	#region Place Maze Stairs
	if SaveFileTracker.StairsPlaced == false:
		if StairExit == false:
			PlaceStair("StairExit1","StairExit1Loc","Exit")
			PlaceStair("StairExit3","StairExit3Loc","Exit")
			PlaceStair("StairExit4","StairExit4Loc","Exit")
			PlaceStair("StairExit5","StairExit5Loc","Exit")
			PlaceStair("StairExit6","StairExit6Loc","Exit")
			PlaceStair("StairExit7","StairExit7Loc","Exit")
			PlaceStair("StairExit8","StairExit8Loc","Exit")
			PlaceStair("StairExit9","StairExit9Loc","Exit")
			StairExit = true
		if StairOne == false:
			PlaceStair("StairOne","StairOneLoc","One")
			StairOne = true
		if StairTwo == false:
			PlaceStair("StairTwo","StairTwoLoc","Two")
			StairTwo = true
		if StairThree == false:
			PlaceStair("StairThree","StairThreeLoc","Three")
			StairThree = true
		if StairFour == false:
			PlaceStair("StairFour","StairFourLoc","Four")
			StairFour = true
		if StairFive == false:
			PlaceStair("StairFive","StairFiveLoc","Five")
			StairFive = true
		if StairSix == false:
			PlaceStair("StairSix","StairSixLoc","Six")
			StairSix = true
		if StairSeven == false:
			PlaceStair("StairSeven","StairSevenLoc","Seven")
			StairSeven = true
		if StairEight == false:
			PlaceStair("StairEight","StairEightLoc","Eight")
			StairEight = true
		if StairNine == false:
			PlaceStair("StairNine","StairNineLoc","Nine")
			StairNine = true
		if StairTen == false:
			PlaceStair("StairTen","StairTenLoc","Ten")
			StairTen = true
		if StairEleven == false:
			PlaceStair("StairEleven","StairElevenLoc","Eleven")
			StairEleven = true
		if StairTwelve == false:
			PlaceStair("StairTwelve","StairTwelveLoc","Twelve")
			StairTwelve = true
		SaveFileTracker.StairsPlaced = true
	elif SaveFileTracker.StairsPlaced == true:
		if StairExit == false:
			ReplaceStair("StairExit1","StairExit1Loc","Exit")
			ReplaceStair("StairExit3","StairExit3Loc","Exit")
			ReplaceStair("StairExit4","StairExit4Loc","Exit")
			ReplaceStair("StairExit5","StairExit5Loc","Exit")
			ReplaceStair("StairExit6","StairExit6Loc","Exit")
			ReplaceStair("StairExit7","StairExit7Loc","Exit")
			ReplaceStair("StairExit8","StairExit8Loc","Exit")
			ReplaceStair("StairExit9","StairExit9Loc","Exit")
			StairExit = true
		if StairOne == false:
			ReplaceStair("StairOne","StairOneLoc","One")
			StairOne = true
		if StairTwo == false:
			ReplaceStair("StairTwo","StairTwoLoc","Two")
			StairTwo = true
		if StairThree == false:
			ReplaceStair("StairThree","StairThreeLoc","Three")
			StairThree = true
		if StairFour == false:
			ReplaceStair("StairFour","StairFourLoc","Four")
			StairFour = true
		if StairFive == false:
			ReplaceStair("StairFive","StairFiveLoc","Five")
			StairFive = true
		if StairSix == false:
			ReplaceStair("StairSix","StairSixLoc","Six")
			StairSix = true
		if StairSeven == false:
			ReplaceStair("StairSeven","StairSevenLoc","Seven")
			StairSeven = true
		if StairEight == false:
			ReplaceStair("StairEight","StairEightLoc","Eight")
			StairEight = true
		if StairNine == false:
			ReplaceStair("StairNine","StairNineLoc","Nine")
			StairNine = true
		if StairTen == false:
			ReplaceStair("StairTen","StairTenLoc","Ten")
			StairTen = true
		if StairEleven == false:
			ReplaceStair("StairEleven","StairElevenLoc","Eleven")
			StairEleven = true
		if StairTwelve == false:
			ReplaceStair("StairTwelve","StairTwelveLoc","Twelve")
			StairTwelve = true
	#endregion
	

func save_data(which_save: String):
	SaveManager.save_data(which_save,{
		"CurrentRoom": "Maze",
		"PlayerCoords": {
			"x": roundi(self.get_parent().get_node("PlayerFreeMove").transform.origin.x),
			"y": roundi(self.get_parent().get_node("PlayerFreeMove").transform.origin.y)
		},
		"PlayerCoords_MazeReturn": {
			"x": SaveFileTracker.PlayerCoords_MazeReturn.x,
			"y": SaveFileTracker.PlayerCoords_MazeReturn.y
		}
	})

func load_data(which_save: String):
	var dict: Dictionary = SaveManager.load_data(which_save)
	temp_GetRidOfMe = dict["CurrentRoom"]
	
