package elements
{
	[Bindable] 
	[RemoteClass(alias="com.shanzhutec.sat.client.spectrum.ConfigBean")]
	public class ConfigBean
	{
		//配置参数
		public var frameWidth:int;
		public var frameHeight:int;
		public var pollFreq:int;
		
		public var fontColor:uint;
		public var mainBgColor:uint;
		public var bgLineColor:uint;
		public var bgLineThick:int;
		public var poolBgColor:uint;
		public var poolBgLineColor:uint;
		public var poolCarrierBgColor:uint;
		public var poolCarrierBgLineColor:uint;
		public var poolLineThick:int;
		public var carrierLineColor:uint;
		public var carrierLineThick:int;
	}
}