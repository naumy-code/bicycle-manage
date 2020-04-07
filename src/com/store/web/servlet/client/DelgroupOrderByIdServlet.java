package com.store.web.servlet.client;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.service.OrderService;
import com.store.service.groupOrderService;
/**
 * 删除订单
 * @author admin
 *
 */
public class DelgroupOrderByIdServlet extends HttpServlet {
	private static final long serialVersionUID = -742965707205621644L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 订单id
		String id = request.getParameter("id");
		// 已受理的订单带有type值为client的参数
		String type = request.getParameter("type");
		groupOrderService service = new groupOrderService();
		if (type != null && type.trim().length() > 0) {
			service.delgroupOrderById(id);
			if ("admin".equals(type)) {
				request.getRequestDispatcher("/findgroupOrders").forward(request, response);
				return;
			}
		} else {
			// 调用service层方法删除相应订单
			service.delgroupOrderByIdWithClient(id);
		}
		//response.sendRedirect(request.getContextPath() + "/client/delOrderSuccess.jsp");
		request.getRequestDispatcher("/findgroupOrderByUser").forward(request, response);
		return;
	}
}
