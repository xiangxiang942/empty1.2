package vc.xji.empty.entity;


public class Article {

  private long articleId;
  private String articleTitle;
  private String articleDescription;
  private long articleCategoryId;
  private String articleRemark;
  private String articleCreateTime;
  private String articleUrl;
  private long ariticlePlatformType;
  private String merchantId;
  private long locking;


  public long getArticleId() {
    return articleId;
  }

  public void setArticleId(long articleId) {
    this.articleId = articleId;
  }


  public String getArticleTitle() {
    return articleTitle;
  }

  public void setArticleTitle(String articleTitle) {
    this.articleTitle = articleTitle;
  }


  public String getArticleDescription() {
    return articleDescription;
  }

  public void setArticleDescription(String articleDescription) {
    this.articleDescription = articleDescription;
  }


  public long getArticleCategoryId() {
    return articleCategoryId;
  }

  public void setArticleCategoryId(long articleCategoryId) {
    this.articleCategoryId = articleCategoryId;
  }


  public String getArticleRemark() {
    return articleRemark;
  }

  public void setArticleRemark(String articleRemark) {
    this.articleRemark = articleRemark;
  }


  public String getArticleCreateTime() {
    return articleCreateTime;
  }

  public void setArticleCreateTime(String articleCreateTime) {
    this.articleCreateTime = articleCreateTime;
  }


  public String getArticleUrl() {
    return articleUrl;
  }

  public void setArticleUrl(String articleUrl) {
    this.articleUrl = articleUrl;
  }


  public long getAriticlePlatformType() {
    return ariticlePlatformType;
  }

  public void setAriticlePlatformType(long ariticlePlatformType) {
    this.ariticlePlatformType = ariticlePlatformType;
  }


  public String getMerchantId() {
    return merchantId;
  }

  public void setMerchantId(String merchantId) {
    this.merchantId = merchantId;
  }


  public long getLocking() {
    return locking;
  }

  public void setLocking(long locking) {
    this.locking = locking;
  }

}
