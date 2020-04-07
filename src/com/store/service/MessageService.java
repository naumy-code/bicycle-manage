package com.store.service;

import java.sql.SQLException;
import java.util.List;

import com.store.dao.MessageDao;
import com.store.dao.OrderDao;
import com.store.dao.OrderItemDao;
import com.store.dao.ProductDao;
import com.store.domain.Message;
import com.store.domain.Order;
import com.store.domain.OrderItem;
import com.store.domain.Product;
import com.store.domain.User;
import com.store.domain.groupOrder;
import com.store.exception.AddProductException;
import com.store.exception.FindProductByIdException;
import com.store.utils.DataSourceUtils;

public class MessageService {
	private MessageDao messdao = new MessageDao();

	// 查找所有留言
	public List<Message> findAllMessage() {
		List<Message> messages = null;
		try {
			// 查找出订单信息
			messages = messdao.findAllMessage();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return messages;
	}
	
	// 添加商品
		public void addMessage(Message p) throws AddProductException {
			try {
				messdao.addMessage(p);
			} catch (SQLException e) {
				e.printStackTrace();
				throw new AddProductException("添加失败");
			}
		}

	// 后台系统，根据id删除留言信息
	public void deletemessage(String id) {
		try {
			messdao.deleteMessage(id);
		} catch (SQLException e) {
			throw new RuntimeException("后台系统根据id删除商品信息失败！");
		}
	}

	// 多条件查询
	public List<Message> findMessageByManyCondition(String id, String name) {
		List<Message> ps = null;
		try {
			ps = messdao.findMessageByManyCondition(id, name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}

	// 根据id查找
	public List<Message> findMessageById(String id) {
		List<Message> ps = null;
		try {
			ps = messdao.findMessageById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}

	// 根据用户查找留言
	public List<Message> findMessageByUser(User user) {
		List<Message> messages = null;
		try {
			// 查找出订单信息
			messages = messdao.findgroupOrderByUser(user);

			// // 查找出订单项信息.
			// for (Order order : orders) {
			// List<OrderItem> items = oidao.findOrderItemByOrder(order);
			// //查找到订单中的订单项信息
			//
			// order.setOrderItems(items);
			// }

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return messages;
	}

	// 普通用户删除留言
	public void delMessageByIdWithClient(String id) {
		try {
			DataSourceUtils.startTransaction();// 开启事务
			messdao.deleteMessage(id); 
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				DataSourceUtils.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				DataSourceUtils.releaseAndCloseConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	// 修改商品信息
		public void editMessage(Message p) {
			try {
				messdao.editMessage(p);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}