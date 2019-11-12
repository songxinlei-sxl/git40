package com.byzx.dao;

import java.util.List;
import java.util.Map;

import com.byzx.model.AllotInfo;

/**@文件名: AllotInfoDao.java
 * @类功能说明: 车辆调拨信息dao接口层
 * @作者: ChongYangYang
 * @Email: 1103222824@qq.com
 * @日期: 2019年10月31日上午11:48:13
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: ChongYangYang</li> 
 * 	 <li>日期: 2019年10月31日上午11:48:13</li> 
 *	 <li>内容: </li>
 * </pre>
 */
public interface AllotInfoDao {

	/**
	 * @方法名: findAllotInfo
	 * @方法说明: 全查车辆调拨dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月7日上午8:56:06
	 * @param map
	 * @return: List<AllotInfo>
	 */
	public List<AllotInfo> findAllotInfo(Map<String, Object> map);

	/**
	 * @方法名: findAllotInfoCount
	 * @方法说明: 全查车辆调拨条数dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月7日上午8:56:11
	 * @param map
	 * @return: int
	 */
	public int findAllotInfoCount(Map<String, Object> map);

	/**
	 * @方法名: saveallotInfo
	 * @方法说明: 保存车辆调拨dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月7日上午8:56:19
	 * @param allotInfo
	 * @return: int
	 */
	public int saveallotInfo(AllotInfo allotInfo);

	/**
	 * @方法名: findallotInfoByUNumber
	 * @方法说明: 根据号码查车辆调拨信息dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月7日上午8:56:27
	 * @param c_carid
	 * @return: int
	 */
	public int findallotInfoByUNumber(int searchByNumber);

	/**
	 * @方法名: updateallotInfo
	 * @方法说明: 更新车辆调拨dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月7日上午8:56:32
	 * @param allotInfo
	 * @return: int
	 */
	public int updateallotInfo(AllotInfo allotInfo);

	/**
	 * @方法名: deleteallotInfo
	 * @方法说明: 删除车辆调拨dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月7日上午8:56:37
	 * @param a_aid
	 * @return: int
	 */
	public int deleteallotInfo(int a_aid);

}
