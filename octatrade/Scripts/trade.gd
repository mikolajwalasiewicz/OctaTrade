extends Button

@onready var label1 = $"../TileTradeResources/Label"
@onready var label2 = $"../TileTradeResources/Label2"
@onready var label3 = $"../TileTradeResources/Label3"
@onready var label4 = $"../TileTradeResources/Label4"
@onready var label5 = $"../TileTradeResources/Label5"
@onready var label6 = $"../TileTradeResources/Label6"
@onready var label7 = $"../TileTradeResources/Label7"
@onready var label8 = $"../TileTradeResources/Label8"

var value_resource1 : int = 0
var value_resource2 : int = 0
var value_resource3 : int = 0
var value_resource4 : int = 0

var value_resource1_buy : int = 0
var value_resource2_buy : int = 0
var value_resource3_buy : int = 0
var value_resource4_buy : int = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Label2".text = str(Variable.trade_ratio) + " : " + str(Variable.trade_ratio_to)

func _process(delta: float) -> void:
	$"../TilePlayersResources/Label".text = str(Variable.players[Variable.current_player - 1]["resource_1"])
	$"../TilePlayersResources/Label2".text = str(Variable.players[Variable.current_player - 1]["resource_2"])
	$"../TilePlayersResources/Label3".text = str(Variable.players[Variable.current_player - 1]["resource_3"])
	$"../TilePlayersResources/Label4".text = str(Variable.players[Variable.current_player - 1]["resource_4"])

func _on_pressed() -> void:
	get_parent().get_parent().set_players()


func resource_1_sell() -> void:
	var player = Variable.players[Variable.current_player - 1]
	if value_resource1 < player["resource_1"]:
		value_resource1 += 1
		label1.text = str(value_resource1)


func resource_2_sell() -> void:
	var player = Variable.players[Variable.current_player - 1]
	if value_resource2 < player["resource_2"]:
		value_resource2 += 1
		label2.text = str(value_resource2)


func resource_3_sell() -> void:
	var player = Variable.players[Variable.current_player - 1]
	if value_resource3 < player["resource_3"]:
		value_resource3 += 1
		label3.text = str(value_resource3)


func resource_4_sell() -> void:
	var player = Variable.players[Variable.current_player - 1]
	if value_resource4 < player["resource_4"]:
		value_resource4 += 1
		label4.text = str(value_resource4)


func resource_1_buy() -> void:
	value_resource1_buy +=1
	label5.text = str(value_resource1_buy)


func resource_2_buy() -> void:
	value_resource2_buy +=1
	label6.text = str(value_resource2_buy)


func resource_3_buy() -> void:
	value_resource3_buy +=1
	label7.text = str(value_resource3_buy)


func resource_4_buy() -> void:
	value_resource4_buy +=1
	label8.text = str(value_resource4_buy)


func trade() -> void:
	var sell_amount = value_resource1 + value_resource2 + value_resource3 + value_resource4
	var buy_amount = value_resource1_buy + value_resource2_buy + value_resource3_buy + value_resource4_buy

	var can_buy = int(sell_amount / Variable.trade_ratio)
	var required_sell = buy_amount * Variable.trade_ratio

	if sell_amount >= required_sell and can_buy >= buy_amount:
		# gracz ma wystarczająco dużo surowców
		# więc odejmujemy dokładnie te, które wskazał
		var player = Variable.players[Variable.current_player - 1]

		# sprawdź czy gracz faktycznie ma tyle surowców do sprzedania
		if value_resource1 <= player["resource_1"] and value_resource2 <= player["resource_2"] and value_resource3 <= player["resource_3"] and value_resource4 <= player["resource_4"]:

			player["resource_1"] -= value_resource1
			player["resource_2"] -= value_resource2
			player["resource_3"] -= value_resource3
			player["resource_4"] -= value_resource4

			player["resource_1"] += value_resource1_buy
			player["resource_2"] += value_resource2_buy
			player["resource_3"] += value_resource3_buy
			player["resource_4"] += value_resource4_buy

			clear_trade_board()
		else:
			print("Za mało konkretnego surowca!")
	else:
		print("Zła proporcja handlu!")

func clear_trade_board() -> void:
	value_resource1 =0
	label1.text = str(value_resource1)
	value_resource2 =0
	label2.text = str(value_resource2)
	value_resource3 =0
	label3.text = str(value_resource1)
	value_resource4 =0
	label4.text = str(value_resource1)
	value_resource1_buy =0
	label5.text = str(value_resource1_buy)
	value_resource2_buy =0
	label6.text = str(value_resource2_buy)
	value_resource3_buy =0
	label7.text = str(value_resource3_buy)
	value_resource4_buy =0
	label8.text = str(value_resource4_buy)
