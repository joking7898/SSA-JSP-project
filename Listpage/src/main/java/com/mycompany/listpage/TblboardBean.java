/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.listpage;

/**
 *
 * @author jokin
 */
public class TblboardBean {
    int num;
    String name;
    String passwd;
    String email;
    String title;
    String contents;
    String writedate;
    int readcount;
    
    public int getNum(){
        return num;
    }
    public void setNum(int num){
        this.num=num;
    }
    public int getReadcount(){
        return readcount;
    }
    public void setReadcount(int readcount){
        this.readcount=readcount;
    }
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name=name;
    }
    public String getPasswd(){
        return passwd;
    }
    public void setPasswd(String passwd){
        this.passwd=passwd;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email=email;
    }
    public String getTitle(){
        return title;
    }
    public void setTitle(String title){
        this.title=title;
    }
    public String getContents(){
        return contents;
    }
    public void setContents(String contents){
        this.contents=contents;
    }
    public String getWritedate(){
        return writedate;
    }
    public void setWritedate(String writedate){
        this.writedate=writedate;
    }
    
}
