package com.store.web.servlet.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.domain.Message;
import com.store.service.MessageService;
/**
 * 根据商品id查找指定商品信息的servlet
 */
public class FindMessageByIdServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.获取表单数据
		String id = request.getParameter("id"); // 商品id
		// 2.创建ProductService对象
		MessageService service = new MessageService();
		// 3.调用service层用于条件查询的方法
		List<Message> ps = service.findMessageById(id);
		// 4.将条件查询的结果放进request域中
		request.setAttribute("message", ps);
		// 5.请求重定向到商品管理首页list.jsp页面
		request.getRequestDispatcher("/MessageBoard/listmessageproduct.jsp").forward(request, response);
	}
}
