package com.store.service;
import java.sql.SQLException;
import java.util.List;

import com.store.dao.groupProductDao;
import com.store.domain.PageBean;
import com.store.domain.Product;
import com.store.domain.groupPageBean;
import com.store.domain.groupProduct;
import com.store.exception.AddProductException;
import com.store.exception.FindProductByIdException;
import com.store.exception.ListProductException;
public class groupProductService {
	private groupProductDao dao = new groupProductDao();
	// 添加商品
	public void addgroupProduct(groupProduct p) throws AddProductException {
		try {
			dao.addProduct(p);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AddProductException("添加商品失败");
		}
	}
	// 查找所有商品信息
	public List<groupProduct> listAll() throws ListProductException {
		try {
			return dao.listAll();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ListProductException("查询商品失败");
		}
	}
	// 分页操作
	public groupPageBean findProductByPage(int currentPage, int currentCount,
			String category) {
		groupPageBean bean = new groupPageBean();
		// 封装每页显示数据条数
		bean.setCurrentCount(currentCount);
		// 封装当前页码
		bean.setCurrentPage(currentPage);
		// 封装当前查找类别
		bean.setCategory(category);
		try {
			// 获取总条数
			int totalCount = dao.findAllCount(category);
			bean.setTotalCount(totalCount);
			// 获取总页数
			int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
			bean.setTotalPage(totalPage);
			// 获取当前页数据
			List<groupProduct> ps = dao.findByPage(currentPage, currentCount,
					category);
			bean.setPs(ps);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}
	// 根据id查找商品
	public groupProduct findgroupProductById(String id) throws FindProductByIdException {
		try {
			return dao.findgroupProductById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FindProductByIdException("根据ID查找商品失败");
		}
	}
	
	// 多条件查询
	public List<groupProduct> findProductByManyCondition(String id, String name,
			String category, String minprice, String maxprice) {
		List<groupProduct> ps = null;
		try {
			ps = dao.findProductByManyCondition(id, name, category, minprice,
					maxprice);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}
	// 修改商品信息
	public void editProduct(groupProduct p) {
		try {
			dao.editProduct(p);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//后台系统，根据id删除商品信息
	public void deleteProduct(String id) {
		try {
			dao.deleteProduct(id);
		} catch (SQLException e) {
			throw new RuntimeException("后台系统根据id删除商品信息失败！");
		}
	}
}
