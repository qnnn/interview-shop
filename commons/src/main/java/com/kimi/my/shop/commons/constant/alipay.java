package com.kimi.my.shop.commons.constant;

/**
 * @ClassName alipay
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/10 21:19
 * @Version 1.0
 **/
public class alipay {

    private static final String baseUrl = "server.natappfree.cc:45894";
    /**
     * 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
     */
    public static final String appId = "2021000116695361";
    /**
     * 商户私钥，您的PKCS8格式RSA2私钥
     */
    public static final String privateKey = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCB9ib4DobkSrWrEl4raGjBId71wx9TvlJN5FmItPcOoEwhwrTww1lFU2w2OwvKzQxsgnEckNM+MyZ8h1PVHXaq8XKakJJf4fa48Ht9kN64e0FVDp0i+fRhycByUkhBThewJd+h6Br3MEZ2gar7huP+2YRPg6hj+uiLp+vEHVe1hDbs4eenXjuSF01ZbCyxAoD+YubQcoPn8xkJlYn+QuM7Htq+nwvV7gvu798nUmlZzybYpT4ZrJ4olHTONChlNzWlX50WyKGqhrV86e71ORNGrPvVb906m5qlWjJlwxkIsQqhzAWTC0gabIYo//rvyAu7ZUFAnGlboqrS8tc+2vXLAgMBAAECggEAElCyZTsG3513xMgt5Ugtmyo+1bvN6mtkBf4scAuw1arZj9h0z4l4R0DeezYPD2GeYpxvfGscmiNzRRF9Swd/9c9ZK1c8ia66qo2ZmbSU7sLQDkCk/IzlV/Kq4HGgJTPwOq7buWGQi02OYJ0dj50O/JeDAgG39X8izqu3mkfYWIg4hs+At15FPcapJ1hhEZ1AAXCScDcVZhQyt/EmNQ9Ztpukk6JGV9ZvU2kQ9Co1yhzLMQwyP/j/1E6GVqtYLKmJRtiSVDeguR+C2/6dbLajXgyK+nq7iw2IucfbedoN6zzHkW3mmkYw9oAi/A2sENikZIe59lvyosnAntojs7rjIQKBgQDpn96vTb9E2PNPi3SrwlaJwEb1STi8ZF95PLfyQzjrtilS2a9xr4hYdDd1dF4LDucTwzGizUDyeN8YIy/F2pr9GlIYPaGJ6T6521P0HnzDBNbeffewjqNHmck/FZ5vdeByT1UkeDyIsEJ6bs9BxI1Vu5vLo2JrvGvZ9ibflI4VxwKBgQCOaJ5XUHJgfgygniOeXl1ssNgYFt8nRhwx0BWiM7vWUJcz394kA6xZSl61Y7SQSUhihuOa9hLCC8bOY1kfPixMfUDuJ0Md8WR6JeykKBzhJVhb5lWG3vDKlSPuDgWgALk8BEKMLE2azupBDP4NXFNKM1ajrbF7RfPd0UzzLbiP3QKBgGL6vqfa8qxClmMfHGEgxvU5p1aInScEB4cf+HcFj/odhUh6veAWlFeVdWGn2agpujEfQ8pL17ZjC3H4hmb3BS8ylZF7mxMI5PBtQhZtTEJ7rGU7TVNaO0c8mozFpghnEp6bieEXp93pf2DLzbd5hL/L6mfOYwZuH+uKZFHZaJFFAoGAfBuq2xduBq/zm0sWaZ99tgrM2Pmd0yFj0vmw0OJbMiScEYZpl2NoIY0Ryu0w4IotPkimNVd884XF5fppIjRR8Ps7yhGHiaHlWhqRCGM4//JG9hhfsyG6IiMl5AJuXooi5K4lvPmjTGZFexmykrxCjij9ubnXMkK9jDQq5seS0DUCgYAjDTvts8xsSv3VrZj7/kRf6ADqW1CllTOtmXWCk17p3OfxGTkAM3LW6NIpZ8Prj3oV9wxtl5qoD6bzDQDI/qtqYXEpIFtSU7bIseJhveodJO+q98ANX4koGUsEJtDd4eTJROM8RVqcwEzfVI1+Ljn925PsnGT9nOZlrJPFOXNcoQ==";
    /**
     * 支付宝公钥
     */
    public static final String publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkdRozbs/uCCrBbQ+c6H037RwYvMPEe0Ar/cPj3SCYS8pmK9xL/SBmhxfhJidw82LTWAmh4s9at7RVFVKs4laW/ri8yE+w4PeiyJ7cCpQWZ+K57f/Hs++ZWmOWGrfF9aTiVeaXmJyvqAHsPHWUZ1Hf83nvEbgpqx0NQu+Vmydjw4SAW1et7bTG3mZlLWwnw0fybIAgocoKvT+FAiotHEKRpCAhn0THIfbyIGesr4aRY0HtL+7RYABNXysZWHt7p2gWvo3d7WDB/fP67Xvv8vD/w3TXrzOMcua74/k3AiGuOVvky7ubankzZaXu6+XSUoZsQOP7feOb8W/BY8wTaOKyQIDAQAB";
    /**
     * 服务器异步通知页面路径
     */
    public static final String notifyUrl = "http://" + baseUrl +"/notifyPayResult";
    /**
     * 服务器同步跳转页面路径
     */
    public static final String returnUrl = "http://" + baseUrl +"/goPaySuccessPage";
    /**
     * signType:RSA2
     */
    public static final String signType = "RSA2";
    /**
     * 字符编码格式
     */
    public static final String charset = "utf-8";
    /**
     * 支付宝网关
     */
    public static final String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
    /**
     * 日志路径
     */
    public static final String logPath = "/data/";

}
