package vc.xji.empty.entity;


import java.io.Serializable;

public class Commodity  implements Serializable {

  private long commodityId;
  private String commodityName;
  private String commodityIntro;
  private String commodityCoverPath;
  private String commodityCreateTime;
  private long commodityCategoryId;
  private double commodityPrice;
  private long commodityStock;
  private long commoditySales;
  private long commodityCheckStatus;
  private long commodityStatus;
  private long commodityBelong;
  private long clubId;


  public long getCommodityId() {
    return commodityId;
  }

  public void setCommodityId(long commodityId) {
    this.commodityId = commodityId;
  }


  public String getCommodityName() {
    return commodityName;
  }

  public void setCommodityName(String commodityName) {
    this.commodityName = commodityName;
  }


  public String getCommodityIntro() {
    return commodityIntro;
  }

  public void setCommodityIntro(String commodityIntro) {
    this.commodityIntro = commodityIntro;
  }


  public String getCommodityCoverPath() {
    return commodityCoverPath;
  }

  public void setCommodityCoverPath(String commodityCoverPath) {
    this.commodityCoverPath = commodityCoverPath;
  }


  public String getCommodityCreateTime() {
    return commodityCreateTime;
  }

  public void setCommodityCreateTime(String commodityCreateTime) {
    this.commodityCreateTime = commodityCreateTime;
  }


  public long getCommodityCategoryId() {
    return commodityCategoryId;
  }

  public void setCommodityCategoryId(long commodityCategoryId) {
    this.commodityCategoryId = commodityCategoryId;
  }


  public double getCommodityPrice() {
    return commodityPrice;
  }

  public void setCommodityPrice(double commodityPrice) {
    this.commodityPrice = commodityPrice;
  }


  public long getCommodityStock() {
    return commodityStock;
  }

  public void setCommodityStock(long commodityStock) {
    this.commodityStock = commodityStock;
  }


  public long getCommoditySales() {
    return commoditySales;
  }

  public void setCommoditySales(long commoditySales) {
    this.commoditySales = commoditySales;
  }


  public long getCommodityCheckStatus() {
    return commodityCheckStatus;
  }

  public void setCommodityCheckStatus(long commodityCheckStatus) {
    this.commodityCheckStatus = commodityCheckStatus;
  }


  public long getCommodityStatus() {
    return commodityStatus;
  }

  public void setCommodityStatus(long commodityStatus) {
    this.commodityStatus = commodityStatus;
  }


  public long getCommodityBelong() {
    return commodityBelong;
  }

  public void setCommodityBelong(long commodityBelong) {
    this.commodityBelong = commodityBelong;
  }


  public long getClubId() {
    return clubId;
  }

  public void setClubId(long clubId) {
    this.clubId = clubId;
  }

}
