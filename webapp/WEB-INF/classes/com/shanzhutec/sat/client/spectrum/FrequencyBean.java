package com.shanzhutec.sat.client.spectrum;

import java.io.Serializable;
import java.util.List;


public class FrequencyBean implements Serializable {
	private double xAxisStartN;				//横坐标起始点的频率值，单位：GHz
	private double xAxisEndN;				//横坐标结束点的频率值，单位：GHz
	private int yMax;						//纵坐标最大值，单位：dB
	private String transponderName;			//转发器名称
	private double poolStartN;				//频率池起始点的频率值，单位：GHz
	private double poolEndN;				//频率池结束点的频率值，单位：GHz
	private List<Double> widthOfSignals;	//载波的频宽，单位：GHz
	private List<Double> freqOfSignals;		//载波的频率值，单位：GHz
	private List<Double> heightOfSignals;	//载波的高度值，单位：dB
	private List<String> nameOfSignals;		//载波名称
	private List<String[]> tooltips;		//载波说明标签
	
	public void setxAxisStartN(double start)
	{
		this.xAxisStartN = start;
	}
	public double getxAxisStartN()
	{
		return this.xAxisStartN;
	}
	
	public void setxAxisEndN(double end)
	{
		this.xAxisEndN = end;
	}
	public double getxAxisEndN()
	{
		return this.xAxisEndN;
	}
	
	public void setyMax(int max)
	{
		this.yMax = max;
	}
	public int getyMax()
	{
		return this.yMax;
	}
	
	public void settransponderName(String name)
	{
		this.transponderName = name;
	}
	public String gettransponderName()
	{
		return this.transponderName;
	}
	
	public void setpoolStartN(double start)
	{
		this.poolStartN = start;
	}
	public double getpoolStartN()
	{
		return this.poolStartN;
	}
	
	public void setpoolEndN(double end)
	{
		this.poolEndN = end;
	}
	public double getpoolEndN()
	{
		return this.poolEndN;
	}
	
	public void setWidthOfSignals(List<Double> widths)
	{
		this.widthOfSignals = widths;
	}
	public List<Double> getWidthOfSignals()
	{
		return this.widthOfSignals;
	}
	
	public void setFreqOfSignals(List<Double> freqs)
	{
		this.freqOfSignals = freqs;
	}
	public List<Double> getFreqOfSignals()
	{
		return this.freqOfSignals;
	}
	
	public void setHeightOfSignals(List<Double> heights)
	{
		this.heightOfSignals = heights;
	}
	public List<Double> getHeightOfSignals()
	{
		return this.heightOfSignals;
	}
	
	public void setNameOfSignals(List<String> names)
	{
		this.nameOfSignals = names;
	}
	public List<String> getNameOfSignals()
	{
		return this.nameOfSignals;
	}
	
	public void setTooltips(List<String[]> tips)
	{
		this.tooltips = tips;
	}
	
	public List<String[]> getTooltips()
	{
		return this.tooltips;
	}
	
}
