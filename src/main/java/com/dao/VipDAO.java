package com.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pojo.Vip;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VipDAO extends  BaseMapper<Vip> {
    public Vip findbyVip_name(String vip_name);
    public Vip findbyVip_tel(String vip_tel);
    public Vip findbyOpenid(int openid);
    public int addVipBytel( @Param("vip_id") String vip_id,@Param("tel") String tel);
    public int addVipByopenid( @Param("openid") int openid,@Param("vip_id") String vip_id);
    public int updateVipmsg(@Param("vip_id") String vip_id,@Param("vip_name") String name,@Param("vip_IDcard") String vip_IDcard,@Param("vip_tel") String vip_tel);
    public List findAll();
    public  int count();
    public  int deleteVip(String vip_id);
    public  int countByVip_id(String vip_id);
    public  int countByVip_tel(String vip_tel);

}
