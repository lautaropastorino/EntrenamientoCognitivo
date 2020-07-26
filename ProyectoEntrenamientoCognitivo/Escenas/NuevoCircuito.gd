extends Node

var files = []
onready var grid = $Control/imagenesGrid

func _ready():
	#Obtengo todas las imagenes posibles
	files = list_files_in_directory("res://Assets/ImagenesEntrenamiento")
	
	grid.set_columns(8)
	
	for f in files:
		var texture = TextureRect.new()
		var imagen = load("res://Assets/ImagenesEntrenamiento/" + f)
		texture.set_texture(imagen)
		#texture.texture.set_height(30)# = Vector2(30,30)
		grid.add_child(texture)
		
	
func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin(true, true) #skipnavigational (., ..) y skiphidden en true

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not ".import" in file:
			files.append(file)
	return files
