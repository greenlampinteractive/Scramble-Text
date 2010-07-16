package com.greenlampinteractive.text
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class TextFieldDisplayChar extends Sprite
	{
		
		private var _theTextField:TextField;
		
		public function TextFieldDisplayChar()
		{
			init();
		}
		
		private function init():void
		{

			_theTextField = new TextField();
			this.addChild(_theTextField);
			_theTextField.autoSize = TextFieldAutoSize.NONE;

		}
		
		public function setText(str:String):void
		{
			
			_theTextField.text = str;
			
		}
		
	}
}