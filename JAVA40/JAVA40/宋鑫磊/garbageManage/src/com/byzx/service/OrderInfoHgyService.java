package com.byzx.service;



import java.util.Map;

import com.byzx.model.OrderInfoHgy;

import net.sf.json.JSONArray;

/**@文件名: OrderInfoService.java
 * @类功能说明: 
 * @作者: HeGuangYao
 * @Email: 105302097@qq.com
 * @日期: 2019年11月1日下午2:55:20
 * @修改说明:<br> 
 * <pre>
 * 	 <li>作者: HeGuangYao</li> 
 * 	 <li>日期: 2019年11月1日下午2:55:20</li> 
 *	 <li>内容: </li>
 * </pre>
 */
public interface OrderInfoHgyService {

	public int addOrderInfo(OrderInfoHgy orderInfo);

	public JSONArray findAllOrderInfo1(Map<String, Object> map);

	public int findAllOrderInfoCount1(Map<String, Object> map);

	
}
