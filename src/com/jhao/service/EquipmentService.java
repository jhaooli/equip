package com.jhao.service;

import java.sql.Date;
import java.util.List;

import com.jhao.po.*;

public interface EquipmentService {

	//普通用户操作
	public List<EquipmentPO> list();
	public List<EquipmentPO> listByRent(String eqName);//已借器材
	 public int  rentUpdate(int eqAmount, int oid);//租借器材
	 public EquipmentPO listOne(int oid);//根据id找单个器材记录

	 //租借表生成一个新的记录
	 public int newRent(String usernamed, String eqName, int rentAmount, double price, double allPrice);
	 //管理员操作
	//新增器材
	public int createEq(String eqName,int eqAmount,double price);
	//删除
	public int deleteEq(int oid);
	//检查同名器材 新增器材前调用
	public List<EquipmentPO> checkEq(String eqName);
	//显示损坏表
	public List<DamageTablePO> listDamage();
	//显示维护表
	public List<MaintainTablePO> listMaintain();
	public List<LostTablePO> listLost();
	public List<RentTablePO> listRent();
	//新增损坏器材信息
	public int insertDamage(int oid, String eqName, String usernamed, String remarks, Date date, int amount);
	public int checkOidByName(String eqName);
	//新增维护器材信息
	public int insertMaintain(int oid,String eqName,Date startDate,int eqAmount);
	//新增丢失器材信息
	public int insertLost(int oid,String eqName,Date date,int amount,String usernamed,String remarks);
	//新增器材移除表数据
	public int insertDelete(int oid,String eqName,Date date);

	public String getNameByOid(int oid);

	public int updateEq(int eqAmount,String eqName,double price,int oid);

	public int updateRent(int eqAmount,String eqName,double price,double allPrice,int oid);

	public int findOidInRent(String eqName,String usernamed,Date date);
}
