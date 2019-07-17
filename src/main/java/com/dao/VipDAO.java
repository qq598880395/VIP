package com.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pojo.Vip;

import java.util.List;

public interface VipDAO  extends BaseMapper<Vip> {
    public Vip findbyVip_id(String vip_id);
    public Vip findbyVip_tel(String vip_tel);
    public Vip findbyOpenid(int openid);
    public List addVip();
    public List findAll();
}
