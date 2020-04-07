package com.store.web.servlet.client;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.domain.Message;
import com.store.domain.User;
import com.store.domain.groupOrder;
import com.store.service.MessageService;
import com.store.service.groupOrderService;
public class FindMessageByUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取名为“user”的session
		User user = (User) request.getSession().getAttribute("user");
		// 调用service中的方法,根据用户信息查找订单
		MessageService service = new MessageService();
		List<Message> orders = service.findMessageByUser(user);
		request.setAttribute("messages", orders);
		request.getRequestDispatcher("/Group buying application/myMessageindex.jsp").forward(request, response);
	}
}
