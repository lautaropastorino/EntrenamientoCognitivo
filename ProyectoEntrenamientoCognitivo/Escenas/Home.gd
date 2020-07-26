extends Node



func _on_SalirButton_pressed():
	get_tree().quit()


func _on_NuevoCircuitoButton_pressed():
	get_tree().change_scene("res://Escenas/NuevoCircuito.tscn")
