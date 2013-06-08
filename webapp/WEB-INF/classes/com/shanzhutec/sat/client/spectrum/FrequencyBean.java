package com.shanzhutec.sat.client.spectrum;

import java.io.Serializable;
import java.util.List;


public class FrequencyBean implements Serializable {
	private double xAxisStartN;				//��������ʼ���Ƶ��ֵ����λ��GHz
	private double xAxisEndN;				//������������Ƶ��ֵ����λ��GHz
	private int yMax;						//���������ֵ����λ��dB
	private String transponderName;			//ת��������
	private double poolStartN;				//Ƶ�ʳ���ʼ���Ƶ��ֵ����λ��GHz
	private double poolEndN;				//Ƶ�ʳؽ������Ƶ��ֵ����λ��GHz
	private List<Double> widthOfSignals;	//�ز���Ƶ����λ��GHz
	private List<Double> freqOfSignals;		//�ز���Ƶ��ֵ����λ��GHz
	private List<Double> heightOfSignals;	//�ز��ĸ߶�ֵ����λ��dB
	private List<String> nameOfSignals;		//�ز�����
	private List<String[]> tooltips;		//�ز�˵����ǩ
	
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
