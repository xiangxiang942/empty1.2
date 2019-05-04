package vc.xji.empty.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vc.xji.empty.entity.Commodity;
import vc.xji.empty.mapper.CommodityMapper;
import vc.xji.empty.service.CommodityService;

@Service
public class CommodityServiceImp extends ServiceImpl<CommodityMapper, Commodity> implements CommodityService {

    @Autowired
    private CommodityMapper commodityMapper;
    @Override
    public Commodity insertCommodity(Commodity commodity) {

        commodityMapper.insertCommodity(commodity);
        return commodity;
    }

    @Override
    public Commodity selectCommdity(int commodity_id) {


        return commodityMapper.selectCommdityById(commodity_id);
    }
}
