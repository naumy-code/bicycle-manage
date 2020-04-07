package com.store.web.servlet.client;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import com.store.service.OrderService;

public class ChangeOrderStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		// 获得订单号数据
		String orderid = request.getParameter("orderid");
		
		try{	
		request.setCharacterEncoding("gb2312");
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		String subject=request.getParameter("subject");
		String messageText=request.getParameter("content");
	    String password=request.getParameter("password");
		
	  //生成SMTP的主机名称
		int n =from.indexOf('@');
		int m=from.length() ;
		String mailserver ="smtp."+from.substring(n+1,m);
	    
	    //建立邮件会话
		Properties pro=new Properties();
	    pro.put("mail.smtp.host",mailserver);
	    pro.put("mail.smtp.auth","true");
	    Session sess=Session.getInstance(pro);
	    sess.setDebug(true);
	    //新建一个消息对象
	    MimeMessage message=new MimeMessage(sess);
	    //设置发件人
	    InternetAddress from_mail=new InternetAddress(from);
	    message.setFrom(from_mail);
	   //设置收件人
	    InternetAddress to_mail=new InternetAddress(to);
	    message.setRecipient(Message.RecipientType.TO ,to_mail);
	    //设置主题
	    message.setSubject(subject);
	   //设置内容
	   message.setText(messageText);
	   //设置发送时间
	   message.setSentDate(new Date());
	   //发送邮件
	   message.saveChanges();  //保证报头域同会话内容保持一致
	   Transport transport =sess.getTransport("smtp");
	   transport.connect(mailserver,from,password);
	   transport.sendMessage(message,message.getAllRecipients());
	   transport.close();
	   System.out.println("<script language='javascript'>alert('邮件已发送！');window.location.href='sendmail.jsp';</script>");
		}catch(Exception e){
			System.out.println("发送邮件产生的错误："+e.getMessage());
			System.out.println("<script language='javascript'>alert('邮件发送失败！');window.location.href='sendmail.jsp';</script>");
		}		
		
		String paySuccess = "恭喜您支付成功！";
		if (null != orderid) {
				OrderService service = new OrderService();
				// 根据订单号修改订单状态
				try {
					service.updateState(orderid);
					request.setAttribute("paySuccess", paySuccess);
					request.getRequestDispatcher("/findOrderByUser").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
					response.getWriter().write("修改订单状态失败");
				}
			}
	}
}
