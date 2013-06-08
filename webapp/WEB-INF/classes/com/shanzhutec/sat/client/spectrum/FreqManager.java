package com.shanzhutec.sat.client.spectrum;

import java.util.ArrayList;


public class FreqManager {
	public FrequencyBean getBean()
	{
		FrequencyBean fbean = new FrequencyBean();
		fbean.setxAxisStartN(14.0000);
		fbean.setxAxisEndN(14.0003);
		fbean.setyMax(20);
		fbean.settransponderName("tran1");
		fbean.setpoolStartN(14.0001);
		fbean.setpoolEndN(14.0002);
		ArrayList<Double> widths = new ArrayList<Double>();
		ArrayList<Double> freqs = new ArrayList<Double>();
		ArrayList<Double> heights = new ArrayList<Double>();
		ArrayList<String> names = new ArrayList<String>();
		widths.add(new Double(0.00004));
		freqs.add(new Double(14.00012));
		heights.add(new Double(21.1));
		names.add("R1");
		widths.add(new Double(0.00002));
		freqs.add(new Double(14.00015));
		heights.add(new Double(18.8));
		names.add("R2");
		fbean.setWidthOfSignals(widths);
		fbean.setFreqOfSignals(freqs);
		fbean.setHeightOfSignals(heights);
		fbean.setNameOfSignals(names);
		ArrayList<String[]> tips = new ArrayList<String[]>();
		String[] a = {"分配带宽:693KHz", "数据速率:800KBps", "符号速率:533KSps", "工作方式:QPSK", "发射电平:-31.1dbm", "发射频率:14261.0399MHz"};
		String[] b = {"分配带宽:693KHz", "数据速率:800KBps", "符号速率:533KSps", "工作方式:QPSK", "发射电平:-31.1dbm", "发射频率:14261.0399MHz"};
		tips.add(a);
		tips.add(b);
		fbean.setTooltips(tips);
		
		return fbean;
	}
}
