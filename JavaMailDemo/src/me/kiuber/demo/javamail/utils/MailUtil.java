package me.kiuber.demo.javamail.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

/**
 * Created by Administrator on 2017/5/19 0019.
 */
public class MailUtil {

    private static MailUtil instance;
    private static final String FROM = "xxx";
    private static final String PASSWORD = "xxx";
    private static final String host = "smtp.qq.com";

    public static MailUtil get() {
        if (instance == null) {
            instance = new MailUtil();
        }
        return instance;
    }

    public void sendMail(String to, String code) {
        Properties props = System.getProperties();
        props.setProperty("mail.smtp.host", host);
        props.setProperty("mail.smtp.auth", "true");
        Session.getInstance(props);
        try {
            // QQ邮箱需要下面这段代码，163邮箱不需要
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            props.put("mail.smtp.ssl.enable", "true");
            props.put("mail.smtp.ssl.socketFactory", sf);

            // 1.获取默认session对象
            Session session = Session.getDefaultInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(FROM, PASSWORD);
                }
            });
            // 2.创建邮件对象
            Message message = new MimeMessage(session);
            // 2.1设置发件人
            message.setFrom(new InternetAddress(FROM));
            // 2.2设置收件人
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // 2.3设置邮件主题
            message.setSubject("账号激活");
            // 2.4设置邮件内容
            String content = "<html><head></head><body><h1>这是一封激活邮件,激活请点击以下链接</h1><h3><a href='http://localhost:8080/active?code="
                    + code + "'>http://localhost:8080/active?code=" + code
                    + "</href></h3></body></html>";
            message.setContent(content, "text/html;charset=UTF-8");
            // 3.发送激活邮件
            Transport.send(message);
            System.out.println("发送成功");
        } catch (GeneralSecurityException | MessagingException e) {
            e.printStackTrace();
        }
    }
}
