package com.greenlampinteractive.display.scrambleText
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	import com.greensock.easing.Quad;
	import com.greensock.easing.Strong;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	public class ScrambleTextTest extends Sprite
	{
		
		//Each line of text is its own sprite, so however many lines of text you need, 
		//you need to make another BourneIdentityTextDisplay instance.
		private var _headingTextField:ScrambleTextDisplay;
		private var _bodyText:ScrambleTextDisplay;
		private var _bodyTextTwo:ScrambleTextDisplay;
		private var _bodyTextThree:ScrambleTextDisplay;
		
		//in order to have it all follow the mouse when it moves, i throw each instance in a contianer sprite and move that. 
		private var _textContainer:Sprite;
		
		private var _btn:Sprite;
		
		public function ScrambleTextTest()
		{
			init();
		}
		
		private function init():void
		{
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 31;
			
			_btn = new Sprite();
			_btn.graphics.beginFill(0x009999);
			_btn.graphics.drawRect(0,0,55,55);
			_btn.graphics.endFill();
			this.addChild(_btn);
			_btn.buttonMode = true;
			_btn.addEventListener(MouseEvent.MOUSE_OVER, runTextField);
			_btn.addEventListener(MouseEvent.MOUSE_OUT, killTextField);
			
			_textContainer = new Sprite();
			this.addChild(_textContainer);
	
		}		
		
		private function runTextField(evt:MouseEvent):void
		{
			//The setText method takes two params... the first is obviously the text, while the second is a timer delay int. 
			//Play around with it to see how it works, or just dive in to that class. 
			
			var helvetica:HelveticaNeue = new HelveticaNeue();
			
			var textFormat:TextFormat = new TextFormat();
			textFormat.color = 0x333333;
			textFormat.size = 14;
			textFormat.font = helvetica.fontName;
			
			var headingTextFormat:TextFormat = new TextFormat();
			headingTextFormat.color = 0xf1f1f1;
			headingTextFormat.font = helvetica.fontName;
			headingTextFormat.size = 18;
			
			_headingTextField = new ScrambleTextDisplay();
			_headingTextField.setBGShapeParams(0x777777, .8, 5);
			_headingTextField.setTextFormat(headingTextFormat);
			_textContainer.addChild(_headingTextField);
			_headingTextField.setText("HELLO" + ", THIS IS A TEST. IS THIS THING WORKING YET?");
			_headingTextField.y = 0;
			
			_bodyText = new ScrambleTextDisplay();
			_bodyText.setBGShapeParams(0xf3f3f3, .8, 5);
			_bodyText.setTextFormat(textFormat);
			_textContainer.addChild(_bodyText);
			_bodyText.setText("THIS TEXT ELEMENT WAS INSPIRED BY BOTH:", 500);
			_bodyText.y = _headingTextField.y + _headingTextField.getHeight();
			
			_bodyTextThree = new ScrambleTextDisplay();
			_bodyTextThree.setBGShapeParams(0xf3f3f3, .8, 5);
			_bodyTextThree.setTextFormat(textFormat);
			_textContainer.addChild(_bodyTextThree);
			_bodyTextThree.setText("THE ROLLING CREDITS IN THE BOURNE FLICKS, AND ALSO ANUNSTABLEGRID.COM", 1000);
			_bodyTextThree.y = _bodyText.y + _bodyText.getHeight();
			
			_bodyTextTwo = new ScrambleTextDisplay();
			_bodyTextTwo.setBGShapeParams(0xf3f939, .8, 5);
			_bodyTextTwo.setTextFormat(textFormat);
			_textContainer.addChild(_bodyTextTwo);
			_bodyTextTwo.setText("DOWNLOAD THE SOURCE AND TAKE IT FOR A SPIN.", 1500);
			_bodyTextTwo.y = _bodyTextThree.y + _bodyTextThree.getHeight();
			
			this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			
		}
		
		private function onMouseMoveHandler(evt:MouseEvent):void
		{
			
			_textContainer.y = evt.stageY + 25;
			_textContainer.x = evt.stageX + 25;
			
		}
		
		private function killTextField(evt:MouseEvent):void
		{
			
			this.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			
			if (_headingTextField){
				_textContainer.removeChild(_headingTextField);
				_headingTextField.dispose();
				_headingTextField = null;
			}
			if (_bodyText){
				_textContainer.removeChild(_bodyText);
				_bodyText.dispose();
				_bodyText = null;
			}
			if (_bodyTextTwo){
				_textContainer.removeChild(_bodyTextTwo);
				_bodyTextTwo.dispose();
				_bodyTextTwo = null;
			}
			if (_bodyTextThree){
				_textContainer.removeChild(_bodyTextThree);
				_bodyTextThree.dispose();
				_bodyTextThree = null;
			}

		}

	}
}