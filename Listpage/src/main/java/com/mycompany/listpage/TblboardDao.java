
package com.mycompany.listpage;

import java.sql.*;
import java.util.*;

/**
 *
 * @author jokin
 */
public class TblboardDao {
    String drv="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/dbnwe?serverTimezone=UTC";
    String user="root", passwd="7898654";
    Connection c=null;
    Statement st = null;
    PreparedStatement ps=null;
    ResultSet rs=null;

    public Connection makeConnection() {
        try{
            Class.forName(drv); 
            c=DriverManager.getConnection(url,user,passwd);
        }
        catch(ClassNotFoundException ex){
            System.out.println("StackTrace:"+ ex.getStackTrace()+"원인 : "+ex.getCause());
        } catch(SQLException ex){
            System.out.println("SQL STATE:"+ ex.getSQLState());
        }
        return c;
    }
    public ResultSet getRs(String sql){
        try{
            Class.forName(drv);
            c = DriverManager.getConnection(url,user,passwd);
            st = c.createStatement();
            rs = st.executeQuery(sql);
        }catch(ClassNotFoundException ex){
            System.out.println("CNFE-1 : "+ ex.getCause());
        }catch(SQLException ex){
            System.out.println("CNFE-2 :"+ ex.getSQLState());
        }
        return rs;
    } 
    public boolean existATuple(String sql){
        try{
            rs=getRs(sql);
            if(rs.next())return true;
        }catch(SQLException ex){
            System.out.println("SQL STATE:"+ ex.getSQLState());
        }
        return false;
    }
    public List makeList(String sql){
        List list = new ArrayList();
        TblboardBean tb = null;
            try{
                c=makeConnection();
                ps = c.prepareStatement(sql);
                rs=ps.executeQuery();
                while(rs.next()){
                    tb= new TblboardBean();
                    tb.setNum(rs.getInt(1));
                    tb.setName(rs.getString(2));
                    tb.setPasswd(rs.getString(3));
                    tb.setEmail(rs.getString(4));
                    tb.setTitle(rs.getString(5));
                    tb.setContents(rs.getString(6));
                    tb.setWritedate(rs.getString(7));
                    tb.setReadcount(rs.getInt(8));
                    list.add(tb);
                }
            }catch(SQLException ex){
                System.out.println("SQL STATE:"+ ex.getSQLState());
            }
            return list;
    }
    
    public List makeList(String sql ,int startRow, int endRow){ 
    List list = new ArrayList();
    TblboardBean tb = null;
        try{
            c=makeConnection();
            ps = c.prepareStatement(sql);
            ps.setInt(1,startRow);
            ps.setInt(2,endRow);
            rs=ps.executeQuery();
//            rs=getRs(sql);
            while(rs.next()){
                tb= new TblboardBean();
                tb.setNum(rs.getInt(1));
                tb.setName(rs.getString(2));
                tb.setPasswd(rs.getString(3));
                tb.setEmail(rs.getString(4));
                tb.setTitle(rs.getString(5));
                tb.setContents(rs.getString(6));
                tb.setWritedate(rs.getString(7));
                tb.setReadcount(rs.getInt(8));
                list.add(tb);
            }
        }catch(SQLException ex){
            System.out.println("SQL STATE:"+ ex.getSQLState());
        }
        return list;
    }
    
    public int insertATuple(String sql, TblboardBean tb){
        int n =0;
        try{
            c=makeConnection();
            ps=c.prepareStatement(sql);
            ps.setInt(1,tb.getNum());
            ps.setString(2,tb.getName());
            ps.setString(3,tb.getPasswd());
            ps.setString(4,tb.getEmail());
            ps.setString(5,tb.getTitle());
            ps.setString(6,tb.getContents());
            ps.setString(7,tb.getWritedate());
            ps.setInt(8,tb.getReadcount());
            n=ps.executeUpdate();
        }catch(SQLException ex){
            System.out.println("SQL STATE:"+ ex.getSQLState());
        }
        return n;
    }
    public int getMaxNum(String sql){
        int num =0;
        try{
            rs=getRs(sql);
            rs.next();
            num = rs.getInt(1);
        } catch(SQLException ex){
            System.out.println("SQL STATE:"+ ex.getSQLState());
        }
        return num;
    }
    public int updateReadcount(String sql){
        int n=0;
        try{
            c=makeConnection();
            ps=c.prepareStatement(sql);
            n=ps.executeUpdate();
        }catch(SQLException ex){
            System.out.println("SQL STATE:"+ ex.getSQLState());
        }
        return n;
    }
    public int deleteATuple(String sql, int num, String passwd){
        int n =0;
        try{
        c=makeConnection();
        ps=c.prepareStatement(sql);
        ps.setInt(1, num);
        ps.setString(2, passwd);
        n=ps.executeUpdate();
        }catch(SQLException ex){
            System.out.println("SQL STATE:"+ ex.getSQLState());
        }
        return n;
    }
    public int updateATuple(String sql,String name,String passwd,String email,String title,String contents,String writedate,int num){
        int n=0;
        try{
            c=makeConnection();
            ps=c.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,passwd);
            ps.setString(3, email);
            ps.setString(4, title);
            ps.setString(5, contents);
            ps.setString(6, writedate);
            ps.setInt(7, num);
            n=ps.executeUpdate();
        }catch(SQLException ex){
            System.out.println("SQL STATE:"+ ex.getSQLState());
        }
        return n;
    }
    public String getPass(String sql){
        String n = null;
        try{
            rs=getRs(sql);
            rs.next();
            n = rs.getString(1);
        }catch(SQLException ex){
            System.out.println("SQL STATE:"+ ex.getSQLState());
        }
        System.out.println(n);
        return n;
    }
}


