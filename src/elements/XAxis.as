package elements
{
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.core.Application;

	public class XAxis extends Canvas
	{
		public var _start:Point;
		public var _end:Point;
		public var _startTag:Tag;
		public var _endTag:Tag;
		public var _midTag:Tag;
		
		public var _startN:Number;
		public var _endN:Number;
		
		public var _unit:String;
		
		public var _wPointPairs:ArrayCollection;
		public var _waves:Array;
		
		public var _lineColor:uint;
		public var _lineThick:int;
		
		public function XAxis(start:Point, end:Point, color:uint = 0x006600, thick:int = 1)
		{
			super();
			_start = start;
			_end = end;
			_lineColor = color;
			_lineThick = thick;
			_wPointPairs = new ArrayCollection;
			_waves = new Array;
			init();
		}
		
		public function init():void
		{
			graphics.lineStyle(_lineThick, _lineColor);
			graphics.moveTo(_start.x, _start.y);
			graphics.lineTo(_end.x, _end.y);
			
			_startTag = new Tag;
			_endTag = new Tag;
			_midTag = new Tag;
			
			_startTag.x = _start.x;
			_startTag.y = _start.y + 5;

			_endTag.x = _end.x - 5;
			_endTag.y = _startTag.y;
			
			_midTag.y = _startTag.y;
			
			addChild(_startTag);
			addChild(_endTag);
			addChild(_midTag);
		}
		public function setBothEnds(startN:Number, endN:Number, unit:String = "G"):void
		{
			_startN = startN;
			_endN = endN;
			_unit = unit;
			_startTag.setUnit(_unit);
			_startTag.setNum(_startN);
			_endTag.setUnit(_unit);
			_endTag.setNum(_endN); 
			_midTag.setUnit(_unit);
			_midTag.setNum((_startN + _endN)/2);
			
			_midTag.x = (Application.application.main.width - _midTag._textW) / 2;
		}
		
		//添加载波的标签
		public function addTag():void
		{}
	}
}