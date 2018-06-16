package com.jhao.mapper;

import java.sql.Date;
import java.util.List;

import com.jhao.po.*;

public interface EquipmentPOMapper {

		//simple user的操作
	    public List<EquipmentPO> list();
	    
	    public List<EquipmentPO> listByRent(String eqName);
	    
	    public int  rentUpdate(int eqAmount, int oid);
	     
	    public EquipmentPO listOne(int oid);
	    
	    public int newRent(String usernamed, String eqName, int rentAmount, double price, double allPrice);

	    //super user的操作
		public int createEq(String eqName,int eqAmount,double price);

		public int deleteEq(int oid);

		public List<EquipmentPO> checkEq(String eqName);

		public List<DamageTablePO> listDamage();

		public List<MaintainTablePO> listMaintain();

		public List<LostTablePO> listLost();

		public List<RentTablePO> listRent();

		public int insertDamage(int oid, String eqName, String usernamed, String remarks, Date date,int amount);

		public int checkOidByName(String eqName);

		public int insertMaintain(int oid,String eqName,Date startDate,int eqAmount);

		public int insertLost(int oid,String eqName,Date date,int amount,String usernamed,String remarks);

		public int insertDelete(int oid,String eqName,Date date);

		public String getNameByOid(int oid);

		public int updateEq(int eqAmount,String eqName,double price,int oid);

		public int updateRent(int eqAmount,String eqName,double price,double allPrice,int oid);

		public int findOidInRent(String eqName,String usernamed,Date date);
}
