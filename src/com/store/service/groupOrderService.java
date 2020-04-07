package com.store.service;

import java.sql.SQLException;
import java.util.List;

import com.store.dao.OrderDao;
import com.store.dao.OrderItemDao;
import com.store.dao.ProductDao;
import com.store.dao.groupOrderDao;
import com.store.dao.groupOrderItemDao;
import com.store.dao.groupProductDao;
import com.store.domain.Order;
import com.store.domain.OrderItem;
import com.store.domain.User;
import com.store.domain.groupOrder;
import com.store.utils.DataSourceUtils;

public class groupOrderService {
	private groupOrderItemDao oidao = new groupOrderItemDao();
	private groupOrderDao odao = new groupOrderDao();
	private groupProductDao pdao = new groupProductDao();

	// 查找所有订单
	public List<groupOrder> findgroupAllOrder() {
		List<groupOrder> orders = null;
		try {
			// 查找出订单信息
			orders = odao.findgroupAllOrder();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	// 多条件查询订单信息
	public List<groupOrder> findgroupOrderByManyCondition(String id, String receiverName) {
		List<groupOrder> orders = null;
		try {
			orders = odao.findgroupOrderByManyCondition(id, receiverName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

	// 商家修改订单状态
	public void upgroupdateState(String id) {
		try {
			odao.updategroupOrderState(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	// 根据id删除订单 管理员删除订单
	public void delgroupOrderById(String id) {
		try {
			DataSourceUtils.startTransaction();// 开启事务
			oidao.delgroupOrderItems(id);
			odao.delgroupOrderById(id);
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
	
	// 普通用户删除订单
		public void delgroupOrderByIdWithClient(String id) {
			try {
				DataSourceUtils.startTransaction();// 开启事务
				// 从订单项中查找商品购买数量
				Order order = new Order();
				order.setId(id);
				List<OrderItem> items = oidao.findgroupOrderItemByOrder(order);
				// 修改商品数量
				pdao.updateProductNum(items);
				oidao.delgroupOrderItems(id); // 删除订单项
				odao.delgroupOrderById(id); // 删除订单
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
	// 1.添加订单
	public void addgroupOrder(groupOrder order) {
		try {
			// 1.开启事务
			DataSourceUtils.startTransaction();
			// 2.完成操作
			// 2.1向orders表中添加数据
			odao.addgroupProduct(order);
			// 2.2向orderItem表中添加数据
			oidao.addgroupOrderItem(order);
			// 2.3修改商品表中数据.
			pdao.changegroupProductNum(order);
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				DataSourceUtils.rollback(); // 事务回滚
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				// 关闭，释放以及提交事务
				DataSourceUtils.releaseAndCloseConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 根据用户查找订单
	public List<groupOrder> findgroupOrderByUser(User user) {
		List<groupOrder> orders = null;
		try {
			// 查找出订单信息
			orders = odao.findgroupOrderByUser(user);

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
		return orders;
	}
	
	// 普通用户删除订单
		public void delOrderByIdWithClient(String id) {
			try {
				DataSourceUtils.startTransaction();// 开启事务
				odao.delgroupOrderById(id); // 删除订单
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
}