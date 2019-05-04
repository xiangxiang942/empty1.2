package vc.xji.empty.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;
import vc.xji.empty.entity.Article;
import vc.xji.empty.entity.Commodity;
import vc.xji.empty.service.ArticleService;
import vc.xji.empty.service.CommodityService;
import vc.xji.empty.util.ResponseObject;

import java.util.List;

@RequestMapping("article")
@RestController
@EnableAutoConfiguration
public class ArtileController {
    @Autowired
    private ArticleService articleService;

    @PostMapping("add")
    public String getCommodity(@RequestBody JSONObject jsonObject)throws Exception{
        String article_title=jsonObject.getString("article_title");
        long article_id=jsonObject.getInteger("article_id");
        Article article=new Article();
        article.setArticleId(article_id);
        article.setArticleTitle(article_title);
        return ResponseObject.success("请求成功",article);
    }

    @GetMapping("selectById")
    public String getCommodityById(@RequestParam("article_id") int article_id){

        Article article=articleService.selectArticle(article_id);

        return ResponseObject.success("请求成功",article);

    }

    @GetMapping("selectAll")
    public String getCommdityAll(){
        List<Article> list= articleService.selectArticleAll();
        return ResponseObject.success("请求成功",list);
    }
}
