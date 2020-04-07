package com.database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.valuebean.UserSingle;
import com.valuebean.voteSingle;

public class DB {
    private String className;
    private String url;
    private String username;
    private String password;
    private Connection con;
    private Statement st;
    private ResultSet res;
    public DB() {
        className="com.mysql.jdbc.Driver";
        url="jdbc:mysql://localhost:3306/itcaststore?serverTimezone=UTC";
        username = "root";
        password = "6253108310";
    }
    public void loadDriver() {
        try {
            Class.forName(className);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            System.out.println("���ゆ�烽���ゆ�烽���ゆ�烽���峰�℃�烽���ゆ�烽���ゆ�峰け���帮���");
            e.printStackTrace();
        }
    }
    public void getConnection() {
        loadDriver();
        try {
            con = (Connection) DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("���ゆ�烽���ゆ�烽���ゆ�烽���峰�℃�峰け���帮���");
            e.printStackTrace();
        }
    }
    public void getStatement() {
        getConnection();
        try {
            st = (Statement) con.createStatement();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("���ゆ�峰��statement���ゆ�烽���ゆ�峰け���ゆ��");
            e.printStackTrace();
        }
    }
    public void getResultSet(String sql) {
        if(sql != null && !sql.equals("")) {
            getStatement();
            try {
                res = st.executeQuery(sql);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                System.out.println("���ゆ�疯�㈤���ゆ�烽���峰�℃�峰け���帮���");
                e.printStackTrace();
            }
        }
    }
    public void closed() {
        try {
            if(res != null) {
                res.close();
            }
            if(con != null) {
                con.close();
            }
            if(st != null) {
                st.close();
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("�������烽���ゆ�烽���峰�℃�峰け���帮���");
            e.printStackTrace();
        }
    }
    public int update(String sql) {
        int i = -1;
        if(sql != null && !sql.equals("")) {
            getStatement();
            try {
                i = st.executeUpdate(sql);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                System.out.println("���ゆ�烽���峰�℃�烽���ゆ�烽��缁���峰�介��锟�");
                e.printStackTrace();
            }finally {
                closed();
            }
        }
        return i;
    }
    public ArrayList<voteSingle> getVotes(){
        String sql = "select * from vote";
        getResultSet(sql);
        ArrayList<voteSingle> votes = new ArrayList<voteSingle>();
        try {
            while(res.next()) {
                voteSingle v = new voteSingle();
                v.setId(res.getString(1));
                v.setTitle(res.getString(2));
                v.setNum(res.getString(3));
                votes.add(v);
            }
            res.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return votes;
    }
    public ArrayList<UserSingle> getUsers(){
        String sql = "select * from users";
        getResultSet(sql);
        ArrayList<UserSingle> users = new ArrayList<UserSingle>();
        try {
            while(res.next()) {
                UserSingle u = new UserSingle();
                u.setId(res.getString(1));
                u.setIp(res.getString(2));
                u.setLastTime(res.getLong(3));
                users.add(u);
            }
            res.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return users;
    }
    public UserSingle findUser(String ip) {
        UserSingle u = null;
        String sql = "select * from users where ip = '" + ip + "'";
        getResultSet(sql);
        if(res != null) {
            try {
                while(res.next()) {
                    u = new UserSingle();
                    u.setId(res.getString(1));
                    u.setIp(res.getString(2));
                    u.setLastTime(res.getLong(3));
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                System.out.println("���ゆ�疯�users���ゆ�烽���ゆ�烽���ゆ�烽���ゆ�峰け���帮���finduser���ゆ�烽���ゆ��");
                e.printStackTrace();
            }finally {
                closed();
            }
        }
        return u;
    }
    public voteSingle findvote(int id) {
        voteSingle u = new voteSingle();
        String sql = "select * from vote where id = " + id;
        getResultSet(sql);
        if(res == null) {
            u = null;
            return u;
        }else {
            try {
                while(res.next()) {
                    u.setId(res.getString(1));
                    u.setTitle(res.getString(2));
                    u.setNum(res.getString(3));
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return u;
        }
    }
}
