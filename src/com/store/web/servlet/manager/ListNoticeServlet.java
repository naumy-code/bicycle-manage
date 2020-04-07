package com.store.web.servlet.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.store.domain.Notice;
import com.store.service.NoticeService;

/**
 *	后台查询所有公告的servlet
 */
public class ListNoticeServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		NoticeService nService = new NoticeService();
		List<Notice> notices = nService.getAllNotices();
		req.setAttribute("notices", notices);
		req.getRequestDispatcher("/newproject/Ordermanagement/list.jsp").forward(req, resp);
	}
}
