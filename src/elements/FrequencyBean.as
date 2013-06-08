package elements
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="com.shanzhutec.sat.client.spectrum.FrequencyBean")]
	public class FrequencyBean
	{
		//绘图参数
		public var xAxisStartN:Number;
		public var xAxisEndN:Number;
		public var yMax:int;
		public var transponderName:String;
		public var poolStartN:Number;
		public var poolEndN:Number;
		public var widthOfSignals:ArrayCollection;
		public var freqOfSignals:ArrayCollection;
		public var heightOfSignals:ArrayCollection;
		public var nameOfSignals:ArrayCollection;
		public var tooltips:ArrayCollection;
		
	}
}