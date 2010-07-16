package com.greenlampinteractive.display.scrambleText
{
	public class TextHelper
	{

		public static function toCharArray(string:String):Array {
			var array:Array = new Array();
			
			for (var i:int = 0; i < string.length; i++) {
				var char:String = string.charAt(i);
				
				array.push(char);
					
				
			}
			return array;
		}
		
		public static function randomTextArr():Array
		{

			var randString:String = "qwertyuiopasdfghjklzxcvbnm1234567890"

			return TextHelper.toCharArray(randString.toUpperCase());
			
		}
		
	}
}