package ;

import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.text.TextFieldAutoSize;
import motion.Actuate;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.net.URLRequest;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.Assets;

/**
 * ...
 * @author Greg Holkenbrink
 */
class StatePlay extends Group
{
	var jetman:EntityShip;
	var score:Entity;
	var scoreshade:Entity;
	var ground:Ground;
	
	public function new() {
		super();
		
		Game.score = 0;
		
		var backdrop = new Entity();
		backdrop.graphics.beginBitmapFill(Assets.getBitmapData("assets/backdrop.png"));
		backdrop.graphics.drawRect(0, 0, 500, 700);
		backdrop.graphics.endFill;
		add(backdrop);

		scoreshade = new Entity();
		scoreshade.initText("0", 0x222222);
		scoreshade.x = 230+2;
		scoreshade.y = 70+2;
		add(scoreshade);
		
		score = new Entity();
		score.initText("0", 0xFFFFFF);
		score.x = 230;
		score.y = 70;
		add(score);
		
		ground = new Ground();
		add(ground);		
		
		jetman = new EntityShip(96, 334);
		add(jetman);
		
		var twit = new Entity();
		twit.graphics.beginBitmapFill(Assets.getBitmapData("assets/twitter.png"));
		twit.graphics.drawRect(0, 0, 93, 26);
		twit.graphics.endFill();
		twit.y = 700 - 30;
		twit.useHandCursor = true;
		add(twit);
		
		twit.addEventListener(MouseEvent.CLICK, 
			function (e:Event) {
				Lib.getURL(new URLRequest("http://www.twitter.com/gregcodes"));
			} );		
		
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, function (e:Event) { jetman.applyForce(); } );
		Actuate.timer(.3).onComplete(addpipes);		
	}
	
	override public function update() {
		var c = list.length;
		while ( --c > 0 )
		{
			var ent:Entity = list[c];
			if (ent != jetman && ent.solid && !jetman.expired) {
				var jetrect = jetman.colRect;
				
				var orect = ent.colRect;
				orect.x = ent.x;
				orect.y = ent.y;
				//if player intersects with pipe rect then end
				//if player intersects with safe area rect then +1 score
				if ( jetrect.intersects(orect) ) {
					switch( ent.type ){
						case 0:
							doEnd();
						case 2:
							Game.score += 1;
							ent.expired = true;
							scoreshade.text = "" + Game.score;
							score.text = "" + Game.score;
							//trace(Game.score);
					}//end switch
				}//end if jetrect.intersects(orect)
			}//end if(ent != jetman && ent.solid
		}//end while
		super.update();
	}
	
	private function addpipes() {
		var toppipeheight:Int = 160 + Math.floor(Math.random() * 220);
		var gapheight:Int = 160 + Math.floor(Math.random() * 64);
		var toppipe = new EntityPipe(500, 0, 64, toppipeheight);
		var botpipe = new EntityPipe(500, (toppipeheight + gapheight), 64, 700 - (toppipeheight + gapheight) + 1);
		addAt(toppipe, 1);
		addAt(botpipe, 1);
		
		var scorepost = new EntityPost(500 + 64, 0, 16, 700);
		add(scorepost);
		
		var addtime:Float = 3.1 + Math.random() * 1.3;
		Actuate.timer(addtime).onComplete(addpipes);
	}
	
	private function doEnd() {
		jetman.expired = true;
		ground.stop();
		var end = new StateEnd();
		Main.state = end;
		
		for (m in this.list ) {
			if ( Type.getClassName(Type.getClass(m)) == "Pipe" ) {
				if ( m.x <= 500.0 && m.x > -120.0 ) {
					var e = cast(m, EntityPipe);
					e.stop();
					Main.state.add(e);
				}
			}
		}
		
		Main.state.add(ground);
		this.removeFromStage();
		end.go();
	}
}