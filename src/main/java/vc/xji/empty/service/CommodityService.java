package vc.xji.empty.service;

import com.baomidou.mybatisplus.extension.service.IService;
import vc.xji.empty.entity.Commodity;

import java.util.List;

public interface CommodityService extends IService<Commodity>{

    Commodity insertCommodity (Commodity commodity)throws Exception;


    Commodity selectCommdity(int id);

    List<Commodity> selectCommdityAll();
}
