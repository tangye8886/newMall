package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092700607847";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC23I65kzBsjIMCezCelAlnT4bTO1gVnAQsY+6XGdbz2yqRUCKKmck/airZ/gF4MQrfuqpQX44kw/vEIgELHIwyQtXnfTNbbh9GgP1sy3GQ7Sez88uNISfLtAXDMQi9c0kCbzR9PB5ExYikYeybKP7LSUvm4YR9z/1LIrOTcxkHGXi3kjsAN0A6Ph6MSGcYnLXczL/Mzax87yNkJj0yyW5EnsAg2kJ2ow8B//0cN2Ap+IkoBoVokSesM33WrhBgvEFJsHIE/3npC7PMA0ejbxeVKXiODQtetvurmWRnf9gdh47C6PIfblW89gpxSsldVeqAey4C9w51+k0Egz6CZmgBAgMBAAECggEAHB9Zd+LSHK+TamtFs+2ycIgDhTLoPhKLdcQ8qlJYA5LePhDj7wrtr2oFgxcUZMauFHBhxxCbDL5zVtuf63SNfyFWQk63+kS6XJ5z2yqCobZHV96TnHXP5/0cscM1w+UaAlzV5ri7MvpqJFXHDKnGXb89BBoExVCadNa2ZWPbIoMeviVDBwNP99zxvW528SiXhxWjcmfOFcrqvvkEYGC9q1S+1O/hehYHGgSoIhGNxykdZWxDfvw1bPp1CCnSKJSEu45foERCXl8+AFiXEVwOmctkkXs30TsrwQIDQz///JyMBMqUuVmgONQwcRIZQfpCPO8gb7TrPLX82r4YEsLTrQKBgQDfxtwTDUpmDIdUgwgAvnENwLcL+D6S4Q4qTOLBtRBJ3TrfIsnUcwMbDlmSg9ddtp8keVT/xj5DZv+i1pDmyFqnjWTGiJR96kNGD3nAGoIdLKTNdDlU7MfKkc5IDr9JXlxp1BOlT9NfTrcHZveIWxVb/4VOZzIhLMSlWJtKv4G+0wKBgQDRMW3Qd3NKnfS5D1EaZHGWy6qN9XHaWW8elUaY/r+4LOkLI1US21QhkVxZGh9yxhPcc7mM3deKwh6YkL3Un85aQrtLnNSUJY1dnkwG8HND9/LQ7HgddBF0tZLRo/p2TAuOj2sEHqojC7YtwWPU1L+zRvBnOEVfcKYo4oQWLlxBWwKBgES0EDNFPFdSd2YqCJX54knfphNltwhvUmMIUgI47fRPmNiTHLY+TXDMGhISqleaTwfqvH7+xXT6NXgwOjKwxqx0i8Esg7KY7uierbmeKd59K2fszAFX5Qs7csLKzE3hS6wuMY3qkTHMwALkyRCzLj6dl7b3lft7fDBroNn1LAeDAoGAb1Oryj5Xd8U54GZbVf1QSdzXRjbxwS7JKPBuIqun4d7copXKB3/7dOXDzJNPWyg4l6BqhaHlvC10VOLqc0YcbgKHZETxCGo3ojPE6Ah8fxZr/W1qutnzFDYxDSoD94Kev95pKEcdagsoh48cjr4tyr2c4IGcwZ7UfnuVqaxAYnMCgYASQe5TxflQSua6k6AC/eurrlgQjrVHOyW2G6q/4rH2uiaVh7hyLd2GaxdTpR1RYz9z89M66HULDEhmOMpUovkkqcon/p6tF5Ybl5fyVW91+U9WGTm21joxM2tFFRa6hbtKyDrTtQOtlX78xryI4ZK5cuEY1GIrqL9lvqrvsRUNVw==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk7GEP5mev5XUXCkFmvvEMUJ01QqDD64DV9fNTRlK9m1CVs7WbhyrGpnEip8XkmWoo6Zcl4MZvv+rsH1C49qrvZLosLIgxkQE1rHfO82lgGh11j0CWyg+Ov8hlfcdWuXTfg0jmVoYSB4lK9IuFeR950slByfzeTci5RQ3axMK1d9hcimljh6/9AaBRhSxCFii8DAYkU8ESLfSnc1Sf9gkdIsneM7+yzFnr9oY8j6KEDcrip2vCXCw5WUVU1wgj6LJnB2lGq7omJtbEeZBqh7B3++ffGOVCh3YNzS0+a70BxInyW6NiQHxp0A7EykHgOiY+4QGMGuTBfhSaP5gZeW5WQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:9001/order/payResult.do";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:9001/order/payResult.do";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

