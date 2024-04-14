package com.ace.pay.model;

import java.util.Date;

public class PayDTO {
  private int com_idx;
  
  private Date payday;
  
  private int price_sort;
  
  private int usernum;
  
  public PayDTO() {}
  
  public PayDTO(int com_idx, Date payday, int price_sort, int usernum) {
    this.com_idx = com_idx;
    this.payday = payday;
    this.price_sort = price_sort;
    this.usernum = usernum;
  }
  
  public int getCom_idx() {
    return this.com_idx;
  }
  
  public void setCom_idx(int com_idx) {
    this.com_idx = com_idx;
  }
  
  public Date getPayday() {
    return this.payday;
  }
  
  public void setPayday(Date payday) {
    this.payday = payday;
  }
  
  public int getPrice_sort() {
    return this.price_sort;
  }
  
  public void setPrice_sort(int price_sort) {
    this.price_sort = price_sort;
  }
  
  public int getUsernum() {
    return this.usernum;
  }
  
  public void setUsernum(int usernum) {
    this.usernum = usernum;
  }
}
