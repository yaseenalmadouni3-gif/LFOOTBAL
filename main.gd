extends Node2D

var player := Vector2(420, 360)
var ball := Vector2(470, 360)
var enemy := Vector2(840, 330)
var keeper := Vector2(1090, 360)
var message := "OFFLINE FOOTBALL DEMO"

func _ready():
    queue_redraw()

func _process(delta):
    var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    player += dir * 180.0 * delta
    player.x = clamp(player.x, 90.0, 1190.0)
    player.y = clamp(player.y, 105.0, 615.0)
    if player.distance_to(ball) < 55:
        ball = player + Vector2(45, 0)
    queue_redraw()

func _draw():
    draw_rect(Rect2(60,75,1160,570), Color("#277a35"))
    draw_rect(Rect2(60,75,1160,570), Color.WHITE, false, 4)
    draw_line(Vector2(640,75), Vector2(640,645), Color.WHITE, 3)
    draw_circle(Vector2(640,360), 80, Color.WHITE, false, 3)
    draw_circle(player, 22, Color("#e8e8e8"))
    draw_circle(enemy, 22, Color("#d64b4b"))
    draw_circle(keeper, 22, Color("#f2c84b"))
    draw_circle(ball, 10, Color.WHITE)
    draw_rect(Rect2(0,0,1280,75), Color("#111827"))
    draw_string(ThemeDB.fallback_font, Vector2(40,48), "HOME  0 - 0  AWAY", HORIZONTAL_ALIGNMENT_LEFT, -1, 28, Color.WHITE)
    draw_string(ThemeDB.fallback_font, Vector2(480,48), message, HORIZONTAL_ALIGNMENT_LEFT, -1, 24, Color.WHITE)
