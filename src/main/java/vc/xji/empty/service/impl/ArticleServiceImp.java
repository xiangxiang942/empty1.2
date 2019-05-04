package vc.xji.empty.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vc.xji.empty.entity.Article;
import vc.xji.empty.entity.Commodity;
import vc.xji.empty.mapper.ArticleMapper;
import vc.xji.empty.mapper.CommodityMapper;
import vc.xji.empty.service.ArticleService;
import vc.xji.empty.service.CommodityService;

import java.util.List;

@Service
public class ArticleServiceImp extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public Article insertArticle(Article article) throws Exception {
        articleMapper.insertArticle(article);
        return article;
    }

    @Override
    public Article selectArticle(int id) {

        return articleMapper.selectArticleById(id);
    }

    @Override
    public List<Article> selectArticleAll() {

        return articleMapper.selectArticleAll();
    }
}
