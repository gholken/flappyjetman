import openfl.display.Sprite;
import openfl.Assets;

class EntityShip extends Entity
{
	var angle:Float;
	var force:Float = 0.0;
	var yspeed:Float = 4.0;
	
	public function new(startx:Int, starty:Int) {
		super();
		var basesprite = new Sprite();
		
		type = 1;
		//graphics.beginFill(0x2222ee);
		basesprite.graphics.beginBitmapFill(Assets.getBitmapData("assets/ship.png"));
		basesprite.graphics.drawRect(0, 0, 32, 32);
		basesprite.graphics.endFill();
		basesprite.x = -16;
		basesprite.y = -16;
		addChild(basesprite);
		x = startx;
		y = starty;
		
		
		this.colRect = getRect(this);
		colRect.x -= 32;
		colRect.y -= 32;
		
	}
	
	public function applyForce() {
		if(force < 1.0) {
			force = 96.0;
			yspeed = 4.0;
			rotation = 0;
		}
	}
	
	override public function update() {
		if (force > 0.0) {
			//yspeed = yspeed - force;
			force *= .5;
			if (force <= 0.01) force = 0.0;
		}
		y += (yspeed - force) * 30.0 * Game.elapsed;
		rotation += yspeed * 15.0 * Game.elapsed ;
		yspeed *= 1.09;
		
		colRect.x = x + 8 - 16;
		colRect.y = y + 4 - 16;
		colRect.width = 32 - 16;
		colRect.height = 32 - 8;
		
		super.update();
	}
}