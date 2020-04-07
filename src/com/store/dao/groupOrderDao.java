package com.store.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import com.store.domain.groupOrder;
import com.store.domain.Order;
import com.store.domain.User;
import com.store.utils.DataSourceUtils;
/**
 * 订单
 * @author admin
 *
 */
public class groupOrderDao {
	
	/**
	 *  生成团购订单
	 * @param order
	 * @throws SQLException
	 */
	public void addgroupProduct(groupOrder order) throws SQLException {
		java.sql.Date time=new java.sql.Date(new java.util.Date().getTime());
		order.setOrdertime(time);
		// 1.生成Sql语句
		String sql = "insert into grouporders values(?,?,?,?,?,0,?,?)";
		// 2.生成执行sql语句的QueryRunner,不传递参数
		QueryRunner runner = new QueryRunner();
        // 3.执行update()方法插入数据
		runner.update(DataSourceUtils.getConnection(), sql, order.getId(),
				order.getMoney(), order.getReceiverAddress(), order
						.getReceiverName(), order.getReceiverPhone(),order.getOrdertime(), order
						.getUser().getId());
	}
	
	/**
	 *  查找团购报名所有订单
	 * @return
	 * @throws SQLException
	 */
	public List<groupOrder> findgroupAllOrder() throws SQLException {
		//1.创建sql
		String sql = "select grouporders.*,user.* from grouporders,user where user.id=grouporders.user_id order by grouporders.user_id";
		//2.创建QueryRunner对象
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        //3.返回QueryRunner对象query()方法的查询结果
		return runner.query(sql, new ResultSetHandler<List<groupOrder>>() {			
			public List<groupOrder> handle(ResultSet rs) throws SQLException {
				//创建订单集合
				List<groupOrder> orders = new ArrayList<groupOrder>();
                //循环遍历订单和用户信息
				while (rs.next()) {
					groupOrder grouporders = new groupOrder();
					grouporders.setId(rs.getString("grouporders.id"));
					grouporders.setMoney(rs.getDouble("grouporders.money"));
					grouporders.setOrdertime(rs.getDate("grouporders.ordertime"));
					grouporders.setPaystate(rs.getInt("grouporders.paystate"));
					grouporders.setReceiverAddress(rs.getString("grouporders.receiverAddress"));
					grouporders.setReceiverName(rs.getString("grouporders.receiverName"));
					grouporders.setReceiverPhone(rs.getString("grouporders.receiverPhone"));
					orders.add(grouporders);

					User user = new User();
					user.setId(rs.getInt("user.id"));
					user.setEmail(rs.getString("user.email"));
					user.setGender(rs.getString("user.gender"));
					user.setActiveCode(rs.getString("user.activecode"));
					user.setIntroduce(rs.getString("user.introduce"));
					user.setPassword(rs.getString("user.password"));
					user.setRegistTime(rs.getDate("user.registtime"));
					user.setRole(rs.getString("user.role"));
					user.setState(rs.getInt("user.state"));
					user.setTelephone(rs.getString("user.telephone"));
					user.setUsername(rs.getString("user.username"));
					grouporders.setUser(user);
				}
				return orders;
			}
		});
	}
	
	/**
	 *  根据团购订单号修改订单状态
	 * @param id
	 * @throws SQLException
	 */
	public void updategroupOrderState(String id) throws SQLException {
		String sql = "update grouporders set paystate=1 where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		runner.update(sql, id);
		System.out.println(runner.update(sql, id));
	}
	
	
	/**
	 *  多条件查询团购订单
	 * @param id
	 * @param receiverName
	 * @return
	 * @throws SQLException
	 */
	public List<groupOrder> findgroupOrderByManyCondition(String id, String receiverName)
			throws SQLException {
		//1.创建集合对象
		List<Object> objs = new ArrayList<Object>();
		//2.定义查询sql
		String sql = "select grouporders.*,user.* from grouporders,user where user.id=grouporders.user_id ";
		//3.根据参数拼接sql语句
		if (id != null && id.trim().length() > 0) {
			sql += " and grouporders.id=?";
			objs.add(id);
		}
		if (receiverName != null && receiverName.trim().length() > 0) {
			sql += " and receiverName=?";
			objs.add(receiverName);
		}
		sql += " order by grouporders.user_id";
		//4.创建QueryRunner对象
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		//5.返回QueryRunner对象query方法的执行结果
		return runner.query(sql, new ResultSetHandler<List<groupOrder>>() {
			public List<groupOrder> handle(ResultSet rs) throws SQLException {
				List<groupOrder> orders = new ArrayList<groupOrder>();
               //循环遍历出订单和用户信息
				while (rs.next()) {
					groupOrder order = new groupOrder();
					order.setId(rs.getString("grouporders.id"));
					order.setMoney(rs.getDouble("grouporders.money"));
					order.setOrdertime(rs.getDate("grouporders.ordertime"));
					order.setPaystate(rs.getInt("grouporders.paystate"));
					order.setReceiverAddress(rs
							.getString("grouporders.receiverAddress"));
					order.setReceiverName(rs.getString("grouporders.receiverName"));
					order.setReceiverPhone(rs.getString("grouporders.receiverPhone"));
					orders.add(order);
					User user = new User();
					user.setId(rs.getInt("user.id"));
					user.setEmail(rs.getString("user.email"));
					user.setGender(rs.getString("user.gender"));
					user.setActiveCode(rs.getString("user.activecode"));
					user.setIntroduce(rs.getString("user.introduce"));
					user.setPassword(rs.getString("user.password"));
					user.setRegistTime(rs.getDate("user.registtime"));
					user.setRole(rs.getString("user.role"));
					user.setState(rs.getInt("user.state"));
					user.setTelephone(rs.getString("user.telephone"));
					user.setUsername(rs.getString("user.username"));
					order.setUser(user);

				}

				return orders;
			}
		}, objs.toArray());
	}
	
	
	/**
	 * 根据id删除团购订单
	 * @param id
	 * @throws SQLException
	 */
	public void delgroupOrderById(String id) throws SQLException {
		String sql="delete from grouporders where id=?";		
		QueryRunner runner = new QueryRunner();		
		runner.update(DataSourceUtils.getConnection(),sql,id);		
	}
	
	
	/**
	 * 查找用户所属订单
	 */
	public List<groupOrder> findgroupOrderByUser(final User user) throws SQLException {
		String sql = "select * from grouporders where user_id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new ResultSetHandler<List<groupOrder>>() {
			public List<groupOrder> handle(ResultSet rs) throws SQLException {
				List<groupOrder> orders = new ArrayList<groupOrder>();
				while (rs.next()) {
					groupOrder order = new groupOrder();
					order.setId(rs.getString("id"));
					order.setMoney(rs.getDouble("money"));
					order.setOrdertime(rs.getDate("ordertime"));
					order.setPaystate(rs.getInt("paystate"));
					order.setReceiverAddress(rs.getString("receiverAddress"));
					order.setReceiverName(rs.getString("receiverName"));
					order.setReceiverPhone(rs.getString("receiverPhone"));
					order.setUser(user);
					orders.add(order);
				}
				return orders;
			}
		}, user.getId());
	}
}
