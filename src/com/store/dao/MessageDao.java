package com.store.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.store.domain.Message;
import com.store.domain.Product;
import com.store.domain.User;
import com.store.domain.groupOrder;
import com.store.utils.DataSourceUtils;
/**
 * 订单
 * @author admin
 *
 */
public class MessageDao {
	
	/**
	 *  查找所有留言
	 * @return
	 * @throws SQLException
	 */
	public List<Message> findAllMessage() throws SQLException {
		//1.创建sql
		String sql = "select * from message";
		//2.创建QueryRunner对象
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        //3.返回QueryRunner对象query()方法的查询结果
		return runner.query(sql, new ResultSetHandler<List<Message>>() {			
			public List<Message> handle(ResultSet rs) throws SQLException {
				//创建集合
				List<Message> messages = new ArrayList<Message>();
                //循环遍历
				while (rs.next()) {
					Message message = new Message();
					message.setId(rs.getInt("message.id"));
					message.setproductid(rs.getString("message.productid"));
					message.setName(rs.getString("message.name"));
					message.setTime(rs.getDate("message.time"));
					message.setMail(rs.getString("message.mail"));
					message.setTitle(rs.getString("message.title"));
					message.setContent(rs.getString("message.content"));
					messages.add(message);
				}
				return messages;
			}
		});
	}
	//后台系统，根据id删除信息
	public void deleteMessage(String id) throws SQLException {
			String sql = "DELETE FROM message WHERE id = ?";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			runner.update(sql, id);
	}
		
	// 多条件查询
	public List<Message> findMessageByManyCondition(String id, String name)
				throws SQLException {
			List<Object> list = new ArrayList<Object>();
			String sql = "select * from message where 1=1 ";

			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

			if (id != null && id.trim().length() > 0) {
				sql += " and id=?";
				list.add(id);
			}

			if (name != null && name.trim().length() > 0) {
				sql += " and productid=?";
				list.add(name);
			}
			
			Object[] params = list.toArray();

			return runner.query(sql, new BeanListHandler<Message>(Message.class),
					params);
	}
	// 根据id查找留言
	public List<Message> findMessageById(String id) throws SQLException {
		List<Object> list = new ArrayList<Object>();
		String sql = "select * from message where 1=1";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		
		if (id != null && id.trim().length() > 0) {
			sql += " and productid=?";
			list.add(id);
		}
		
		Object[] params = list.toArray();

		return runner.query(sql, new BeanListHandler<Message>(Message.class),
				params);
	}
	
	/**
	 * 查找用户所属留言
	 */
	public List<Message> findgroupOrderByUser(final User user) throws SQLException {
		String sql = "select * from message where user_id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new ResultSetHandler<List<Message>>() {
			public List<Message> handle(ResultSet rs) throws SQLException {
				List<Message> messages = new ArrayList<Message>();
				while (rs.next()) {
					Message message = new Message();
					message.setId(rs.getInt("id"));
					message.setproductid(rs.getString("productid"));
					message.setName(rs.getString("name"));
					message.setMail(rs.getString("mail"));
					message.setTitle(rs.getString("title"));
					message.setContent(rs.getString("content"));
					message.setTime(rs.getDate("time"));
					message.setImgurl(rs.getString("imgurl"));
					message.setUserid(rs.getInt("user_id"));
					messages.add(message);
				}
				return messages;
			}
		}, user.getId());
	}
	
	/**
	 修改
	 * @param id
	 * @throws SQLException
	 */
	// 修改商品信息
		public void editMessage(Message p) throws SQLException {
			//1.创建集合并将商品信息添加到集合中
			List<Object> obj = new ArrayList<Object>();
			obj.add(p.getContent());
			obj.add(p.getImgurl());
			
			//2.创建sql语句，并拼接sql
			String sql  = "update message " +
					      "set  content=?,imgurl=?";
			//判断是否有图片
			if (p.getImgurl() != null && p.getImgurl().trim().length() > 0) {
				sql += " ,imgurl=?";
				obj.add(p.getImgurl());
			}
			sql += " where id=?";
			obj.add(p.getId());		
			System.out.println(sql);		
			System.out.println(obj);
			//3.创建QueryRunner对象
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			//4.使用QueryRunner对象的update()方法更新数据
			runner.update(sql, obj.toArray());
		}
	
	// 添加商品
	public void addMessage(Message p) throws SQLException {
			
			//Message message = new Message();
			//message.setTime(time);
			String sql = "insert into message values(?,?,?,?,?,?,?,?,?)";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			runner.update(sql,null,p.getproductid(), p.getTitle(),
					p.getName(), p.getTime(), p.getContent(), p.getMail(),p.getImgurl(),p.getUserid());
	}

}
