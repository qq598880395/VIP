package com.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pojo.Recharge;
import org.apache.ibatis.annotations.Param;

public interface RechargeDAO  {
    public int addOrder(@Param("vip_id") String vip_id,@Param("rc_id") String rc_id,@Param("rc_cost") double rc_cost,@Param("hotel_id") int hotel_id);

}
