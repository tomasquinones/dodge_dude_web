extends CanvasLayer

signal start_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counter_shown = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_mob_counter"):
	# if Input.is_action_pressed("ui_mob_counter"):
			if counter_shown:
				$MobCounterValue.hide()
				$MobCounterLabel.hide()
				counter_shown = false
			else:
				$MobCounterValue.show()
				$MobCounterLabel.show()
				counter_shown = true

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")
	
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
	
func update_score(score):
	$ScoreValue.text = str(score)

func update_highscore(highscore):
	$HighScoreValue.text = str(highscore)

func update_mob_count(count):
	$MobCounterValue.text = str(count)



func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()


	
