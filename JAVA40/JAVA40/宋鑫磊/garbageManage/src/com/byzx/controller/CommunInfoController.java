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

import com.byzx.model.CommunInfo;
import com.byzx.model.DataInfo;
import com.byzx.model.UserInfo;
import com.byzx.service.CommunInfoService;
import com.byzx.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**@文件名: CommunInfoController.java
 * @类功能说明: 
 * @作者: LiuChunHui
 * @Email: 508499598@qq.com
 * @日期: 2019年10月31日上午9:43:20
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: LiuChunHui</li> 
 * 	 <li>日期: 2019年10月31日上午9:43:20</li> 
 *	 <li>内容: </li>
 * </pre>
 */
@Controller
@RequestMapping("/communInfo")
public class CommunInfoController {

	@Autowired
	private CommunInfoService communInfoService;
	
	@RequestMapping("/findAllCommunInfo")
	public void findAllCommunInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONArray jsonArray=communInfoService.findAllCommunInfo();
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", jsonArray);
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/findAllCommunInfoName")
	public void findAllCommunInfo1(HttpServletResponse response) throws Exception {
		JSONArray jsonArray = communInfoService.findAllCommunInfo();
		ResponseUtil.write(response, jsonArray);
	}

	
	@RequestMapping("/findAllCommunInfoByPoint")
	public void findAllCommunInfoByPoint(String plot_site,HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject jsonObject=new JSONObject();
		jsonObject=communInfoService.findAllCommunInfoByPoint(plot_site);
		jsonObject.put("row", jsonObject);
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/saveCommunInfo.do")
	public void saveCommunInfo(@RequestBody CommunInfo communInfo,HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		UserInfo userInfos=(UserInfo) session.getAttribute("UserInfo");
		communInfo.setOptid(userInfos.getOpt_id());
		int result=communInfoService.saveCommunInfo(communInfo);
		JSONObject jsonObject=new JSONObject();
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/findRecycleNames.do")
	public void findRecycleNames(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONArray jsonArray=communInfoService.findRecycleNames();
		ResponseUtil.write(response, jsonArray);
	}
	@RequestMapping("/deleteCommunInfo")
	public void deleteCommunInfo(int plot_id,HttpServletRequest request,HttpServletResponse response) throws Exception{
		int result=communInfoService.deleteCommunInfo(plot_id);
		JSONObject jsonObject=new JSONObject();
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/updateCommunInfo.do")
	public void updateCommunInfo(@RequestBody CommunInfo communInfo,HttpServletRequest request,HttpServletResponse response) throws Exception{
		int result=communInfoService.updateCommunInfo(communInfo);
		JSONObject jsonObject=new JSONObject();
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	
}
