package vc.xji.empty.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import vc.xji.empty.entity.Commodity;


public interface CommodityMapper extends BaseMapper<Commodity> {


    int insertCommodity (Commodity commodity);


    Commodity selectCommdityById(int commodity_id);
}
