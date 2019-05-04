package vc.xji.empty.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.*;
import vc.xji.empty.entity.Commodity;
import vc.xji.empty.service.CommodityService;
import vc.xji.empty.util.ResponseObject;

import java.util.List;

@RequestMapping("commodity")
@RestController
@EnableAutoConfiguration
public class CommodityController {
    @Autowired
    private CommodityService commodityService;

    @PostMapping("add")
    public String getCommodity(@RequestBody JSONObject jsonObject)throws Exception{
        String commodity_cover_path=jsonObject.getString("commodity_cover_path");
        String commodity_name=jsonObject.getString("commodity_name");
        String commodity_intro=jsonObject.getString("commodity_intro");
        Commodity commodity=new Commodity();
        commodity.setCommodityCoverPath(commodity_cover_path);
        commodity.setCommodityName(commodity_name);
        commodity.setCommodityIntro(commodity_intro);
        commodity= commodityService.insertCommodity(commodity);

        return ResponseObject.success("请求成功",commodity);
    }

    @GetMapping("selectById")
    public String getCommodityById(@RequestParam("commodity_id") int commodity_id){

        Commodity commodity=commodityService.selectCommdity(commodity_id);

        return ResponseObject.success("请求成功",commodity);

    }

    @GetMapping("selectAll")
    public String getCommdityAll(){
        List<Commodity> list= commodityService.selectCommdityAll();
        return ResponseObject.success("请求成功",list);
    }
}
