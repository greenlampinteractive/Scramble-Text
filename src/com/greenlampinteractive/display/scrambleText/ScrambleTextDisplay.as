package com.greenlampinteractive.display.scrambleText
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	public class ScrambleTextDisplay extends Sprite
	{
		private var _myTextField:ScrambleText;
		private var _bgShape:Shape;
		private var _timer:Timer;
		
		private var _text:String;
		
		private var _bgColor:uint = 0xf3f3f3;
		private var _bgAlphaAmt:Number = 1;
		private var _leftRightPadding:Number=1;
		
		public function ScrambleTextDisplay()
		{
			_myTextField = new ScrambleText();
			this.addChild(_myTextField);
		}
		
		public function setText(str:String, delay:int=0):void
		{
			
			_text = str;
			
			if (delay == 0){
				_myTextField.setText(_text);
				_myTextField.init();
				tweenBG();
			} else {
				_myTextField.setText(_text);
				_timer = new Timer(delay);
				_timer.addEventListener(TimerEvent.TIMER, onTimerCompleteHandler);
				_timer.start();
			}
			
			
		}
		
		private function onTimerCompleteHandler(evt:TimerEvent):void
		{
			_timer.removeEventListener(TimerEvent.TIMER, onTimerCompleteHandler);
			_timer = null;
			
			_myTextField.init();
			tweenBG();
		}
		
		private function tweenBG():void
		{
			
			if (null == _bgShape){
				_bgShape = new Shape();
				_bgShape.graphics.beginFill(_bgColor, _bgAlphaAmt);
				_bgShape.graphics.drawRect(0,0,1,_myTextField._height);
				_bgShape.graphics.endFill();
				_bgShape.x = 0;
				this.addChildAt(_bgShape,0);
				
				TweenLite.to(_bgShape, 1.5, {width:_myTextField._width + (_leftRightPadding * 2), ease:Back.easeOut});
			}
			
		}

		//Set the properties of the bg shape without having to dive into this class evertime. 
		public function setBGShapeParams(color:uint, theAlpha:Number=1, leftRightPadding:Number=0):void
		{
			
			_bgColor = color;
			_bgAlphaAmt = theAlpha;
			_leftRightPadding = leftRightPadding;
			_myTextField.x = _leftRightPadding;
			

		}
		
		public function setTextFormat(format:TextFormat):void
		{
			
			_myTextField.setTextFieldFormat(format);
			
		}
		
		public function getHeight():Number
		{
			
			return _myTextField._height;
			
		}
		
		public function dispose():void
		{
			if (_timer)
			{
				if (_timer.running)
				{
					_timer.stop();
					_timer.removeEventListener(TimerEvent.TIMER, onTimerCompleteHandler);
					_timer = null;
					
				}
			}
			
			
			if (_bgShape){
				TweenLite.killTweensOf(_bgShape);
				this.removeChild(_bgShape);
				_bgShape = null;
			}
			
			this.removeChild(_myTextField);
			_myTextField.dispose();
			_myTextField = null;
			
		}
		
	}
}