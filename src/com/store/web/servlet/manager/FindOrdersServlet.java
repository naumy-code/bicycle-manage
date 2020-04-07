package com.store.web.servlet.manager;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.domain.Order;
import com.store.service.OrderService;
//查找所有订单
public class FindOrdersServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 创建Service层对象
		OrderService service = new OrderService();
		// 调用Service层对象的findAllOrder()方法查询订单列表
		List<Order> orders = service.findAllOrder();
		//将查询到的订单信息添加到request作用域
		request.setAttribute("orders", orders);
		// 将请求转发到list.jsp页面
		request.getRequestDispatcher("/Ordermanagement/list.jsp").forward(request,response);
	}
}
