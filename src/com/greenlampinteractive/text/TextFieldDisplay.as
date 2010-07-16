package com.greenlampinteractive.text
{
	
	
	import com.greenlampinteractive.display.scrambleText.TextHelper;
	
	import flash.display.Sprite;
	
	public class TextFieldDisplay extends Sprite
	{
		
		private var _text:String='';
		
		public function TextFieldDisplay()
		{
			
		}
		
		public function setText(str:String):void
		{
			
			_text = str;
			var textCharArr:Array = TextHelper.toCharArray(_text);
			
			
			for (var i:int=0; i < textCharArr.length; i++)
			{
				
				var textChar:TextFieldDisplayChar = new TextFieldDisplayChar();
				textChar.setText(textCharArr[i]);
				this.addChild(textChar);
				textChar.x = i * 5;
				
			}
			
		}
		
	}
}