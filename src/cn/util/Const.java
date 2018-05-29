package cn.util;

import java.text.SimpleDateFormat;
import java.util.Date;


public class Const {
   
    public static final String ROOT="/friend/";
    
    public static final Integer VIP_FEE_PER_MONTH = 9900; // 单位为分

    public static String getCurrentDay(){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	return sdf.format(new Date());
    }
    
    public static String getCurrentTime(){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	return sdf.format(new Date());
    }
    
    public static String getFileId(){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
    	return sdf.format(new Date());
    }
    
}
