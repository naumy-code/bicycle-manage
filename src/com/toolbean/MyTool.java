package com.toolbean;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyTool {
    public static String toChinese(String str) {
        if(str == null) {
            str="";
        }
        try {
            str = new String(str.getBytes("ISO-8859-1"),"gb2312");
        }catch(UnsupportedEncodingException e) {
            str="";
            e.printStackTrace();
        }
        return str;
    }
    public static int strToInt(String str) {
        if(str == null || str.equals("")) {
            str = "0";
        }
        int i = 0;
        try {
            i = Integer.parseInt(str);
        }catch(NumberFormatException e) {
            i = 0;
            e.printStackTrace();
        }
        return i;
    }
    public static String formatDate(long ms){
        Date date=new Date(ms);
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String strDate=format.format(date);
        return strDate;
    }
}
