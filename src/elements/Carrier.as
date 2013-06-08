package elements
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	import mx.containers.Canvas;
	import mx.controls.Label;
	import mx.core.Application;

	public class Carrier extends Canvas implements Refreshable
	{
		public var _bandWidth:Number;
		public var _frequency:Number;
		public var _name:Label;
		public var _wave:Wave;
		public var _wHeight:Number;
		public var _xAxis:XAxis;
		public var _bg:Background;
		public var _fp:FrePool; 
		public var _xStart:Number;
		public var _xEnd:Number;
		public var _startN:Number;
		public var _endN:Number;
		public var _rectStart:Number;
		public var _rectEnd:Number;
		
		public var _leftDown:Point;
		public var _leftUp:Point;
		public var _rightDown:Point;
		public var _rightUp:Point;
		
		public var _leftShake:Point;
		public var _rightShake:Point;
		public var _shaker:Canvas;
		
		public var _lineThick:int = 1;
		public var _lineColor:uint = 0x00ff00;
		
		public function Carrier(band:Number, fre:Number, h:Number, name:String)
		{
			super();
			_bandWidth = band;
			_frequency = fre;
			_wHeight = h;
			_name = new Label;
			_name.setStyle("color", Application.application.fontColor);
			_name.text = name;
			addChild(_name);
			_wave = new Wave;
			addChild(_wave);
			_shaker = new Canvas;
			addChild(_shaker);
			//this.doubleClickEnabled = true; 
			this.addEventListener(MouseEvent.CLICK, expand);
		}
		
		public function setLineStyle(thick:int, color:uint):void
		{
			this._lineThick = thick;
			this._lineColor = color;
		}
		
		public function setRefresh(xAxis:XAxis, bg:Background, fp:FrePool):void
		{
			this._xAxis = xAxis;
			this._bg = bg;
 			this._fp = fp; 
 			var rect:RectBG = new RectBG;
			this._fp.setBlueRect(rect, this);
		}
		
		public function refresh():void
		{
			var xWidth:Number = _xAxis._end.x - _xAxis._start.x;
			_startN = _frequency - _bandWidth/2;
			_endN = _frequency + _bandWidth/2;
			_rectStart = (_startN - _xAxis._startN)/(_xAxis._endN - _xAxis._startN) * xWidth;
			_rectEnd = (_endN - _xAxis._startN)/(_xAxis._endN - _xAxis._startN) * xWidth;
			_xStart = _rectStart + 0.2*(_rectEnd-_rectStart);
			_xEnd = _rectEnd - 0.2*(_rectEnd-_rectStart);
			var h:Number;
			if(_wHeight <= _bg._yMax)
				h = _wHeight/_bg._yMax * _bg._stageHeight;
			else h = _bg._stageHeight+10;
			
			_leftDown = new Point(0, h);
			_leftUp = new Point(5, 0);
			_rightUp = new Point(_xEnd - _xStart - 5, 0);
			_rightDown = new Point(_xEnd - _xStart, h);
			
			_wave.drawWave(_leftDown, _leftUp, _rightUp, _rightDown, _lineThick, _lineColor);
			this.x = _xStart;
			this.y = _bg._stageHeight - h;
			
			_leftShake = new Point(this.x, _bg._stageHeight);
			_rightShake = new Point(_xEnd - _xStart + this.x, _bg._stageHeight);
			
			var tf:TextField = new TextField;
			tf.text = _name.text;
			_name.x = (_xEnd - _xStart - tf.textWidth * 1.4) / 2;
			_name.y = h - 20;
			if(tf.textWidth >= _xEnd - _xStart && this.contains(_name))
			{
				this.removeChild(_name);
			}
			else if(tf.textWidth < _xEnd - _xStart && !this.contains(_name))
			{
				this.addChild(_name);
			}
			
			this._fp.refresh();
		}
		
		public function expand(e:MouseEvent):void
		{
			this._bg.doExpand(this);
			trace(e.stageX);
			trace(e.stageY);
		}
		 /* public function shrink(e:MouseEvent):void
		{
			this._xAxis.setBothEnds(lastStartN, lastEndN);
			this.removeEventListener(MouseEvent.DOUBLE_CLICK, shrink);
			this.addEventListener(MouseEvent.DOUBLE_CLICK, expand);
			this._bg.refresh();
		}  */
		public function setToolTip(content:String):void
		{
			this.toolTip = "";
			this.toolTip += "\t\t" + _name.text + "站\r\n";
			var s:Array = content.split(",");
			for(var i:int = 0; i < s.length; i++)
			{
				this.toolTip += s[i] + "\r\n";
			}
		}
		public function doShake():void
		{
			shake(this._leftUp, this._rightUp, _shaker);
		}
		public function shake(point1:Point, point2:Point, wave:Canvas):void
		{
			if(point2.x - point1.x < 10)
			{
				wave.graphics.clear();
				return;
			}
			var n:int;
			for(n = 10; (point2.x - point1.x)/n > 10; n+=10)
			;
			wave.graphics.clear();
			wave.graphics.lineStyle(_lineThick, _lineColor);
			wave.graphics.moveTo(point1.x, point1.y);
			for(var i:int = 1; i <= n; ++i)
			{
				wave.graphics.lineTo(point1.x + i*(point2.x - point1.x)/n, point1.y+Math.random()*5-2);
			}
			
		}
		  protected override function measure():void
		{
			super.measure();
			measuredWidth = _xEnd - _xStart;
			measuredHeight = _leftDown.y;
		}  
	}
}