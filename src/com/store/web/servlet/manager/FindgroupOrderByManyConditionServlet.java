package com.store.web.servlet.manager;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.domain.Order;
import com.store.domain.groupOrder;
import com.store.service.OrderService;
import com.store.service.groupOrderService;
/**
 * 按条件查询订单
 * @author admin
 *
 */
public class FindgroupOrderByManyConditionServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //获取订单编号和收件人名称
		String id = request.getParameter("id");
		String receiverName = request.getParameter("receiverName");
        //创建Service层对象
		groupOrderService service = new groupOrderService();
		//调用Service层OrderService类的findOrderByManyCondition()方法查询数据
		List<groupOrder> orders = service.findgroupOrderByManyCondition(id, receiverName);
        //将查询结果添加到request作用域中
		request.setAttribute("orders", orders);
        //请求转发到list.jsp页面，并将request请求和response响应也转发到该页面中
		request.getRequestDispatcher("/Group buying application/listgrouporder.jsp").forward(request,
				response);
	}
}
