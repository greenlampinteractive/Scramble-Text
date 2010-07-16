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
		
		private var _timerTime:int=15;
		
		private var _timerArr:Array=[];
		
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

			for (var i:int=0; i < 6; i ++)
			{
				
				var timer:Timer = new Timer(i * 4);
				timer.addEventListener(TimerEvent.TIMER, onTextTimerComplete);
				timer.start();
				
				_timerArr.push(timer);
				
			}
	
		}
		
		private function onTextTimerComplete(evt:TimerEvent):void
		{
			
			var theArr:Array = TextHelper.randomTextArr();
			
			var scrambleStr:String=theArr[Math.floor(Math.random() * theArr.length)];
			
			this.htmlText = this.text + scrambleStr;
			
			
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
			

			if (_stringCurrText.length == _characArr.length - 6 ){
				
				_timer.removeEventListener(TimerEvent.TIMER, onTimerComplete);
				_timer.stop();
				_timer = null;
				
				for (var i:int=0; i < _timerArr.length; i ++)
				{
	
					_timerArr[i].removeEventListener(TimerEvent.TIMER, onTextTimerComplete);
					_timerArr[i].stop();
					_timerArr[i] = null;
					
				}
				
				this.htmlText = _string;
				
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
			
			for (var i:int=0; i < _timerArr.length; i ++)
			{
				
				if (_timerArr[i]){
					if(_timerArr[i].hasEventListener(TimerEvent.TIMER)){
						_timerArr[i].removeEventListener(TimerEvent.TIMER, onTextTimerComplete);
					}
					
					_timerArr[i].stop();
					_timerArr[i] = null;
				}				
				
			}
			
			if(_theTextFormat)
			{
				
				_theTextFormat = null;
				
			}
			
			_timerArr = [];
			
		}
		
	}
}