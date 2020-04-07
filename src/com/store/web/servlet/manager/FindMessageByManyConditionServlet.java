package com.store.web.servlet.manager;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.domain.Message;
import com.store.domain.Product;
import com.store.service.MessageService;
import com.store.service.ProductService;

public class FindMessageByManyConditionServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.获取表单数据
		String id = request.getParameter("id"); // 商品id
		String name = request.getParameter("productid");
		// 2.创建ProductService对象
		MessageService service = new MessageService();
		// 3.调用service层用于条件查询的方法
		List<Message> ps = service.findMessageByManyCondition(id, name);
		// 4.将条件查询的结果放进request域中
		request.setAttribute("message", ps);
		// 5.请求重定向到商品管理首页list.jsp页面
		request.getRequestDispatcher("/MessageBoard/list.jsp").forward(request, response);
	}
}
