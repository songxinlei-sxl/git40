package com.byzx.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.byzx.model.CarInfo;
import com.byzx.model.PageBean;
import com.byzx.model.UserInfo;
import com.byzx.service.CarInfoService;
import com.byzx.util.ResponseUtil;
import com.byzx.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**@文件名: CarInfoController.java
 * @类功能说明: 车辆管理Controller层
 * @作者: ChongYangYang
 * @Email: 1103222824@qq.com
 * @日期: 2019年10月30日下午5:19:13
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: ChongYangYang</li> 
 * 	 <li>日期: 2019年10月30日下午5:19:13</li> 
 *	 <li>内容: </li>
 * </pre>
 */
@Controller
@RequestMapping("/carInfo")
public class CarInfoController {
	//注入车辆管理service层
	@Autowired
	private CarInfoService carInfoService;

	/**
	 * @方法名: findAllCarInfo
	 * @方法说明: 车辆全查Controller层
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月2日下午9:00:21
	 * @param request
	 * @param response
	 * @throws Exception
	 * @return: void
	 */
	@RequestMapping("/findAllCarInfo")
	public void findAllCarInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
		JSONArray jsonArray =carInfoService.findAllCarInfo();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("carInfo", jsonArray);
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/findAllCar")
	public void findAllCar(String c_number,int page, int rows,HttpServletResponse response)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtil.isNotEmpty(c_number)) {
			map.put("c_number", c_number);
		}
		PageBean pageBean = new PageBean(page, rows);
		map.put("pageBean", pageBean);
		JSONArray jsonArray=carInfoService.findAllCar(map);
		int total=carInfoService.findAllCarCount(map);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("rows", jsonArray);
		jsonObject.put("total", total);
		ResponseUtil.write(response, jsonObject);
	}

	/**
	 * @方法名: findThisCarInfo
	 * @方法说明: 根据地址查询车辆信息Controller层
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月2日下午9:02:38
	 * @param c_location
	 * @param request
	 * @param response
	 * @throws Exception
	 * @return: void
	 */
	@RequestMapping("/findThisCarInfo")
	public void findThisCarInfo(String c_location,HttpServletRequest request,HttpServletResponse response) throws Exception {
		JSONArray jsonArray =carInfoService.findThisCarInfo(c_location);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("carInfo", jsonArray);
		ResponseUtil.write(response, jsonObject);
	}
	/**
	 * @方法名: deleteCarInfo
	 * @方法说明: 删除车辆Controller层
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月2日下午9:03:17
	 * @param c_carid
	 * @param response
	 * @throws Exception
	 * @return: void
	 */
	@RequestMapping("/deleteCarInfo")
	public void deleteCarInfo(int c_carid,HttpServletResponse response)throws Exception{
		JSONObject jsonObject = new JSONObject();
		int result=carInfoService.deleteCarInfo(c_carid);
		if(result>0) {
			jsonObject.put("msg", true);
			jsonObject.put("count", result);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}

	/**
	 * @方法名: saveCarInfo
	 * @方法说明: 保存车辆信息Controller层
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月2日下午9:03:37
	 * @param carInfo
	 * @param request
	 * @param response
	 * @throws Exception
	 * @return: void
	 */
	@RequestMapping("/saveCarInfo")
	public void saveCarInfo(@RequestBody CarInfo carInfo,HttpServletRequest request,HttpServletResponse response)throws Exception {
		HttpSession session = request.getSession();
		UserInfo currentUser=(UserInfo) session.getAttribute("UserInfo");
		carInfo.setOpt_id(currentUser.getUser_id());
		int result=carInfoService.saveCarInfo(carInfo);
		JSONObject jsonObject = new JSONObject();
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	/**
	 * @方法名: updateCarInfo
	 * @方法说明: 更新车辆信息Controller层
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午9:04:02
	 * @param carInfo
	 * @param response
	 * @throws Exception
	 * @return: void
	 */
	@RequestMapping("/updateCarInfo")
	public void updateCarInfo(@RequestBody CarInfo carInfo,HttpServletResponse response)throws Exception {
		int result=carInfoService.updateCarInfo(carInfo);
		JSONObject jsonObject = new JSONObject();
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
}










