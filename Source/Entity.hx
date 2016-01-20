package ;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.Font;

import openfl.Assets;

/**
 * ...
 * @author Greg Holkenbrink
 */



class Entity extends Sprite {
	public var expired = false;
	public var colRect:Rectangle;
	public var solid = false;
	public var type:Int = 0;

	private var _text:TextField;
	public var text(get_text, set_text):String;

	public function new() {
		super();
	}

	public function update() {
	}

	public function initText(str:String = "", color:Int=0xFFFFFF) {
		if (_text == null) {
			var txtfmt = new TextFormat(Assets.getFont("assets/C64_Pro_Mono-STYLE.ttf").fontName);

			txtfmt.size = 38;
			txtfmt.color = color;

			_text = new TextField();
			_text.defaultTextFormat = txtfmt;
			_text.embedFonts = true;
			_text.selectable = false;
			_text.text = str;
			_text.width = _text.textWidth+10;
			_text.height = _text.textHeight+10;

			addChild(_text);
		}
	}

	private function get_text():String { return _text == null ? "" : _text.text; }
	private function set_text(data:String):String {
		if (_text == null ) initText();
		_text.text = data;
		_text.width = _text.textWidth+10;
		_text.height = _text.textHeight+10;
		//add colRect update?
		return _text.text;
	}

}
