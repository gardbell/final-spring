package com.ace.pay.model;

import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;

public class PayDAOImple implements PayDAO {
  private SqlSessionTemplate sqlMap;
  
  public PayDAOImple(SqlSessionTemplate sqlMap) {
    this.sqlMap = sqlMap;
  }
  
  public int addPay(Map map) {
    int result = this.sqlMap.insert("addPay", map);
    return result;
  }
}
