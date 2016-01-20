package ;

import motion.actuators.GenericActuator.IGenericActuator;
import openfl.Assets;
import motion.Actuate;
import motion.easing.Quint;
import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.Lib;
import openfl.net.URLRequest;

/**
 * ...
 * @author Greg Holkenbrink
 */
class StateEnd extends Group
{

	public function new()
	{
		super();

		var backdrop = new Entity();
		backdrop.graphics.beginBitmapFill(Assets.getBitmapData("assets/backdrop.png"));
		backdrop.graphics.drawRect(0, 0, 500, 700);
		backdrop.graphics.endFill;
		add(backdrop);


	}

	public function go() {
		var gameover = new Entity();
		gameover.graphics.beginBitmapFill(Assets.getBitmapData("assets/gameover.png"));
		gameover.graphics.drawRect(0, 0, 250, 50);
		gameover.graphics.endFill;
		gameover.x = 125;
		gameover.y = -50;
		add(gameover);

		var gameoverbanner = Actuate.tween(gameover, 0.7, { y: 200 } );
		gameoverbanner.ease( Quint.easeOut );
		gameoverbanner.onComplete(addaar);

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
	}

	public function addaar() {
		var scoredisplay = new Entity();
		scoredisplay.initText("Score: " + Game.score, 0xFFFFFF);
		scoredisplay.x = 100;
		scoredisplay.y = 310;
		add(scoredisplay);

		var restartbutton = new Entity();
		restartbutton.graphics.beginBitmapFill(Assets.getBitmapData("assets/click.png"));
		restartbutton.graphics.drawRect(0, 0, 180, 90);
		restartbutton.graphics.endFill();
		add(restartbutton);
		restartbutton.x = 161;
		restartbutton.y = 420;

		restartbutton.addEventListener(MouseEvent.CLICK,
			function (e:Event) {
				Main.state.removeFromStage();
				Main.state = new StatePlay();
			} );
	}

}
