package com.shanzhutec.sat.client.spectrum;

import java.io.Serializable;

public class ConfigBean implements Serializable{
	// private int frameWidth;					//频谱仪宽度
	// private int frameHeight;				//频谱仪高度
	private int pollFreq;					//轮询间隔，单位：毫秒
	private int fontColor;					//字体颜色
	private int mainBgColor;				//主体背景颜色
	private int bgLineColor;				//背景线颜色
	private int bgLineThick;				//背景线宽度
	private int poolBgColor;				//频率池背景色
	private int poolBgLineColor;			//频率池边线颜色
	private int poolCarrierBgColor;			//频率池载波背景色
	private int poolCarrierBgLineColor;		//频率池载波边线颜色
	private int poolLineThick;				//频率池边线宽度
	private int carrierLineColor;			//载波线条颜色
	private int carrierLineThick;			//载波线条宽度
	
	// public void setFrameWidth(int width)
	// {
		// this.frameWidth = width;
	// }
	
	// public int getFrameWidth()
	// {
		// return this.frameWidth;
	// }
	
	// public void setFrameHeight(int height)
	// {
		// this.frameHeight = height;
	// }
	
	// public int getFrameHeight()
	// {
		// return this.frameHeight;
	// }
	
	public void setPollFreq(int freq)
	{
		this.pollFreq = freq;
	}
	
	public int getPollFreq()
	{
		return this.pollFreq;
	}
	
	public void setFontColor(int color)
	{
		this.fontColor = color;
	}
	
	public int getFontColor()
	{
		return this.fontColor;
	}
	
	public void setMainBgColor(int color)
	{
		this.mainBgColor = color;
	}
	
	public int getMainBgColor()
	{
		return this.mainBgColor;
	}
	
	public void setBgLineColor(int color)
	{
		this.bgLineColor = color;
	}
	
	public int getBgLineColor()
	{
		return this.bgLineColor;
	}
	
	public void setBgLineThick(int thick)
	{
		this.bgLineThick = thick;
	}
	
	public int getBgLineThick()
	{
		return this.bgLineThick;
	}
	
	public void setPoolBgColor(int color)
	{
		this.poolBgColor = color;
	}
	
	public int getPoolBgColor()
	{
		return this.poolBgColor;
	}
	
	public void setPoolBgLineColor(int color)
	{
		this.poolBgLineColor = color;
	}
	
	public int getPoolBgLineColor()
	{
		return this.poolBgLineColor;
	}
	
	public void setPoolCarrierBgColor(int color)
	{
		this.poolCarrierBgColor = color;
	}
	
	public int getPoolCarrierBgColor()
	{
		return this.poolCarrierBgColor;
	}
	
	public void setPoolCarrierBgLineColor(int color)
	{
		this.poolCarrierBgLineColor = color;
	}
	
	public int getPoolCarrierBgLineColor()
	{
		return this.poolCarrierBgLineColor;
	}
	
	public void setPoolLineThick(int thick)
	{
		this.poolLineThick = thick;
	}
	
	public int getPoolLineThick()
	{
		return this.poolLineThick;
	}
	
	public void setCarrierLineColor(int color)
	{
		this.carrierLineColor = color;
	}
	
	public int getCarrierLineColor()
	{
		return this.carrierLineColor;
	}
	
	public void setCarrierLineThick(int thick)
	{
		this.carrierLineThick = thick;
	}
	
	public int getCarrierLineThick()
	{
		return this.carrierLineThick;
	}
}