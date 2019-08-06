package com.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pojo.Rc_case;
import com.pojo.Vip_level;
import org.apache.ibatis.annotations.Param;

public interface Vip_levelDAO extends  BaseMapper<Vip_level> {
    public Vip_level findbylevel_id(int level_id);

}