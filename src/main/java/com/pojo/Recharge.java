package com.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import javax.persistence.Table;
import java.io.Serializable;
@TableName("recharge")
public class Recharge implements Serializable {
    @TableId(value = "rc_id",type = IdType.AUTO)
    private int rc_id;//充值id
    private int hotel_id;//酒店id
    private String vip_id;//会员id
    private double rc_cost;//充值金额
    private String rc_time;//订单时间

    public int getRc_id() {
        return rc_id;
    }

    public void setRc_id(int rc_id) {
        this.rc_id = rc_id;
    }

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public String getVip_id() {
        return vip_id;
    }

    public void setVip_id(String vip_id) {
        this.vip_id = vip_id;
    }

    public double getRc_cost() {
        return rc_cost;
    }

    public void setRc_cost(double rc_cost) {
        this.rc_cost = rc_cost;
    }

    public String getRc_time() {
        return rc_time;
    }

    public void setRc_time(String rc_time) {
        this.rc_time = rc_time;
    }
}
