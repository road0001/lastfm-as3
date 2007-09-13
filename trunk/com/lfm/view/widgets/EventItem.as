package com.lfm.core.view.widgets {

    import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.*;
	import flash.events.Event;
	import flash.utils.Timer;
    import flash.events.TimerEvent;

	import fl.transitions.*; 
	import fl.transitions.easing.*;
		
	public class EventItem extends Sprite {
		private var txtLineup:TextField;
		private var txtLocation:TextField;
		private var txtDateHead:TextField;
		private var txtDateBody:TextField;
		private var _style:String;
		
		private var _styles:Object = {
			'black':{headerColor:0x000000,
				     lineupFontColor:0xFFFFFF,
					 locationFontColor:0x999999,
					 separatorColor:0x333333},
			'red':{headerColor:0xD01F3C,
			       lineupFontColor:0xD01F3C,
				   locationFontColor:0x848484,
				   separatorColor:0x666666},
			'blue':{headerColor:0x4F8ABF,
			        lineupFontColor:0x4F8ABF,
					locationFontColor:0x9B9B9B,
					separatorColor:0x9B9B9B},
			'grey':{headerColor:0x9F9F9F,
			        lineupFontColor:0x000000,
					locationFontColor:0x666666,
					separatorColor:0x666666} 
		};
		
		
		public function EventItem(style:String='black') {
			_style = style;
			initText();
			initCal();
		}
		
		//Initialize all TextFields
		private function initText():void {

			txtLineup = new TextField();
			txtLocation = new TextField();
			txtDateHead = new TextField();
			txtDateBody = new TextField();
			
			var format:TextFormat = new TextFormat();
			format.font = "Arial";
			format.size = 11;
			format.color = _styles[_style]['lineupFontColor'];
			
			//Lineup text init and masking
			txtLineup.x = 34;
			txtLineup.y = 3.4;
			txtLineup.autoSize = TextFieldAutoSize.LEFT;
			txtLineup.antiAliasType = AntiAliasType.ADVANCED;
			txtLineup.height = 17;
			txtLineup.defaultTextFormat = format;
			txtLineup.selectable = false;
			var maskArea = new Sprite();
			maskArea.graphics.beginFill(0xFF0000);
			maskArea.graphics.drawRect(txtLineup.x, txtLineup.y, 147.8, 17);
			txtLineup.mask = maskArea;
			addChild(maskArea);
			addChild(txtLineup);
			
			var format2:TextFormat = new TextFormat();
			format2.font = "Arial";
			format2.size = 11;
			format2.color = _styles[_style]['lineupFontColor'];
			//Location text init and masking
			txtLocation.x = 34;
			txtLocation.y = 21.3;
			txtLocation.autoSize = TextFieldAutoSize.LEFT;
			txtLocation.height = 17;
			format2.color = _styles[_style]['locationFontColor'];
			txtLocation.defaultTextFormat = format2;
			txtLocation.selectable = false;
			maskArea = new Sprite();
			maskArea.graphics.beginFill(0xFF0000);
			maskArea.graphics.drawRect(txtLocation.x, txtLocation.y, 147.8, 17);
			txtLocation.mask = maskArea;
			addChild(maskArea);
			addChild(txtLocation);
			
			txtDateHead.x = 5.3;
			txtDateHead.y = 4.8;
			txtDateHead.width = 25;
			txtDateHead.height = 14.3;
			format.color = 0xFFFFFF;
			format.size = 9;
			format.align = TextFormatAlign.CENTER;
			format.bold = true;
			txtDateHead.autoSize = TextFieldAutoSize.NONE;
			txtDateHead.defaultTextFormat = format;
			txtDateHead.selectable = false;
			addChild(txtDateHead);
			
			txtDateBody.x = 6;
			txtDateBody.y = 17.7;
			txtDateBody.width = 25;
			txtDateBody.height = 23;
			format.color = 0x000000;
			format.size = 17;
			format.align = TextFormatAlign.CENTER;
			format.bold = true;
			txtDateBody.autoSize = TextFieldAutoSize.NONE;
			txtDateBody.defaultTextFormat = format;
			txtDateBody.selectable = false;
			addChild(txtDateBody);
			
		}
		
		private function initCal():void {
			//Draw white mini-calendar
			graphics.beginFill(0xFFFFFF);
			graphics.lineStyle(1,0xBABABA);
			graphics.drawRect(4.8, 4.8, 26, 34.3);
			graphics.endFill();
			//Draw grey mini-calendar header
			//graphics.beginFill(0x9F9F9F);
			graphics.beginFill(_styles[_style]['headerColor']);
			graphics.lineStyle(0,0x9F9F9F);
			graphics.drawRect(5.3, 5.3, 24.5, 14.5);
			graphics.endFill();
			//Item separator
			graphics.lineStyle(1,_styles[_style]['separatorColor']);
			graphics.moveTo(.3,44);
			graphics.lineTo(185.7,44);
		}
		
		/*private function initTweenTimer():void {
			var myTimer:Timer = new Timer(3500, 1);
			myTimer.addEventListener("timer", initTween);
			myTimer.start();
		}
		
		private function initTween(event:Event):void {
			if(txtLineup.textWidth > 147.8) {
				var lineupTween:Tween = new Tween(txtLineup, "x", None.easeNone, txtLineup.x, txtLineup.textWidth*-1, 5, true);
				lineupTween.FPS = 20;
				lineupTween.addEventListener("motionFinish",backIn);
			}
			
			if(txtLocation.textWidth > 147.8) {
				var locationTween:Tween = new Tween(txtLocation, "x", None.easeNone, txtLocation.x, txtLocation.textWidth*-1, 5, true);
				locationTween.FPS = 20;
				locationTween.addEventListener("motionFinish",backIn);
			}
		}
		
		private function backIn(event:Event):void {
			event.target.obj.x = event.target.begin+147.8;
			var myTween:Tween = new Tween(event.target.obj, "x", None.easeNone, event.target.begin+(147.8+40), event.target.begin, 4, true);
			myTween.FPS = 20;
			myTween.addEventListener("motionFinish",function() { initTweenTimer() });
		}*/
		
		
		public function set lineup(txt:String):void {
			txtLineup.htmlText = txt;
			//initTweenTimer();
		}
		
		public function set location(txt:String):void {
			txtLocation.htmlText = txt;
			//initTweenTimer();
		}
		
		public function set dateHead(txt:String):void {
			txtDateHead.htmlText = txt;
		}
		
		public function set dateBody(txt:String):void {
			txtDateBody.htmlText = txt;
		}
		
		
		
	}
	
	
}