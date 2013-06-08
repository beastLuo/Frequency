package elements
{
	import flash.geom.Point;
	
	import mx.containers.Canvas;

	public class Wave extends Canvas
	{
		public function Wave()
		{
			super();
		}
		
		public function drawWave(point1:Point, point2:Point, point3:Point, point4:Point, thickNess:int, color:uint):void
		{
			graphics.clear();
			if(point4.x - point1.x < 10)
			{
				graphics.lineStyle(thickNess, color);
				graphics.moveTo(point1.x, point1.y);
				graphics.lineTo(point1.x, point2.y);
				graphics.lineTo(point4.x, point3.y);
				graphics.lineTo(point4.x, point4.y);
			}
			else
			{
				graphics.lineStyle(thickNess, color);
				graphics.moveTo(point1.x, point1.y);
				graphics.lineTo(point2.x, point2.y);
				graphics.lineTo(point3.x, point3.y);
				graphics.lineTo(point4.x, point4.y);
			}
		}
	}
}