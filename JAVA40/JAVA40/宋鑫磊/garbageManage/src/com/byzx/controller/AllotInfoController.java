 package com.byzx.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.byzx.model.AllotInfo;
import com.byzx.model.PageBean;
import com.byzx.model.UserInfo;
import com.byzx.service.AllotInfoService;
import com.byzx.util.ResponseUtil;
import com.byzx.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**@文件名: AllotInfoController.java
 * @类功能说明: 车辆调拨管理Controller层
 * @作者: ChongYangYang
 * @Email: 1103222824@qq.com
 * @日期: 2019年10月31日上午10:12:45
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: ChongYangYang</li> 
 * 	 <li>日期: 2019年10月31日上午10:12:45</li> 
 *	 <li>内容: </li>
 * </pre>
 */
@Controller
@RequestMapping("/allotInfo")
public class AllotInfoController {

	//注入service层
	@Autowired
	private AllotInfoService allotInfoService;
	/**
	 * @方法名: findAllotInfo
	 * @方法说明: 车辆调拨全查Controller层
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午10:00:28
	 * @param page
	 * @param rows
	 * @param searchByNumber
	 * @param request
	 * @param response
	 * @throws Exception
	 * @return: void
	 */
	@RequestMapping("/findAllotInfo")
	public void findAllotInfo(int page,int rows,String searchByNumber,HttpServletRequest request,HttpServletResponse response) throws Exception {
		Map<String,Object> map=new HashMap<String,Object>();
		if(StringUtil.isNotEmpty(searchByNumber)) {
		map.put("searchByName", searchByNumber);
		}
		PageBean pageBean = new PageBean(page,rows);
		map.put("pageBean", pageBean);
		JSONArray jsonArray=allotInfoService.findAllotInfo(map);
		int total = allotInfoService.findAllotInfoCount(map);
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", jsonArray);
		jsonObject.put("total", total);
		ResponseUtil.write(response, jsonObject);
	}
	/**
	 * @方法名: saveallotInfo
	 * @方法说明: 车辆调拨保存Controller层
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午10:00:33
	 * @param allotInfo
	 * @param request
	 * @param response
	 * @throws Exception
	 * @return: void
	 */
	@RequestMapping("/saveallotInfo")
	public void saveallotInfo(AllotInfo allotInfo,HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		UserInfo currentUser=(UserInfo) session.getAttribute("UserInfo");
		allotInfo.setOpt_id(currentUser.getUser_id());
		int result=allotInfoService.saveallotInfo(allotInfo);
		JSONObject jsonObject=new JSONObject();
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	/**
	 * @方法名: findallotInfoByUNumber
	 * @方法说明: 车辆调拨根据车牌查询Controller层
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午10:00:40
	 * @param c_carid
	 * @param response
	 * @throws Exception
	 * @return: void
	 */
	@RequestMapping("/findallotInfoByUNumber")
	public void findallotInfoByUNumber(int searchByNumber,HttpServletResponse response)throws Exception {
		int result=allotInfoService.findallotInfoByUNumber(searchByNumber);
		JSONObject jsonObject = new JSONObject();
		if(result>0) {
			jsonObject.put("msg", true);
		}
		ResponseUtil.write(response, jsonObject);
	}
	/**
	 * @方法名: updateallotInfo
	 * @方法说明: 
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午10:00:44
	 * @param allotInfo
	 * @param response
	 * @throws Exception
	 * @return: void
	 */
	@RequestMapping("/updateallotInfo")
	public void updateallotInfo(AllotInfo allotInfo,HttpServletResponse response)throws Exception{
		int result=allotInfoService.updateallotInfo(allotInfo);
		JSONObject jsonObject = new JSONObject();
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	/**
	 * @方法名: deleteallotInfo
	 * @方法说明: 
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午10:00:48
	 * @param allotIds
	 * @param response
	 * @throws Exception
	 * @return: void
	 */
	@RequestMapping("/deleteallotInfo")
	public void deleteallotInfo (String allotIds,HttpServletResponse response)throws Exception{
		JSONObject jsonObject = new JSONObject();
		int result=allotInfoService.deleteallotInfo(allotIds);
		if(result>0) {
			jsonObject.put("msg", true);
			jsonObject.put("count", result);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	
}















