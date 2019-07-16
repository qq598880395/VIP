package com.com.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
@TableName("vip_list")
public class uesr implements Serializable {
    @TableId(value="vip_id",type = IdType.AUTO)
    private int vip_id;  //会员号

    private int openid;  //微信openid
    private String vip_tel; //会员电话
    private String vip_name;//会员姓名
    private String vip_IDcard; //会员身份证
    private double vip_money; //会员余额

    public int getVip_id() {
        return vip_id;
    }

    public void setVip_id(int vip_id) {
        this.vip_id = vip_id;
    }



    public int getOpenid() {
        return openid;
    }

    public void setOpenid(int openid) {
        this.openid = openid;
    }

    public String getVip_tel() {
        return vip_tel;
    }

    public void setVip_tel(String vip_tel) {
        this.vip_tel = vip_tel;
    }

    public String getVip_name() {
        return vip_name;
    }

    public void setVip_name(String vip_name) {
        this.vip_name = vip_name;
    }

    public String getVip_IDcard() {
        return vip_IDcard;
    }

    public void setVip_IDcard(String vip_IDcard) {
        this.vip_IDcard = vip_IDcard;
    }

    public double getVip_money() {
        return vip_money;
    }

    public void setVip_money(double vip_money) {
        this.vip_money = vip_money;
    }




}
