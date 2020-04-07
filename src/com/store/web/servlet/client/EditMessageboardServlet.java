package com.store.web.servlet.client;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.store.dao.MessageDao;
import com.store.domain.Message;
import com.store.domain.Order;
import com.store.domain.OrderItem;
import com.store.domain.Product;
import com.store.domain.User;
import com.store.exception.AddProductException;
import com.store.service.MessageService;
import com.store.service.OrderService;
import com.store.service.ProductService;
import com.store.utils.FileUploadUtils;
import com.store.utils.IdUtils;

//生成订单
public class EditMessageboardServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 创建javaBean,将上传数据封装.
				Message p = new Message();
				
				Map<String, String> map = new HashMap<String, String>();
				
				DiskFileItemFactory dfif = new DiskFileItemFactory();
				// 设置临时文件存储位置
				dfif.setRepository(new File(this.getServletContext().getRealPath(
						"/temp")));
				// 设置上传文件缓存大小为10m
				dfif.setSizeThreshold(1024 * 1024 * 10);
				// 创建上传组件
				ServletFileUpload upload = new ServletFileUpload(dfif);
				// 处理上传文件中文乱码
				upload.setHeaderEncoding("utf-8");
				try {
					// 解析request得到所有的FileItem
					List<FileItem> items = upload.parseRequest(request);
					// 遍历所有FileItem
					for (FileItem item : items) {
						// 判断当前是否是上传组件
						if (item.isFormField()) {
							// 不是上传组件
							String fieldName = item.getFieldName(); // 获取组件名称
							String value = item.getString("utf-8"); // 解决乱码问题
							map.put(fieldName, value);
						} else {
							// 是上传组件
							// 得到上传文件真实名称
							String fileName = item.getName();
							fileName = FileUploadUtils.subFileName(fileName);

							// 得到随机名称
							String randomName = FileUploadUtils
									.generateRandonFileName(fileName);

							// 得到随机目录
							String randomDir = FileUploadUtils
									.generateRandomDir(randomName);
							// 图片存储父目录
							String imgurl_parent = "/productImg" + randomDir;

							File parentDir = new File(this.getServletContext()
									.getRealPath(imgurl_parent));
							// 验证目录是否存在，如果不存在，创建出来
							if (!parentDir.exists()) {
								parentDir.mkdirs();
							}
							String imgurl = imgurl_parent + "/" + randomName;

							map.put("imgurl", imgurl);

							IOUtils.copy(item.getInputStream(), new FileOutputStream(
									new File(parentDir, randomName)));
							item.delete();
						}
					}
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				try {
					// 将数据封装到javaBean中
					BeanUtils.populate(p, map);
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				System.out.print(p);
				MessageService service = new MessageService();
				// 调用service完成添加商品操作
				service.editMessage(p);
				request.getRequestDispatcher("/Group buying application/myMessageindex.jsp").forward(request, response);
				return;

	}

}
