package com.shanzhutec.sat.client.spectrum;

public class ConfigManager{
	public ConfigBean getBean()
	{
		ConfigBean cb = new ConfigBean();
		
		cb.setPollFreq(500);
		cb.setFontColor(0x00ff00);
		cb.setMainBgColor(0x000000);
		cb.setBgLineColor(0x00ff00);
		cb.setBgLineThick(2);
		cb.setPoolBgColor(0x063c06);
		cb.setPoolBgLineColor(0x00ff00);
		cb.setPoolCarrierBgColor(0x092f4c);
		cb.setPoolCarrierBgLineColor(0x0f13f2);
		cb.setPoolLineThick(1);
		cb.setCarrierLineColor(0x00ff00);
		cb.setCarrierLineThick(1);
		
		return cb;
	}
}