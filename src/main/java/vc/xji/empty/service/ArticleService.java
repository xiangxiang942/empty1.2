package vc.xji.empty.service;

import com.baomidou.mybatisplus.extension.service.IService;
import vc.xji.empty.entity.Article;

import java.util.List;

public interface ArticleService extends IService<Article>{

    Article insertArticle(Article article)throws Exception;


    Article selectArticle(int id);

    List<Article> selectArticleAll();
}
