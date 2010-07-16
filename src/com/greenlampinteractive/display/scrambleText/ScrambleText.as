package com.greenlampinteractive.display.scrambleText
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Quad;
	
	import flash.display.Shape;
	import flash.events.TextEvent;
	import flash.events.TimerEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	public class ScrambleText extends TextField
	{
		
		private var _string:String;
		private var _characArr:Array = [];
		
		private var _timer:Timer;
		private var _stringCharLength:int=0;
		private var _stringCurrText:String='';
		
		private var _timerTime:int=20;
		
		private var _textTimerOne:Timer;
		private var _textTimerTwo:Timer;
		private var _textTimerThree:Timer;
		private var _textTimerFour:Timer;
		
		private var _theTextFormat:TextFormat = new TextFormat(); 
		
		private var _currTime:int= .5;		
		private var _mainTimerDelay:int=5;		
		private var _myTextFormat:TextFormat;
		
		//dimensions
		public var _height:Number;
		public var _width:Number;

		public function ScrambleText()
		{
			defaultFormat();
		}
		
		public function setText(str:String):void
		{
			
			_string = str;
			_characArr = TextHelper.toCharArray(_string);

			grabDimensions();

		}	
		
		public function init():void
		{
			_timer = new Timer(_timerTime);
			_timer.addEventListener(TimerEvent.TIMER, onTimerComplete);
			_timer.start();
			
			scrambleText();
			
			onTextTimerComplete(null);
			onTimerComplete(null);
		}

		private function grabDimensions():void
		{
			
			this.visible = false;
			this.htmlText = _string;
			if(_theTextFormat != null){
				this.setTextFormat(_theTextFormat);
			}
			_height = this.height;
			_width = this.width;
			this.text = '';
			this.visible = true
			
				
			 if(_theTextFormat != null){
				 this.embedFonts = true;
				 this.antiAliasType = AntiAliasType.ADVANCED;
			 }
		}
		
		private function scrambleText():void
		{
			_textTimerOne = new Timer(35);
			_textTimerOne.addEventListener(TimerEvent.TIMER, onTextTimerComplete);
			_textTimerOne.start();
			
			_textTimerTwo = new Timer(25);
			_textTimerTwo.addEventListener(TimerEvent.TIMER, onTextTimerCompleteTwo);
			_textTimerTwo.start();
			
			_textTimerThree = new Timer(15);
			_textTimerThree.addEventListener(TimerEvent.TIMER, onTextTimerCompleteThree);
			_textTimerThree.start();
			
			_textTimerFour = new Timer(45);
			_textTimerFour.addEventListener(TimerEvent.TIMER, onTextTimerCompleteFour);
			_textTimerFour.start();
	
		}
		
		private function onTextTimerComplete(evt:TimerEvent):void
		{
			
			var theArr:Array = TextHelper.randomTextArr();
			
			var scrambleStr:String=theArr[Math.floor(Math.random() * theArr.length)];
			
			this.htmlText = _stringCurrText + scrambleStr;
			
			
			if(_theTextFormat != null){
				this.setTextFormat(_theTextFormat);
			}
		}
		
		private function onTextTimerCompleteTwo(evt:TimerEvent):void
		{
			var theArr:Array = TextHelper.randomTextArr();
			
			var scrambleStr:String=theArr[Math.floor(Math.random() * theArr.length)];
			
			this.htmlText = _stringCurrText + scrambleStr;
			
			
			if(_theTextFormat != null){
				this.setTextFormat(_theTextFormat);
			}
		}
		private function onTextTimerCompleteThree(evt:TimerEvent):void
		{
			var theArr:Array = TextHelper.randomTextArr();
			
			var scrambleStr:String=theArr[Math.floor(Math.random() * theArr.length)];
			
			this.htmlText = _stringCurrText + scrambleStr;
			
			
			if(_theTextFormat != null){
				this.setTextFormat(_theTextFormat);
			}
		}
		
		private function onTextTimerCompleteFour(evt:TimerEvent):void
		{
			var theArr:Array = TextHelper.randomTextArr();
			
			var scrambleStr:String=theArr[Math.floor(Math.random() * theArr.length)];
			
			this.htmlText = _stringCurrText + scrambleStr;
			
			
			if(_theTextFormat != null){
				this.setTextFormat(_theTextFormat);
			}
		}
		
		private function defaultFormat():void
		{
			
			this.autoSize = TextFieldAutoSize.LEFT;

		}
		
		public function setTimerTime(time:int):void
		{
			
			_timerTime = time;
			
		}
		
		private function onTimerComplete(evt:TimerEvent):void
		{

			if (_stringCurrText.length == _characArr.length){
				
				_timer.removeEventListener(TimerEvent.TIMER, onTimerComplete);
				_timer = null;
				
				_textTimerOne.removeEventListener(TimerEvent.TIMER, onTextTimerComplete);
				_textTimerOne = null;
				
				_textTimerTwo.removeEventListener(TimerEvent.TIMER, onTextTimerCompleteTwo);
				_textTimerTwo = null;
				
				_textTimerThree.removeEventListener(TimerEvent.TIMER, onTextTimerCompleteThree);
				_textTimerThree = null;
				
				_textTimerFour.removeEventListener(TimerEvent.TIMER, onTextTimerCompleteFour);
				_textTimerFour = null;
				
				this.htmlText = _stringCurrText;
				
			} else {
				
				_stringCurrText += _characArr[_stringCharLength];
				
				this.text = _stringCurrText;

				
			}
			
			if(_theTextFormat != null){
				this.setTextFormat(_theTextFormat);
			}

			_stringCharLength ++;
		}
		
		public function setTextFieldFormat(format:TextFormat):void
		{

			_theTextFormat = format;
			
		}
		
		public function dispose():void
		{
			
			this.text = '';
			
			if (_textTimerOne){
				if (_textTimerOne.hasEventListener(TimerEvent.TIMER)){

					_textTimerOne.removeEventListener(TimerEvent.TIMER, onTextTimerComplete);
					
				} 		
				_textTimerOne.stop();
				_textTimerOne = null;				
			}
			if (_textTimerTwo){
				if (_textTimerTwo.hasEventListener(TimerEvent.TIMER)){
					
					_textTimerTwo.removeEventListener(TimerEvent.TIMER, onTextTimerCompleteTwo);
					
				} 		
				_textTimerTwo.stop();
				_textTimerTwo = null;				
			}
			if (_textTimerThree){
				if (_textTimerThree.hasEventListener(TimerEvent.TIMER)){
					
					_textTimerThree.removeEventListener(TimerEvent.TIMER, onTextTimerCompleteThree);
					
				} 		
				_textTimerThree.stop();
				_textTimerThree = null;				
			}
			if (_textTimerFour){
				if (_textTimerFour.hasEventListener(TimerEvent.TIMER)){
					
					_textTimerFour.removeEventListener(TimerEvent.TIMER, onTextTimerCompleteFour);
					
				} 		
				_textTimerFour.stop();
				_textTimerFour = null;				
			}
			if (_timer){
				if (_timer.hasEventListener(TimerEvent.TIMER)){
					
					_timer.removeEventListener(TimerEvent.TIMER, onTimerComplete);
					
				} 	
				_timer.stop();
				_timer = null;				
			}
			
			if(_theTextFormat)
			{
				
				_theTextFormat = null;
				
			}
			
		}
		
	}
}