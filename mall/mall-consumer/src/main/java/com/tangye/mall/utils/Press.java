package com.tangye.mall.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Press {

	// ;charset=utf-8 必须要，不然会出现乱码
    public static String CONTENT_TYPE_FORM_URLENCODED = "application/x-www-form-urlencoded;charset=utf-8";

    public static String CONTENT_TYPE_FORM_DATA = "multipart/form-data;charset=utf-8";

    /** text/plain;charset=utf-8 */
    public static String CONTENT_TYPE_PLAIN = "text/plain;charset=utf-8";
    /** application/json;charset=utf-8 */
    public static String CONTENT_TYPE_JSON = "application/json;charset=utf-8";

    
    public static String get(String type,String postid) {

    	String URL="http://www.kuaidi100.com/query?"+"type="+type+"&postid="+postid;
    	
        HttpURLConnection conn = null;
        BufferedReader dataIn = null;
        String msg = null;
        try {
            // 把字符串转换为URL请求地址
            URL url = new URL(URL);
            // 打开连接
            conn = (HttpURLConnection) url.openConnection();
            // 连接会话
            conn.connect();
            // 获取输入流
            dataIn = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String line;
            StringBuilder sb = new StringBuilder();
            while ((line = dataIn.readLine()) != null) {// 循环读取流
                sb.append(line);
            }
            return sb.toString();

        } catch (Exception e) {
        	msg = "{\"message\": \"网络异常!\",\"ischeck\": \"0\"}";
        } finally {
            try {
                // 重要且易忽略步骤 (关闭流,切记!)
                if (dataIn != null) {
                    dataIn.close();
                }
                // 销毁连接
                if (conn != null) {
                    conn.disconnect();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return msg;
    }
    //http://www.kuaidi100.com/query?type=zhongtong&postid=409173423798

//    public static void main(String[] args) {
//        String result = get("yunda","3835812782968");
//        System.out.println(result);
//    }

	
}
