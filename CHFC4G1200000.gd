extends Sprite

var value = 2.5
var Mat

func _ready():
    Mat = self.get_material()
    Mat.set_shader_param("sh_color",Color(0.26, 1, .9, 1))