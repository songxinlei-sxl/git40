package com.byzx.dao;

import java.util.List;
import java.util.Map;

import com.byzx.model.BiddDocumentInfo;

import net.sf.json.JSONArray;

/**@文件名: BiddDocumentInfoDao.java
 * @类功能说明: 
 * @作者: LiuChunHui
 * @Email: 508499598@qq.com
 * @日期: 2019年10月30日下午5:19:11
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: LiuChunHui</li> 
 * 	 <li>日期: 2019年10月30日下午5:19:11</li> 
 *	 <li>内容: </li>
 * </pre>
 */
public interface BiddDocumentInfoDao {

	public List<BiddDocumentInfo> findAllBiddDocumentInfo(Map<String, Object> map);
	
	public int findAllBiddDocumentInfoCount(Map<String, Object> map); 
	
	public int saveBiddDocumentInfo(BiddDocumentInfo biddDocumentInfo);
	
	public int updateBiddDocumentInfo(BiddDocumentInfo biddDocumentInfo);
	
	public int deleteBiddDocumentInfo(int bd_id);
}
