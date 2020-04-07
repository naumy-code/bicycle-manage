package com.store.web.servlet.client;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;

import com.store.dao.groupOrderDao;
import com.store.domain.Order;
import com.store.domain.OrderItem;
import com.store.domain.Product;
import com.store.domain.User;
import com.store.domain.groupOrder;
import com.store.service.OrderService;
import com.store.service.groupOrderService;
import com.store.utils.IdUtils;

//生成订单
public class CreategroupOrderServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
		
		
		// 1.得到当前用户
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		// 3.将数据封装到订单对象中
		String id = request.getParameter("id");
		String receiverName = request.getParameter("name");
		String telephone = request.getParameter("telephone");
		String address = request.getParameter("address");
		String price = request.getParameter("price");
		
		double money = Double.parseDouble(price);
		System.out.println(money);
		groupOrder grouporder = new groupOrder();
		grouporder.setId(id);
		grouporder.setReceiverName(receiverName);
		grouporder.setReceiverPhone(telephone);
		grouporder.setReceiverAddress(address);
		grouporder.setMoney(money);
		grouporder.setId(IdUtils.getUUID());// 封装订单id
		grouporder.setUser(user);// 封装用户信息到订单.
		System.out.println(grouporder);
		// 4.调用service中添加订单操作.
		groupOrderDao groupOrderDao = new groupOrderDao();
		try {
			groupOrderDao.addgroupProduct(grouporder);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		request.getRequestDispatcher("/client/orderlist.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/Ordermanagement/createOrderSuccess.jsp");
	}

}
