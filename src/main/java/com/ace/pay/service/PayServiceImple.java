package com.ace.pay.service;

import com.ace.pay.model.PayDAO;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

public class PayServiceImple implements PayService {
  @Autowired
  private PayDAO payDao;
  
  public PayServiceImple(PayDAO payDao) {
    this.payDao = payDao;
  }
  
  public int addPay(Map map) {
    int result = this.payDao.addPay(map);
    return result;
  }
}
