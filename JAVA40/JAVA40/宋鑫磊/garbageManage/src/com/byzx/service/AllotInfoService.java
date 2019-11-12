package com.byzx.service;

import java.util.Map;

import com.byzx.model.AllotInfo;

import net.sf.json.JSONArray;

/**@文件名: AllotInfoService.java
 * @类功能说明: 车辆调拨service接口层
 * @作者: ChongYangYang
 * @Email: 1103222824@qq.com
 * @日期: 2019年10月31日上午11:04:13
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: ChongYangYang</li> 
 * 	 <li>日期: 2019年10月31日上午11:04:13</li> 
 *	 <li>内容: </li>
 * </pre>
 */
public interface AllotInfoService {

	/**
	 * @方法名: findAllotInfo
	 * @方法说明: 车辆全查service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月3日上午8:46:02
	 * @param map
	 * @return: JSONArray
	 */
	public JSONArray findAllotInfo(Map<String, Object> map);

	/**
	 * @方法名: findAllotInfoCount
	 * @方法说明: 车辆全查service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月3日上午8:46:08
	 * @param map
	 * @return: int
	 */
	public int findAllotInfoCount(Map<String, Object> map);

	/**
	 * @方法名: saveallotInfo
	 * @方法说明: 车辆信息条数service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月3日上午8:46:12
	 * @param allotInfo
	 * @return: int
	 */
	public int saveallotInfo(AllotInfo allotInfo);

	/**
	 * @方法名: findallotInfoByUNumber
	 * @方法说明: 根据名称查询service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月3日上午8:46:19
	 * @param c_carid
	 * @return: int
	 */
	public int findallotInfoByUNumber(int searchByNumber);

	/**
	 * @方法名: updateallotInfo
	 * @方法说明: 更新车辆调拨service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月7日上午8:50:28
	 * @param allotInfo
	 * @return: int
	 */
	public int updateallotInfo(AllotInfo allotInfo);

	/**
	 * @方法名: deleteallotInfo
	 * @方法说明: 删除车辆调拨service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月7日上午8:50:52
	 * @param allotIds
	 * @return: int
	 */
	public int deleteallotInfo(String allotIds);


}
