package com.byzx.model;
/**@�ļ���: OrderInfo.java
 * @�๦��˵��: 
 * @����: WangSiYuan
 * @Email: 1512972568@qq.com
 * @����: 2019��11��2������10:42:27
 * @�޸�˵��:<br> 
 * <pre>
 * 	 <li>����: WangSiYuan
 * 	 <li>����: 2019��11��2������10:42:27</li> 
 *	 <li>����: </li>
 * </pre>
 */
public class OrderInfo {

	private Integer oid;		//����ID
	private String odid;		//�������
	private Integer o_uid;		//�����û�ID
	private String R_name;		//��������		���������û���
	private String r_nickname;		//�����ǳ�
	private String o_uaddress;		//�µ����յ�ַ
	private String createtime;		//����ʱ��
	private String regenerant;		//������ͼƬ
	private double o_weight;		//����������/kg
	private int receiving;		//�Ƿ�ӵ���ɻ���:0��,1�ӵ�,2������,3���
	private Integer o_clerkid;		//�ӵ�ԱID
	private Integer o_ucid;		//����ԱID
	private double o_money;		//�������
	private String o_fintime;		//���ʱ��
	private int delflag;		//ɾ�����
	private Integer optid;		//����ԱID
	private String optime;		//���ݲ���ʱ��
	private String remark;		//��ע
	
	
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	
	public String getOdid() {
		return odid;
	}
	public void setOdid(String odid) {
		this.odid = odid;
	}
	public Integer getO_uid() {
		return o_uid;
	}
	public void setO_uid(Integer o_uid) {
		this.o_uid = o_uid;
	}
	public String getO_uaddress() {
		return o_uaddress;
	}
	public void setO_uaddress(String o_uaddress) {
		this.o_uaddress = o_uaddress;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getRegenerant() {
		return regenerant;
	}
	public void setRegenerant(String regenerant) {
		this.regenerant = regenerant;
	}
	public double getO_weight() {
		return o_weight;
	}
	public void setO_weight(double o_weight) {
		this.o_weight = o_weight;
	}
	public int getReceiving() {
		return receiving;
	}
	public void setReceiving(int receiving) {
		this.receiving = receiving;
	}
	public Integer getO_clerkid() {
		return o_clerkid;
	}
	public void setO_clerkid(Integer o_clerkid) {
		this.o_clerkid = o_clerkid;
	}
	public Integer getO_ucid() {
		return o_ucid;
	}
	public void setO_ucid(Integer o_ucid) {
		this.o_ucid = o_ucid;
	}
	public double getO_money() {
		return o_money;
	}
	public void setO_money(double o_money) {
		this.o_money = o_money;
	}
	public String getO_fintime() {
		return o_fintime;
	}
	public void setO_fintime(String o_fintime) {
		this.o_fintime = o_fintime;
	}
	public int getDelflag() {
		return delflag;
	}
	public void setDelflag(int delflag) {
		this.delflag = delflag;
	}
	public Integer getOptid() {
		return optid;
	}
	public void setOptid(Integer optid) {
		this.optid = optid;
	}
	public String getOptime() {
		return optime;
	}
	public void setOptime(String optime) {
		this.optime = optime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getR_name() {
		return R_name;
	}
	public void setR_name(String r_name) {
		R_name = r_name;
	}
	public String getR_nickname() {
		return r_nickname;
	}
	public void setR_nickname(String r_nickname) {
		this.r_nickname = r_nickname;
	}
	
	
	
	
}





