extends Node

var colores = []
var flechas = []
var palabras = []
var numeros = []
var aritmeticos = []
var imagenes = []

func _ready():
	#Obtengo todas las imagenes posibles
	colores = list_files_in_directory("res://Escenas/Imagenes/Colores")
	flechas = list_files_in_directory("res://Escenas/Imagenes/Flechas")
	palabras = list_files_in_directory("res://Escenas/Imagenes/PalabrasEnColores")
	numeros = list_files_in_directory("res://Escenas/Imagenes/Numeros")
	aritmeticos = list_files_in_directory("res://Escenas/Imagenes/Aritmeticos")
	
	var imagenes_totales = {"Colores": colores, "Flechas": flechas, "Numeros": numeros}#, "PalabrasEnColores": palabras,  "Aritmeticos": aritmeticos}
	
	var posicion = Vector2(80, 150)

	for i in imagenes_totales:
		for f in imagenes_totales[i]:
			var imagen = load("res://Escenas/Imagenes/" + i + "/" + f)
			var img = imagen.instance()
			img.set_position(posicion)
			imagenes.append(img)
			add_child(img)
			posicion.x += 120
			if posicion.x + 120 >= get_viewport().size.x:
				posicion.x = 80
				posicion.y += 100

func _input(event):
	if event is InputEventMouseButton:
		for i in imagenes:
			if event.position >= i.get_global_position() and event.position <= Vector2(i.get_global_position().x + 50, i.get_global_position().y + 40):
				print(str(event.position) + str(i.get_global_position()))
	
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
