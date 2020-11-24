extends Node2D

var bildgross:Vector2

func _ready():
	bildgross = $ursprung.texture.get_size()

func _on_Button_pressed():
	var ur_img:Image = $ursprung.texture.get_data()
	var dummi = Image.new()
	dummi.create(bildgross.x,bildgross.y,false,Image.FORMAT_RGBA8)
	dummi.fill(Color(1,1,1))
	var farbe:Color
	var pos:Vector2
	var zahl:int
	ur_img.lock()
	dummi.lock()
	ERR_FAIL_COND_MSG(!ur_img.get_pixelv(Vector2(1,-1)))
	return
	for xx in range(bildgross.x):
		for yy in range(bildgross.y):
			pos = Vector2(xx,yy)
			zahl = 0
			farbe = ur_img.get_pixelv(pos + Vector2(1,-1))
			zahl += farbe.r
			farbe = ur_img.get_pixelv(pos + Vector2(1,0))
			zahl += farbe.r
			farbe = ur_img.get_pixelv(pos + Vector2(1,1))
			zahl += farbe.r
			farbe = ur_img.get_pixelv(pos + Vector2(0,1))
			zahl += farbe.r
			farbe = ur_img.get_pixelv(pos + Vector2(-1,1))
			zahl += farbe.r
			farbe = ur_img.get_pixelv(pos + Vector2(-1,0))
			zahl += farbe.r
			farbe = ur_img.get_pixelv(pos + Vector2(-1,-1))
			zahl += farbe.r
			if zahl < 6:
				dummi.set_pixel(xx,yy,Color(0,0,0))
	ur_img.unlock()
	dummi.unlock()
	var ImagTex = ImageTexture.new()
	ImagTex.create_from_image(dummi)
	$TextureRectA.texture = ImagTex
	vergleich()
	
func vergleich():
	var ur_img:Image = $ursprung.texture.get_data()
	var tr_img:Image = $TextureRectA.texture.get_data()
	var dummi = Image.new()
	dummi.create(bildgross.x,bildgross.y,false,Image.FORMAT_RGBA8)
	ur_img.lock()
	tr_img.lock()
	dummi.lock()
	for xx in range(bildgross.x):
		for yy in range(bildgross.y):
			if ur_img.get_pixel(xx,yy) == tr_img.get_pixel(xx,yy):
				dummi.set_pixel(xx,yy,Color(1,1,1))
			else:
				dummi.set_pixel(xx,yy,Color(0,0,0))
	ur_img.unlock()
	tr_img.unlock()
	dummi.unlock()
	var ImagTex = ImageTexture.new()
	ImagTex.create_from_image(dummi)
	$ursprung.texture = ImagTex	
		
		
		
		
		
