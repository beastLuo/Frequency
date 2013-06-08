package elements
{
	import mx.containers.Canvas;

	public class RectBG extends Canvas
	{
		
		public function RectBG()
		{
			super();
		}
		
		public function drawBG(x:int, y:int, width:int, height:int, color:uint):void
		{
			graphics.clear();
			graphics.beginFill(color, 0.7);
			graphics.drawRect(x, y, width, height);
			graphics.endFill();
		}
		
		public function drawVLine(x:int, y:int, long:int, color:uint, lineThick:int):void
		{
			graphics.lineStyle(lineThick, color);
			graphics.moveTo(x, y);
			graphics.lineTo(x, y+long);
		}
	}
}