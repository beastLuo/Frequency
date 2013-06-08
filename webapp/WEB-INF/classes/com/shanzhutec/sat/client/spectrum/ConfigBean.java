package com.shanzhutec.sat.client.spectrum;

import java.io.Serializable;

public class ConfigBean implements Serializable{
	// private int frameWidth;					//Ƶ���ǿ��
	// private int frameHeight;				//Ƶ���Ǹ߶�
	private int pollFreq;					//��ѯ�������λ������
	private int fontColor;					//������ɫ
	private int mainBgColor;				//���屳����ɫ
	private int bgLineColor;				//��������ɫ
	private int bgLineThick;				//�����߿��
	private int poolBgColor;				//Ƶ�ʳر���ɫ
	private int poolBgLineColor;			//Ƶ�ʳر�����ɫ
	private int poolCarrierBgColor;			//Ƶ�ʳ��ز�����ɫ
	private int poolCarrierBgLineColor;		//Ƶ�ʳ��ز�������ɫ
	private int poolLineThick;				//Ƶ�ʳر��߿��
	private int carrierLineColor;			//�ز�������ɫ
	private int carrierLineThick;			//�ز��������
	
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