extends Node

var colores = []
var flechas = []
var palabras = []
var numeros = []
onready var grid = $Control/imagenesGrid

func _ready():
	#Obtengo todas las imagenes posibles
	colores = list_files_in_directory("res://Assets/ImagenesEntrenamiento/Colores")
	flechas = list_files_in_directory("res://Assets/ImagenesEntrenamiento/Flechas")
	palabras = list_files_in_directory("res://Assets/ImagenesEntrenamiento/PalabrasEnColores")
	numeros = list_files_in_directory("res://Assets/ImagenesEntrenamiento/Numeros")
	
	var imagenes_totales = {"Colores": colores, "Flechas": flechas, "PalabrasEnColores": palabras, "Numeros": numeros}
	
	grid.set_columns(6)
	
	for i in imagenes_totales:
		for f in imagenes_totales[i]:
			var textureRect = TextureRect.new()
			var imagen = load("res://Assets/ImagenesEntrenamiento/" + i + "/" + f)
			textureRect.set_texture(imagen)
			textureRect.rect_size = imagen.get_size()
			textureRect.expand = true
			textureRect.set_stretch_mode(5)
			print("Antes: " + str(textureRect.rect_min_size))
			textureRect.rect_min_size = textureRect.rect_size * Vector2(.008, .008)
			print("Después: " + str(textureRect.rect_min_size))
			grid.add_child(textureRect)
		
	
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
