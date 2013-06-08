package elements
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.controls.Label;
	import mx.core.Application;

	public class Background extends Canvas implements Refreshable
	{
		public var _divN:Number;
		public var _tags:ArrayCollection;
		public var _difTag:Tag;
		public var _title:Label;
		public var _yMax:int;
		public var _xAxis:XAxis;
		public var _dragZone:Canvas; 
		public var _xBeforeDrag:Number;
		public var _pools:Array;
		public var _carriers:Array;
		public var _forbidAreas:Array;
		public var _shaker:Canvas;
		public var _stageHeight:Number;
		public var _lineColor:uint = 0x006600;
		public var _lineThick:int = 1;
		
		public function Background(w:Number, h:Number)
		{
			super();
			_pools = new Array;
			_carriers = new Array;
			_forbidAreas = new Array;
			_shaker = new Canvas;
			addChild(_shaker);
			this.verticalScrollPolicy = "off";
			this.horizontalScrollPolicy = "off";
			this.x = 0;
			this.y = 0;
			this.width = w;
			this.height = h;
			this._stageHeight = h - 30;
			_difTag = new Tag;
			_tags = new ArrayCollection;
			_dragZone = new Canvas;
			_dragZone.horizontalScrollPolicy = "off";
			_dragZone.verticalScrollPolicy = "off";
			_dragZone.width = this.width;
			addChild(_dragZone); 
			_title = new Label;
			_title.setStyle("color", Application.application.fontColor);
			this.addEventListener(MouseEvent.MOUSE_DOWN, doDrag);
			this.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			this.addEventListener(MouseEvent.MOUSE_WHEEL, doAmp);
		}
		
		public function setLineStyle(color:uint, thick:int):void
		{
			this._lineColor = color;
			this._lineThick = thick;
		}
		
		public function setPool(fp:FrePool):void
		{
			_pools.push(fp);
			this.addChild(fp);
		}
		
		public function setCarrier(c:Carrier):void
		{
			_carriers.push(c);
			this.addChild(c);
		}
		
		public function clearFpool():void
		{
			var fp:FrePool;
			for(var i:int = 0; i < _pools.length; i++)
			{
				fp = _pools[i];
				this.removeChild(fp);
			}
			_pools = new Array;
		}
		
		public function clearCarrier():void
		{
			var c:Carrier;
			for(var i:int = 0; i < _carriers.length; i++)
			{
				c = _carriers[i];
				this.removeChild(c);
			}
			_carriers = new Array;
		}
		
		public function drawDivLine(divN:Number = 4):void
		{
			_divN = divN;
			var dist:Number = this._stageHeight/_divN;
			
			for(var i:int = 1; i < divN; i++)
			{
				graphics.lineStyle(_lineThick, _lineColor);
				graphics.moveTo(0, dist * i);
				graphics.lineTo(this.width, dist * i);
			}
		}
		
		public function setYTag(yMax:int, yUnit:String):void
		{
			var tag:Tag;
			if(_tags.length > 0)
			{
				for(var i:int = 0; i < _tags.length; i++)
				{
					tag = _tags[i];
					this.removeChild(tag);
				}
				_tags = new ArrayCollection;
			}
			_yMax = yMax;
			var dist:Number = this._stageHeight/_divN;
			for(var i:int = 0; i < _divN; i++)
			{
				tag = new Tag;
				tag.x = this.x + 5;
				tag.y = this.y + i * dist;
				tag.setUnit(yUnit);
				tag.setNum(yMax * (1 - i/_divN), 0);
				addChild(tag);
				_tags.addItem(tag);
			}
		}
		
		
		
		public function setTitle(transitionName:String, xAxis:XAxis):void
		{
			var tf:TextField = new TextField;
			tf.text = transitionName;
			_title.x = this.width/2 - (tf.textWidth * 1.4 / 2);
			addChild(_title);
			_title.text = tf.text;
			
			setRefresh(xAxis);
			addChild(_difTag);
		}
		public function setRefresh(xAxis:XAxis):void
		{
			this._xAxis = xAxis;
		}
		
		public function refresh():void
		{
			var dif:Number;
			_difTag.x = this.width - 20;
			if(_xAxis._unit == "G")
			{
				dif = (_xAxis._endN - _xAxis._startN) * 1000;
			}
			else
			{
				dif = _xAxis._endN - _xAxis._startN;
			}
			if(dif < 1.000)
			{
				_difTag.setUnit("K");
				_difTag.setNum(dif*1000, 0);
			}else
			{
				_difTag.setUnit("M");
				_difTag.setNum(dif, 1);
			}
			
			var fp:FrePool;
			for(var i:int = 0; i < _pools.length; i++)
			{
				fp = _pools[i]
				fp.refresh();
			}
			
			var c:Carrier;
			for(var i:int = 0; i < _carriers.length; i++)
			{
				c = _carriers[i];
				c.refresh();
			}
			shakeInit();
		}
		
		public function shakeInit():void
		{
			_forbidAreas = new Array;
			var area:Array;
			var c:Carrier;
			for(var i:int = 0; i < _carriers.length; i++)
			{
				area = new Array;
				c = _carriers[i];
				area.push(c._leftShake.x);
				area.push(c._rightShake.x);
				_forbidAreas.push(area);
			}
			var comp:Function = function(a:Array, b:Array):int{
					if(a[0] < b[0]) return -1;
					if(a[0] > b[0]) return 1;
					else return 0;
				}
			_forbidAreas.sort(comp);
		}
		public function doDrag(e:MouseEvent):void
		{
			this._xBeforeDrag = e.stageX;
			this.last = e.stageX;
			this.addEventListener(MouseEvent.MOUSE_MOVE, doMove);
		}
		
		public function endDrag(e:MouseEvent):void
		{
			this.removeEventListener(MouseEvent.MOUSE_MOVE, doMove);
			this.removeEventListener(MouseEvent.ROLL_OUT, endDrag);
			this.addEventListener(MouseEvent.MOUSE_DOWN, doDrag);
		}
		public var last:Number;
		public function doMove(e:MouseEvent):void
		{
			var diff:Number = e.stageX - last;
			last = e.stageX;
			
			var diffN:Number = (this._xAxis._endN - this._xAxis._startN) * (diff / this.width);
			this._xAxis.setBothEnds(this._xAxis._startN - diffN, this._xAxis._endN - diffN);
			this.addEventListener(MouseEvent.ROLL_OUT, endDrag);
			this.refresh();
		}
		public function doAmp(e:MouseEvent):void
		{	
			var factor:Number = 1 + e.delta/100;
			var newDiffN:Number = (this._xAxis._endN - this._xAxis._startN) * factor;
			this._xAxis.setBothEnds(this._xAxis._startN, this._xAxis._startN + newDiffN);
			this.refresh();
		}
		public function doShake():void
		{
			this.setChildIndex(_shaker, this.getChildren().length-1);
			var c:Carrier;
			for(var i:int = 0; i < _carriers.length; i++)
			{
				c = _carriers[i];
				c.doShake();
			}
			_shaker.graphics.clear();
			var start:Point = new Point(0, this._stageHeight);
			var end:Point = new Point(this.width, this._stageHeight);
			if(_forbidAreas.length == 0)
			{
				shake(start, end, false);
			}
			else
			{
				var area:Array;
				for(var i:int = 0; i < _forbidAreas.length; i++)
				{
					c = _carriers[i];
					area = _forbidAreas[i];
					if(c._wHeight <= 0)
					{
						shake(new Point(area[0], this._stageHeight), new Point(area[1], this._stageHeight), true);
					}
					if(start.x < area[0])
					{
						end.x = area[0];
						shake(start, end, false);
						start.x = area[1];
						if(i == _forbidAreas.length-1)
						{
							end.x = this.width;
							shake(start, end, false);
						}
					}
					else if(start.x > area[1])
					{
						if(i == _forbidAreas.length-1)
						{
							shake(start, end, false);
						}
					}
					else if(start.x > area[0] && start.x < area[1])
					{
						start.x = area[1];
						if(i == _forbidAreas.length-1)
						{
							end.x = this.width;
							shake(start, end, false);
						}
					}
				}
			}
		}
		public function shake(point1:Point, point2:Point, isRed:Boolean):void
		{
			var n:int;
			for(n = 10; (point2.x - point1.x)/n > 10; n+=10)
			;
			if(isRed) _shaker.graphics.lineStyle(_lineThick, 0xff0000);
			else _shaker.graphics.lineStyle(_lineThick, _lineColor);
			_shaker.graphics.moveTo(point1.x, point1.y);
			for(var i:int = 1; i <= n; ++i)
			{
				_shaker.graphics.lineTo(point1.x + i*(point2.x - point1.x)/n, point1.y+Math.random()*5-2);
			}
			
		}
		
		private var isExpand:Boolean = false;
		private var lastStartN:Number;
		private var lastEndN:Number;
		public function doExpand(c:Carrier):void
		{
			if(!isExpand)
			{
				lastStartN = this._xAxis._startN;
				lastEndN = this._xAxis._endN;
				this._xAxis.setBothEnds(c._startN - (c._endN - c._startN)/5, c._endN + (c._endN - c._startN)/5);
				this.refresh();
				isExpand = !isExpand;
			}else{
				this._xAxis.setBothEnds(lastStartN, lastEndN);
				this.refresh();
				isExpand = !isExpand;
			}
		}
	}
}