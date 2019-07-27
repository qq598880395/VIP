package com.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pojo.Rc_case;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Rc_caseDAO extends  BaseMapper<Rc_case> {
        public int updateRcCase(int rc_a,int rc_b,int rc_c,int rc_a_regiv,int rc_b_regiv,int rc_c_regiv);


}