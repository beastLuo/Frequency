package elements
{
	import flash.text.TextField;
	
	import mx.controls.Label;
	import mx.core.Application;

	public class Tag extends Label
	{
		public var _unit:String = "";
		public var _fixed:uint;
		public var _num:Number;
		public var _textW:Number;
		
		public function Tag()
		{
			super();
			this.setStyle("color", Application.application.fontColor);
		}
		public function setUnit(s:String):void
		{
			_unit = s;
		}
		public function setNum(n:Number, fixed:uint = 4):void
		{
			_num = n;
			_fixed = fixed;
			var tf:TextField = new TextField();
			tf.text = _num.toFixed(_fixed) + _unit;
			_textW = tf.textWidth * 1.4;
			if(this.x + _textW > Application.application.main.width)
			{
				this.x = Application.application.main.width - _textW;
			} 
			this.text = tf.text;
		}
	}
}