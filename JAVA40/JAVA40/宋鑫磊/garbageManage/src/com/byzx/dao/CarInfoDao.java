package com.byzx.dao;

import java.util.List;
import java.util.Map;

import com.byzx.model.CarInfo;


/**@文件名: CarInfoDao.java
 * @类功能说明: 车辆信息dao接口层
 * @作者: ChongYangYang
 * @Email: 1103222824@qq.com
 * @日期: 2019年11月1日上午10:04:03
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: ChongYangYang</li> 
 * 	 <li>日期: 2019年11月1日上午10:04:03</li> 
 *	 <li>内容: </li>
 * </pre>
 */
public interface CarInfoDao {

	/**
	 * @方法名: findAllCarInfo
	 * @方法说明: 全查车辆dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午9:56:16
	 * @return
	 * @return: List<CarInfo>
	 */
	public List<CarInfo> findAllCarInfo();

	/**
	 * @方法名: findThisCarInfo
	 * @方法说明: 根据地址查车辆dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午9:56:21
	 * @param c_location
	 * @return: List<CarInfo>
	 */
	public List<CarInfo> findThisCarInfo(String c_location);

	/**
	 * @方法名: deleteCarInfo
	 * @方法说明: 删除车辆dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午9:56:26
	 * @param c_carid
	 * @return: int
	 */
	public int deleteCarInfo(int c_carid);

	/**
	 * @方法名: saveCarInfo
	 * @方法说明: 保存车辆dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午9:56:30
	 * @param carInfo
	 * @return: int
	 */
	public int saveCarInfo(CarInfo carInfo);

	/**
	 * @方法名: updateCarInfo
	 * @方法说明: 更新车辆dao接口
	 * @作者: ChongYangYang
	 * @邮箱：1103222824@qq.com
	 * @日期: 2019年11月6日下午9:56:35
	 * @param carInfo
	 * @return: int
	 */
	public int updateCarInfo(CarInfo carInfo);
	
	public List<CarInfo> findAllCar(Map<String,Object> map);
	
	public int findAllCarCount(Map<String,Object> map);



}
