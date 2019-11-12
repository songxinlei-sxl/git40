package com.byzx.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.byzx.model.BiddDocumentInfo;
import com.byzx.model.GoodsDetailInfo;
import com.byzx.model.PageBean;
import com.byzx.model.UserInfo;
import com.byzx.service.BiddDocumentInfoService;
import com.byzx.util.ResponseUtil;
import com.byzx.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**@文件名: BiddDocumentInfoController.java
 * @类功能说明: 
 * @作者: LiuChunHui
 * @Email: 508499598@qq.com
 * @日期: 2019年10月30日下午5:18:58
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: LiuChunHui</li> 
 * 	 <li>日期: 2019年10月30日下午5:18:58</li> 
 *	 <li>内容: </li>
 * </pre>
 */
@Controller
@RequestMapping("/biddDocumentInfo")
public class BiddDocumentInfoController {

	@Autowired
	private BiddDocumentInfoService biddDocumentInfoService;
	
	@RequestMapping("/findAllBiddDocumentInfo")
	public void findAllBiddDocumentInfo(int page,int rows,String s_roleName,HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		if(StringUtil.isNotEmpty(s_roleName)) {
			map.put("s_roleName", s_roleName);
		}
		PageBean pageBean=new PageBean(page,rows);
		map.put("pageBean", pageBean);
		JSONArray jsonArray=biddDocumentInfoService.findAllBiddDocumentInfo(map);
		int total=biddDocumentInfoService.findAllBiddDocumentInfoCount(map);
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", jsonArray);
		jsonObject.put("total", total);
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/saveBiddDocumentInfo.do")
	public void saveBiddDocumentInfo(BiddDocumentInfo biddDocumentInfo,HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		UserInfo userInfos=(UserInfo) session.getAttribute("UserInfo");
		biddDocumentInfo.setOpt_id(userInfos.getOpt_id());
		int result=biddDocumentInfoService.saveBiddDocumentInfo(biddDocumentInfo);
		JSONObject jsonObject=new JSONObject();
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/updateBiddDocumentInfo.do")
	public void updateBiddDocumentInfo(BiddDocumentInfo biddDocumentInfo,HttpServletRequest request,HttpServletResponse response) throws Exception{
		int result=biddDocumentInfoService.updateBiddDocumentInfo(biddDocumentInfo);
		JSONObject jsonObject=new JSONObject();
		
		if(result>0) {
			jsonObject.put("msg", true);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
	
	@RequestMapping("/deleteBiddDocumentInfo.do")
	public void deleteBiddDocumentInfo(String roleIds,HttpServletRequest request,HttpServletResponse response) throws Exception{
		int result=biddDocumentInfoService.deleteBiddDocumentInfo(roleIds);
		JSONObject jsonObject=new JSONObject();
		if(result>0) {
			jsonObject.put("msg", true);
			jsonObject.put("count",result);
		}else {
			jsonObject.put("msg", false);
		}
		ResponseUtil.write(response, jsonObject);
	}
}
