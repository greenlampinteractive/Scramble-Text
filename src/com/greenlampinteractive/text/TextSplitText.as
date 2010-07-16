package com.greenlampinteractive.text
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class TextSplitText extends Sprite
	{
		
		private var _theTextField:TextFieldDisplay;
		
		public function TextSplitText()
		{
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 31;
			
			runTextField();
			
		}		
		
		private function runTextField():void
		{
			
			_theTextField = new TextFieldDisplay();
			_theTextField.setText("this is a test textfield");
			this.addChild(_theTextField);
		}
	}
}