package ;

import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.Lib;
import openfl.net.URLRequest;
import openfl.Assets;

/**
 * ...
 * @author Greg Holkenbrink
 */
class StateMenu extends Group
{

	public function new() 
	{
		super();
		
		var backdrop = new Entity();
		backdrop.graphics.beginBitmapFill(Assets.getBitmapData("assets/backdrop.png"));
		backdrop.graphics.drawRect(0, 0, 500, 700);
		backdrop.graphics.endFill;
		add(backdrop);
		
		var ground = new Ground(false);
		add(ground);		
		
		var logo = new Entity();
		logo.graphics.beginBitmapFill(Assets.getBitmapData("assets/logo.png"));
		logo.graphics.drawRect(0, 0, 500, 700);
		logo.graphics.endFill();
		add(logo);
		
		var anotherbox = new Entity();
		anotherbox.graphics.beginBitmapFill(Assets.getBitmapData("assets/click.png"));
		anotherbox.graphics.drawRect(0, 0, 180, 90);
		anotherbox.graphics.endFill();
		add(anotherbox);
		anotherbox.x = 161;
		anotherbox.y = 420;
		
		anotherbox.addEventListener(MouseEvent.CLICK, 
			function (e:Event) {
				Main.state.removeFromStage();
				Main.state = new StatePlay();
			} );
		
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
			
		#if mobile
		//rescale
		/*
		this.scaleX = Lib.current.stage.stageWidth / 500;
		this.scaleY = this.scaleX;
		this.y = Math.abs((Lib.current.stage.stageHeight - this.height) / 2);
		*/
		#end
	}
	
}