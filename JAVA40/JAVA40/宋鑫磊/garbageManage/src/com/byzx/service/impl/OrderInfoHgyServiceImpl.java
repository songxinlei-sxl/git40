package com.byzx.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.byzx.dao.OrderInfoHgyDao;
import com.byzx.model.OrderInfoHgy;
import com.byzx.service.OrderInfoHgyService;
import com.byzx.util.DateUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**@文件名: OrderInfoServiceImpl.java
 * @类功能说明: 
 * @作者: HeGuangYao
 * @Email: 105302097@qq.com
 * @日期: 2019年11月1日下午2:57:33
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: HeGuangYao</li> 
 * 	 <li>日期: 2019年11月1日下午2:57:33</li> 
 *	 <li>内容: </li>
 * </pre>
 */
@Service
public class OrderInfoHgyServiceImpl implements OrderInfoHgyService {

	@Autowired
	private OrderInfoHgyDao orderInfoHgyDao;
	@Override
	public int addOrderInfo(OrderInfoHgy orderInfo) {
		orderInfo.setCreatetime(DateUtil.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
		orderInfo.setDelflag(0);
		orderInfo.setState(0);
		orderInfo.setO_time(orderInfo.getO_time()+"");
		return orderInfoHgyDao.addOrderInfo(orderInfo);
	}
	@Override
	public JSONArray findAllOrderInfo1(Map<String, Object> map) {
		List<OrderInfoHgy> orderInfo=orderInfoHgyDao.findAllOrderInfo1(map);
		JSONArray jsonArray=new JSONArray();
		for(int i=0;i<orderInfo.size();i++) {
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("o_name", orderInfo.get(i).getO_name());
			jsonObject.put("odid", orderInfo.get(i).getOdid());
			jsonObject.put("createtime", orderInfo.get(i).getCreatetime());
			jsonObject.put("remark", orderInfo.get(i).getRemark());
			jsonObject.put("r_id", orderInfo.get(i).getR_id());
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
	@Override
	public int findAllOrderInfoCount1(Map<String, Object> map) {
		
		return orderInfoHgyDao.findAllOrderInfoCount1(map);
	}

}
