package com.store.web.servlet.client;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.service.OrderService;
import com.store.service.groupOrderService;

public class ChangegroupOrderStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获得订单号数据
		String orderid = request.getParameter("orderid");
		String paySuccess = "恭喜您支付成功！";
		if (null != orderid) {
				groupOrderService service = new groupOrderService();
				// 根据订单号修改订单状态
				try {
					service.upgroupdateState(orderid);
					request.setAttribute("paySuccess", paySuccess);
					request.getRequestDispatcher("/findgroupOrders").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
					response.getWriter().write("我爱你");
				}
			}
	}
}
