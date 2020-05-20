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
	public static String app_id = "2016101700710517";
		
	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCGjgm7reqbu2ND6U9EtvqKoOIPgN9TERkeTYZ/uueNO2lCIL+T98KlEJLrh6osTcoUmTly9r5wEn2OfmWQtNj/qByWz0aoWsCMCSJ8YU3/zxYthWTtKKOAtVQnZCBg5/dWdFQnS0idq/t4LFqkZePkFCtU8pzgJzn9xqMxxbV/ZqSGEhhofe6fjudAIVyvhHGAd+cWRPGdWQcS8bVbZFcI4iCHGAFgeHnacnwUwi6Bp6vCFWSh8S2Jhys5pfYPBbfpPXiIgj9an3LO6VUFTmOccplo2SW7PfnWFyR/bL7BbpXEbeUTqrgIWM+yB0VhgahluCnP+16wyBDGiL0n0F5dAgMBAAECggEAD4m3dgTPYsxw2hbHIJhAtmF9uWyYXW9MB0PMlFNxCc4iiZBejye9QnJ3hNtVu2gAPgCzsaLsuuRnu1y9PcikhmFTa9bjwe047vLfGJ3j8/ZmCTuuO/TFbMeDwEi/tHEVDtbAIQmAiTSjBW2ZygI6Hsx1dInPs9LTz4pwrf62xs9Wm7v2GVlSTvfXKAoGZxi8hmpFXZlQ4iTDFqYvrHRIs1Rl3qoLagVaoIU6bwfbW5nLfiPKvwwZqPmBIenJ3Ww3tPrb0u2SIopYAEAIuPUBVe/TLRW76plcJEGa4cK+d3RMhrPa1K2c/C6d3y30V8YRHghNCTYy3Y7SDHf/nZZxwQKBgQD9Umy1T/3Eaj1F9H9BVLqSHukGjFWIFlxRHhLv2nKkDtWyx8vbW/MW5EVf9zGlMNSVyIl/zRtTsAyIaqXym/vA5UOvFy9Q5Av2Ewk+8bbT8R/KztnrqiLMw+vWpkMODRb0K5X3o96olGQkdfgWpju13WMPaVlZjh0ojI4R1evckwKBgQCH+jBrk2Drr9V7aeblMa864IQx/20HLX5tlmITWdeLwDxJYasQOyit/kyr8AYsG5wumlCZgUFCrP3P4qfvuKa/Oo2DswknScYBhGYBvzzUCOqVVgrUThYTtsc01ol6xzERzMnNwcciEITWEOcDPVtLsjq/9wfnPawAvbLRjtifTwKBgQDtHVnj3RwL3eW8tT7oSAba/1PfbTwiRcvjoeLX4AGuzrP4xEts6ISByOmnChrOJQbXrP4HQlVx4Dfa+PicPqVHyVGxcmI3tT3895SP9nDLscewbi5NCNPKFxmJsdbSMC5sHuAhDKI96ahS+JlfmfoKIU+3/URFL2Dbs7THvRUpQQKBgFfrnjlAfu+FrsxwijnxqTKxjuhhFpcIhHHJRbrrYWJcNt7fxuLkzYXLIrodpXAJni/H2YuXtqGtByPOkvV+eFq3Ol9IeQetPNkoSWihxWv4I+3RR4lEwCOZEC8K9LOtbf3rYySmQeK1uZ5MKYK/vnMwV6pdyP9ssfV8ss2qxkgjAoGBANmQMm8VwKqdyJhrBTwibyNKKB0/8bHJ1FV6WTjPIHqIxb9DV5ZQaeqwwB3WIUduGeMN28iAbA2IpzrR3vcLYWG+lzOF6R/sIn0WCeLLil1j8922cJRMKvk5XbTyAyqHJPu46YVqN8u8dcNJbh6xplbirhpQfe7LRaW+jL9YddLm";
		
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsCLPVETZS06u3nixUtAF3met+fcNxSewsXN8uSEF8Bd8b3AH1BumY9gOgqJdbObj4KAC+x1D+3EjoS6YYtYWADJr4NTqZ+XiC3wfz8wpNe+eRPAA8fMkm9OBjJmxHmVAZoN/W+VU1rUY5BiFGOt6yJQnPAWt3epTX0iEs0a/6KvecoCRr3mqyJRkS8XEgazDh8RMy/XImrd1EWKVAQBGqitZ4Jz/MNddSBlCI2wvArYre+0q7Ywm7NtSM2U/y6KKYf5BHn4UEjzQgBJOUquvrCyxNUO8j6Rm8HmwVYcuKfr8Yv1yck1DHscgJIFqZnaxFZq8xrOHOqDwglYtSVJtowIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://18311880904.vipgz1.idcfengye.com/Travel/ReturnSH_url";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://18311880904.vipgz1.idcfengye.com/Travel/Return_url";
	///Diploma/WebRoot/WEB-INF/Home/Return.jsp
	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "D:\\";


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

