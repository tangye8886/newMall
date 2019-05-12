package com.tangye.mall.utils;

public class PageUtils {
	
	public static final int PAGE_SIZE=10;
	
	public static long getPages(long count)
	{
		long pages=1;
		if((count%PAGE_SIZE)==0)//可以整除
		{
			pages=(count/PAGE_SIZE);
		}else 
		{
			pages=(count/PAGE_SIZE)+1;
		}
		return pages;
	}
}
