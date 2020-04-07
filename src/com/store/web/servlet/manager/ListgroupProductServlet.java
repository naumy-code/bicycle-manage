package com.store.web.servlet.manager;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.domain.Product;
import com.store.domain.groupProduct;
import com.store.exception.ListProductException;
import com.store.service.ProductService;
import com.store.service.groupProductService;
/**
 * 后台系统
 * 查询所有商品信息的servlet
 */
public class ListgroupProductServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.创建service层的对象
		groupProductService service = new groupProductService();
		try {
			// 2.调用service层用于查询所有商品的方法
			List<groupProduct> ps = service.listAll();
			// 3.将查询出的所有商品放进request域中
			request.setAttribute("ps", ps);
			// 4.重定向到products.jsp页面
			request.getRequestDispatcher("/Group buying application/groupproducts.jsp").forward(
					request, response);
			return;
		} catch (ListProductException e) {
			e.printStackTrace();
			response.getWriter().write(e.getMessage());
			return;
		}
	}
}
