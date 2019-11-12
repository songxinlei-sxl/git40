package com.byzx.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.byzx.dao.AllotInfoDao;
import com.byzx.model.AllotInfo;
import com.byzx.model.UserInfo;
import com.byzx.service.AllotInfoService;
import com.byzx.util.DateUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**@文件名: AllotInfoServiceImpl.java
 * @类功能说明: 车辆调拨service实现类
 * @作者: ChongYangYang
 * @Email: 1103222824@qq.com
 * @日期: 2019年10月31日上午11:38:44
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: ChongYangYang</li> 
 * 	 <li>日期: 2019年10月31日上午11:38:44</li> 
 *	 <li>内容: </li>
 * </pre>
 */
@Service
public class AllotInfoServiceImpl implements AllotInfoService {
	//注入Dao层对象
	@Autowired
	private AllotInfoDao allotInfoDao;

	//重写service全查车辆调拨接口方法
	@Override
	public JSONArray findAllotInfo(Map<String, Object> map) {
		List<AllotInfo> allotInfoList=allotInfoDao.findAllotInfo(map);
		JSONArray jsonArray=new JSONArray();
		for(int i=0;i<allotInfoList.size();i++) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("a_aid", allotInfoList.get(i).getA_aid());
			jsonObject.put("c_carid", allotInfoList.get(i).getC_carid());
			jsonObject.put("a_depart", allotInfoList.get(i).getA_depart());
			jsonObject.put("a_destination", allotInfoList.get(i).getA_destination());
			jsonObject.put("a_time", allotInfoList.get(i).getA_time());
			jsonObject.put("remark", allotInfoList.get(i).getRemark());
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}

	//重写service全查车辆调拨接口方法
	@Override
	public int findAllotInfoCount(Map<String, Object> map) {
		return allotInfoDao.findAllotInfoCount(map);
	}

	//重写service全查车辆调拨接口方法
	@Override
	public int saveallotInfo(AllotInfo allotInfo) {
		allotInfo.setA_time(DateUtil.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
		allotInfo.setDelflag(0);
		return allotInfoDao.saveallotInfo(allotInfo);
	}

	//重写service全查车辆调拨条数接口方法
	@Override
	public int findallotInfoByUNumber(int searchByNumber) {
		return allotInfoDao.findallotInfoByUNumber(searchByNumber);
	}

	//重写service更新车辆调拨接口方法
	@Override
	public int updateallotInfo(AllotInfo allotInfo) {
		return allotInfoDao.updateallotInfo(allotInfo);
	}

	//重写service删除车辆调拨接口方法
	@Override
	public int deleteallotInfo(String allotIds) {
		String aid[]=allotIds.split(",");
		int count=0;
			for(int i=0;i<aid.length;i++) {
				allotInfoDao.deleteallotInfo(Integer.parseInt(aid[i]));
				count++;
		}
		return count;
	}



}
