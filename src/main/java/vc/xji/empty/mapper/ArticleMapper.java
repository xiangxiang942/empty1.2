package vc.xji.empty.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import vc.xji.empty.entity.Article;

import java.util.List;


public interface ArticleMapper extends BaseMapper<Article> {


    int insertArticle(Article article);


    Article selectArticleById(int article_id);

    List<Article> selectArticleAll();
}
