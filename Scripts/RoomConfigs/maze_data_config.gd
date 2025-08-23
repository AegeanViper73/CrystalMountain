extends Node


@export var door_info: MazeData #true = open, false = closed

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

func _ready() -> void:
	printerr("Finish working on stairs script. Need to be able to place stairs randomly")

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

func PlaceStair(stair_name: String, stair_loc: ):
	pass


func _process(_delta: float) -> void:	
	#region Place Maze Doors
	if door_info.Keys["Exit"] == false:
		pass #spawn door
	else: pass #despawn door
	if door_info.Keys["One"] == false: #spawn door One
		if DoorOne == false:
			PlaceDoor("DoorOne", "DoorOneLoc", "Horizontal", "One")
			DoorOne = true
	elif door_info.Keys["One"] == true: #spaw door One
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
	
	
