package com.store.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import com.store.domain.Order;
import com.store.domain.OrderItem;
import com.store.domain.Product;
import com.store.domain.groupOrder;
import com.store.domain.groupOrderItem;
import com.store.utils.DataSourceUtils;

public class groupOrderItemDao {

	// 添加团购订单项
		public void addgroupOrderItem(groupOrder order) throws SQLException {
			// 1.生成sql语句
			String sql = "insert into grouporderItem values(?,?,?)";

			QueryRunner runner = new QueryRunner();

			List<groupOrderItem> items = order.getgroupOrderItems();

			Object[][] params = new Object[items.size()][3];

			for (int i = 0; i < params.length; i++) {
				params[i][0] = items.get(i).getgroupOrder().getId();
				params[i][1] = items.get(i).getP().getId();
				params[i][2] = items.get(i).getBuynum();
			}

			runner.batch(DataSourceUtils.getConnection(), sql, params);
		}

	// 根据订单查找订单项.并将订单项中商品查找到。
	public List<OrderItem> findgroupOrderItemByOrder(final Order order)
			throws SQLException {
		String sql = "select * from grouporderItem,Products where products.id=grouporderItem.product_id and order_id=?";

		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		return runner.query(sql, new ResultSetHandler<List<OrderItem>>() {
			public List<OrderItem> handle(ResultSet rs) throws SQLException {

				List<OrderItem> items = new ArrayList<OrderItem>();
				while (rs.next()) {
					OrderItem item = new OrderItem();

					item.setOrder(order);
					item.setBuynum(rs.getInt("buynum"));

					Product p = new Product();
					p.setCategory(rs.getString("category"));
					p.setId(rs.getString("id"));
					p.setDescription(rs.getString("description"));
					p.setImgurl(rs.getString("imgurl"));
					p.setName(rs.getString("name"));
					p.setPnum(rs.getInt("pnum"));
					p.setPrice(rs.getDouble("price"));
					item.setP(p);

					items.add(item);
				}

				return items;
			}
		}, order.getId());
	}
	//根据订单id删除订单项
	public void delgroupOrderItems(String id) throws SQLException {
		String sql="delete from grouporderItem where order_id=?";
		
		QueryRunner runner=new QueryRunner();
		
		runner.update(DataSourceUtils.getConnection(),sql,id);
	}

}
