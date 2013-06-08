package elements
{
	import flash.text.TextField;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.controls.Label;
	import mx.core.Application;

	public class FrePool extends Canvas implements Refreshable
	{
		public var _startN:Number;
		public var _endN:Number;
		public var _rectG:RectBG;
		public var _title:Label;
		public var _greenRectH:Number;
		public var _blueRectH:Number;
		public var _xAxis:XAxis;
		public var _rects:ArrayCollection;
		public var _carriers:ArrayCollection;
		public var _mainColor:uint = 0x063c06;
		public var _mainVlineColor:uint = 0x00ff00;
		public var _waveBgColor:uint = 0x092f4c;
		public var _waveBgVlineColor:uint = 0x0f13f2;
		public var _lineThick:int = 1;
		
		public function FrePool(startN:Number, endN:Number, unit:String = "G")
		{
			super();
			_startN = startN;
			_endN = endN;
			_title = new Label;
			_title.setStyle("color", Application.application.fontColor);
			_rectG = new RectBG;
			_rects = new ArrayCollection;
			_carriers = new ArrayCollection; 
			var tf:TextField = new TextField;
			var diffVal:Number
			if(unit == "G")
				diffVal = (_endN - _startN) * 1000;
			else diffVal = _endN - _startN;
			var midVal:Number = (_startN + _endN) / 2;
			if(diffVal < 1.000)
			{
				_title.text = (diffVal*1000).toFixed(0) + " KHz  " + midVal.toFixed(3) + unit;
			}else 
			{
				_title.text = diffVal.toFixed(1) + " MHz  " + midVal.toFixed(3) + unit;
			} 
			this.horizontalScrollPolicy = "off";
			this.verticalScrollPolicy = "off";
			
			this.addChild(_rectG);
			this.addChild(_title);
		}
		
		public function setDrawStyle(mainColor:uint, mainVlineColor:uint, waveBgColor:uint, waveBgVlineColor:uint, lineThick:int):void
		{
			this._mainColor = mainColor;
			this._mainVlineColor = mainVlineColor;
			this._waveBgColor = waveBgColor;
			this._waveBgVlineColor = waveBgVlineColor;
			this._lineThick = lineThick;
		}
		
		public function setRefresh(xAxis:XAxis):void
		{
			this._xAxis = xAxis;
			this._greenRectH = Application.application.main.height*0.66;
			this._blueRectH = Application.application.main.height*0.40;
		}
		
		public function refresh():void
		{
			/* this._rectG.graphics.clear(); */
			
			var midVal:Number = (_startN + _endN) / 2;
			var xWidth:Number = _xAxis._end.x - _xAxis._start.x;
			this.width = (_endN - _startN) / (_xAxis._endN - _xAxis._startN) * xWidth;
			this.x = (_startN - _xAxis._startN) / (_xAxis._endN - _xAxis._startN) * xWidth;
			this.y = Application.application.main.height - _greenRectH - 30;
			_rectG.drawBG(0, 0, this.width, _greenRectH, _mainColor);
			_rectG.drawVLine(0, 0, _greenRectH, _mainVlineColor, _lineThick);
			_rectG.drawVLine(this.width, 0, _greenRectH, _mainVlineColor, _lineThick);
			var tf:TextField = new TextField;
			tf.text = _title.text;
			if(this.width > tf.textWidth * 1.3)
			{
				_title.x = (this.width - tf.textWidth * 1.3) / 2;
				this.addChild(_title);
			}
			else if(this.contains(_title)) this.removeChild(_title);
			 var rect:RectBG;
			var carrier:Carrier;
			for(var i:int = 0; i < _rects.length; i++)
			{
				rect = _rects[i];
				carrier = _carriers[i];
				refreshBlueRect(rect, carrier);
			} 
		}
		
		 public function refreshBlueRect(rect:RectBG, c:Carrier):void
		{
			 if(this.x <= c._rectStart && this.x + this.width >= c._rectEnd)
			{
				this.addChild(rect);
				var ybegin:Number = _greenRectH - _blueRectH;
				rect.drawBG(0, ybegin, c._rectEnd - c._rectStart, _blueRectH, _waveBgColor);
				rect.drawVLine(0, ybegin, _blueRectH, _waveBgVlineColor, _lineThick);
				rect.drawVLine(c._rectEnd - c._rectStart, ybegin, _blueRectH, _waveBgVlineColor, _lineThick);
				rect.x = c._rectStart - this.x;
			} 
		} 
		
		 public function setBlueRect(blueRect:RectBG, carrier:Carrier):void
		{
			_rects.addItem(blueRect);
			this.addChild(blueRect);
			_carriers.addItem(carrier);
		} 
	}
}