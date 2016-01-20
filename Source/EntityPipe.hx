import openfl.Assets;

class EntityPipe extends Entity
{
	var moving:Bool = true;
	
	public function new(startx:Int, starty:Int, w:Int, h:Int ) {
		super();
		graphics.clear();
		//graphics.beginFill(0xee5533);
		graphics.beginBitmapFill(Assets.getBitmapData("assets/pipe.png"));
		graphics.drawRect(0, 0, w, h);
		graphics.endFill();
		x = startx;
		y = starty;
		solid = true;
		
		this.colRect = getRect(this);
	}
	
	public function stop() {
		moving = false;
	}
	
	override public function update() {
		if(moving)
			x -= 90.0 * Game.elapsed;
			
		if (x < 0 - 120.0) expired = true;
		super.update();
	}
}