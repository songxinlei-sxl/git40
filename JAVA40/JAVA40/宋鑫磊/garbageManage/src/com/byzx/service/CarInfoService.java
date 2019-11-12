package com.byzx.service;



import java.util.Map;

import com.byzx.model.CarInfo;

import net.sf.json.JSONArray;

/**@文件名: CarInfoService.java
 * @类功能说明: 车辆管理service接口层
 * @作者: ChongYangYang
 * @Email: 1103222824@qq.com
 * @日期: 2019年10月30日下午5:24:52
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: ChongYangYang</li> 
 * 	 <li>日期: 2019年10月30日下午5:24:52</li> 
 *	 <li>内容: </li>
 * </pre>
 */
public interface CarInfoService {

	/**
	 * @方法名: findAllCarInfo
	 * @方法说明: 车辆全查service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月2日下午9:21:37
	 * @return: JSONArray
	 */
	public JSONArray findAllCarInfo();

	/**
	 * @方法名: findThisCarInfo
	 * @方法说明: 根据地址查询车辆信息service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月2日下午9:21:44
	 * @param c_location
	 * @return: JSONArray
	 */
	public JSONArray findThisCarInfo(String c_location);

	/**
	 * @方法名: deleteCarInfo
	 * @方法说明: 删除车辆service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月2日下午9:21:53
	 * @param c_carid
	 * @return: int
	 */
	public int deleteCarInfo(int c_carid);

	/**
	 * @方法名: saveCarInfo
	 * @方法说明: 保存车辆service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月2日下午9:21:57
	 * @param carInfo
	 * @return: int
	 */
	public int saveCarInfo(CarInfo carInfo);

	/**
	 * @方法名: updateCarInfo
	 * @方法说明: 更新车辆service接口方法
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月2日下午9:22:02
	 * @param carInfo
	 * @return: int
	 */
	public int updateCarInfo(CarInfo carInfo);

	public JSONArray findAllCar(Map<String, Object> map);

	public int findAllCarCount(Map<String, Object> map);




}
