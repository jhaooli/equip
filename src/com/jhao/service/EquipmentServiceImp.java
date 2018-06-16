package com.jhao.service;

import java.sql.Date;
import java.util.List;

import com.jhao.po.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhao.mapper.EquipmentPOMapper;

@Service
public class EquipmentServiceImp implements EquipmentService{

	@Autowired
	EquipmentPOMapper equipmentPOMapper;
	
	@Override
	public List<EquipmentPO> list() {
		
		return equipmentPOMapper.list();
	}

	@Override
	public List<EquipmentPO> listByRent(String eqName) {
		
		return equipmentPOMapper.listByRent(eqName);
	}

	@Override
	public int rentUpdate(int eqAmount,int oid) {
		
		return equipmentPOMapper.rentUpdate(eqAmount,oid);
	}

	@Override
	public EquipmentPO listOne(int oid) {
		
		return equipmentPOMapper.listOne(oid);
	}

	@Override
	public int newRent(String usernamed, String eqName, int rentAmount, double price, double allPrice) {
		
		return equipmentPOMapper.newRent(usernamed, eqName, rentAmount, price, allPrice);
	}

	@Override
	public int createEq(String eqName, int eqAmount, double price) {

		return equipmentPOMapper.createEq(eqName,eqAmount,price);
	}

	@Override
	public int deleteEq(int oid) {

		return equipmentPOMapper.deleteEq(oid);
	}

	@Override
	public List<EquipmentPO> checkEq(String eqName) {

		return equipmentPOMapper.checkEq(eqName);
	}

	@Override
	public List<DamageTablePO> listDamage() {

		return equipmentPOMapper.listDamage();
	}

	@Override
	public List<MaintainTablePO> listMaintain() {

		return equipmentPOMapper.listMaintain();
	}

	@Override
	public List<LostTablePO> listLost() {

		return equipmentPOMapper.listLost();
	}

	@Override
	public List<RentTablePO> listRent() {

		return equipmentPOMapper.listRent();
	}

	@Override
	public int insertDamage(int oid, String eqName, String usernamed, String remarks, Date date, int amount) {
		return equipmentPOMapper.insertDamage(oid,eqName,usernamed,remarks,date,amount);
	}

	@Override
	public int checkOidByName(String eqName) {
		return equipmentPOMapper.checkOidByName(eqName);
	}

	@Override
	public int insertMaintain(int oid, String eqName, Date startDate, int eqAmount) {
		return equipmentPOMapper.insertMaintain(oid,eqName,startDate,eqAmount);
	}

	@Override
	public int insertLost(int oid, String eqName, Date date, int amount, String usernamed, String remarks) {
		return equipmentPOMapper.insertLost(oid,eqName,date,amount,usernamed,remarks);
	}

	@Override
	public int insertDelete(int oid, String eqName, Date date) {
		return equipmentPOMapper.insertDelete(oid,eqName,date);
	}

	@Override
	public String getNameByOid(int oid) {
		return equipmentPOMapper.getNameByOid(oid);
	}

	@Override
	public int updateEq(int eqAmount, String eqName, double price, int oid) {
		return equipmentPOMapper.updateEq(eqAmount,eqName,price,oid);
	}

	@Override
	public int updateRent(int eqAmount, String eqName, double price, double allPrice, int oid) {
		return equipmentPOMapper.updateRent(eqAmount,eqName,price,allPrice,oid);
	}

	@Override
	public int findOidInRent(String eqName, String usernamed, Date date) {
		return equipmentPOMapper.findOidInRent(eqName,usernamed,date);
	}


}
