package me.kiuber.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import me.kiuber.bean.Item;
import me.kiuber.utils.DBHelper;

// 商品业务逻辑类
public class ItemDAO {

	public ArrayList<Item> getAllItems() {
		ArrayList<Item> items = new ArrayList<Item>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "SELECT * FROM items";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Item item = new Item();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCity(rs.getString("city"));
				item.setPicture(rs.getString("picture"));
				item.setPrice(rs.getInt("price"));
				item.setNumber(rs.getInt("number"));
				items.add(item);
			}
			return items;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	// 根据商品编号获得商品资料
	public Item getItemsById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from items where id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Item item = new Item();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCity(rs.getString("city"));
				item.setNumber(rs.getInt("number"));
				item.setPrice(rs.getInt("price"));
				item.setPicture(rs.getString("picture"));
				return item;
			} else {
				return null;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		}
	}

	// 获取最近浏览的前五条商品信息
	public ArrayList<Item> getViewList(String list) {
		System.out.println("list:" + list);
		ArrayList<Item> itemlist = new ArrayList<Item>();
		int iCount = 5; // 每次返回前五条记录
		if (list != null && list.length() > 0) {
			String[] arr = list.split(",");
			System.out.println("arr.length=" + arr.length);
			// 如果商品记录大于等于5条
			if (arr.length >= 5) {
				for (int i = arr.length - 1; i >= arr.length - iCount; i--) {
					itemlist.add(getItemsById(Integer.parseInt(arr[i])));
				}
			} else {
				for (int i = arr.length - 1; i >= 0; i--) {
					itemlist.add(getItemsById(Integer.parseInt(arr[i])));
				}
			}
			return itemlist;
		} else {
			return null;
		}

	}

}
