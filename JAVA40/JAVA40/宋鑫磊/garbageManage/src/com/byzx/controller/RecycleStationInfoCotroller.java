package com.byzx.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.byzx.model.RecycleStationInfo;
import com.byzx.model.UserInfo;
import com.byzx.service.RecycleStationInfoService;
import com.byzx.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**@鏂囦欢鍚�: RecycleStationInfoCotroller.java
 * @绫诲姛鑳借鏄�: 
 * @浣滆��: BaiHaoJie
 * @Email: 596315150@qq.com
 * @鏃ユ湡: 2019骞�10鏈�31鏃ヤ笅鍗�3:00:21
 * @淇敼璇存槑:<br> 
 * <pre>
 * 	 <li>浣滆��: BaiHaoJie</li> 
 * 	 <li>鏃ユ湡: 2019骞�10鏈�31鏃ヤ笅鍗�3:00:21</li> 
 *	 <li>鍐呭: </li>
 * </pre>
 */
@Controller
@RequestMapping("/recycleInfo")
public class RecycleStationInfoCotroller {

	@Autowired
	private RecycleStationInfoService recycleStationInfoService;
	
	@RequestMapping("/findAllRecycle")
	public void findAllRecycle(HttpServletRequest request,HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = recycleStationInfoService.findAllRecycle();
		jsonObject.put("msg", jsonArray);
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/findRecycleByAddress")
	public void findRecycleByAddress(String recycle_address,HttpServletRequest request,HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = recycleStationInfoService.findRecycleByAddress(recycle_address);
		jsonObject.put("msg", jsonArray);
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/saveRecycleInfo")
	public void saveRecycleInfo(@RequestBody RecycleStationInfo recycleStationInfo,HttpServletRequest request,HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		UserInfo currUser = (UserInfo) session.getAttribute("UserInfo");
		recycleStationInfo.setOptid(currUser.getUser_id());
		JSONObject jsonObject = new JSONObject();
		System.out.println(recycleStationInfo);
		int result = recycleStationInfoService.saveRecycleInfo(recycleStationInfo);
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", true);
		}
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/deleteRecycleInfo")
	public void deleteRecycleInfo(int rsid,HttpServletRequest request,HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		int result = recycleStationInfoService.deleteRecycleInfo(rsid);
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/updateRecycleInfo")
	public void updateRecycleInfo(@RequestBody RecycleStationInfo recycleInfo,HttpServletRequest request,HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		HttpSession session = request.getSession();
		UserInfo currUser = (UserInfo) session.getAttribute("UserInfo");
		recycleInfo.setOptid(currUser.getUser_id());
		int result = recycleStationInfoService.updateRecycleInfo(recycleInfo);
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	
	
}














