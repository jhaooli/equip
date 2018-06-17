package com.jhao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jhao.po.*;
import com.jhao.service.EquipmentService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

@RequestMapping("/toSuperUser")
@Controller
public class SuperUserController {

	@Autowired
	EquipmentService equipmentService;
	public int flag;

	@RequestMapping("/toCreateEq")
	public ModelAndView toCreateEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createEq");

		return mav;
		}

	//新增器材信息
	@RequestMapping("/CreateEq")
	public ModelAndView createEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createEq");
		createEquipment(request);
		return mav;
	}

	//新增损坏器材信息
	@RequestMapping("/CreateDamageEq")
	public ModelAndView createDamageEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createEq");
		//添加损坏器材信息方法
		createDamageMessage(request);
		return mav;
	}

	//新增维护器材信息
	@RequestMapping("/CreateMaintainEq")
	public ModelAndView createMaintainEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createEq");
		//添加损坏器材信息方法
		createMaintainMessage(request);
		return mav;
	}

	//新增丢失器材信息
	@RequestMapping("/CreateLostEq")
	public ModelAndView createLostEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("createEq");
		//添加丢失器材信息方法
		createLostMessage(request);
		return mav;
	}



	@RequestMapping("/toDeleteEq")
	public ModelAndView toDeleteEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deleteEq");
		getAllAvailableEquipment(mav);
		return mav;
	}

	@RequestMapping("/DeleteEq")
	public ModelAndView deleteEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deleteEq");
		deleteEquipment(request);
		getAllAvailableEquipment(mav);
		return mav;
	}



	@RequestMapping("/toUpdateEq")
	public ModelAndView toUpdateEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateEq");
		//获取所有器材 select * from equipment
		getAllAvailableEquipment(mav);
		//显示租借表
		showRentTable(mav);
		//显示损坏表
		showDamageTable(mav);
		//显示维护表
		showMaintainTable(mav);
		//显示丢失表
		showLostTable(mav);
		return mav;
	}

	/*
		这是更新器材信息
	 */
	@RequestMapping("/UpdateEq")
	public ModelAndView updateEq(HttpServletRequest request, HttpServletResponse response) throws Exception{

		updateEquip(request);

		return toUpdateEq(request,response);
	}

	private void updateEquip(HttpServletRequest request) {
		String eqName = request.getParameter("name");
		String strAmount = request.getParameter("amount");
		int amount  =  Integer.parseInt(strAmount);
		String strPrice = request.getParameter("price");
		double price = Double.parseDouble(strPrice);

		int oid =getOidByName(eqName);
		System.out.println("eqname="+eqName+" amount="+amount+" price="+price+" oid="+oid);
		equipmentService.updateEq(amount,eqName,price,oid);
		System.out.println("完成updateEquip(HttpServletRequest request) ");
	}


	@RequestMapping("/UpdateMaintain")
	public ModelAndView updateMaintain(HttpServletRequest request, HttpServletResponse response) throws Exception{

		updateMaintainMessage(request);

		return toUpdateEq(request,response);
	}

	private void updateMaintainMessage(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name");
		String strAmount = request.getParameter("amount");
		int amount = Integer.parseInt(strAmount);
		String strDate = request.getParameter("startDate");
		java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
		System.out.println("运行到转换date之前");
		java.util.Date date1 = (java.util.Date) formatter.parse(strDate.toString());
		System.out.println("date="+date1+"--"+date1.getTime());
		Date d = new Date(date1.getTime());
		String usernamed = request.getParameter("usernamed");
		if(amount>0){
			equipmentService.updateMaintain(amount,name,usernamed,d);
			System.out.println("完成updateMaintainMessage（）");
		}
	}


	@RequestMapping("/UpdateRent")
	public ModelAndView updateRent(HttpServletRequest request, HttpServletResponse response) throws Exception{

		updateRentMessage(request);

		return toUpdateEq(request,response);
	}

	private void updateRentMessage(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name");
		String usernamed = request.getParameter("usernamed");
		String startDate = request.getParameter("startDate");
		System.out.println("startDate ="+startDate);
		java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
		System.out.println("运行到转换date之前");
		java.util.Date date = (java.util.Date) formatter.parse(startDate.toString());
		System.out.println("date="+date+"--"+date.getTime());
		Date d = new Date(date.getTime());
		System.out.println("d="+d+"--"+d.getTime());
		System.out.println("运行到转换date之后");
		System.out.println("date = "+d);
		String strrentAmount = request.getParameter("rentAmount");
		int rentAmount  =  Integer.parseInt(strrentAmount);
		String strPrice = request.getParameter("price");
		Double price = Double.parseDouble(strPrice);
		Double allprice = price*rentAmount;
		int oid = equipmentService.findOidInRent(name,usernamed,d);
		System.out.println("name="+name+" amount="+rentAmount+" price="+price+" oid="+oid+" allprice = "+allprice);
		if(rentAmount!=0){
			equipmentService.updateRent(rentAmount,name,price,allprice,oid);
		}
	}

	@RequestMapping("/UpdateDamage")
	public ModelAndView updateDamage(HttpServletRequest request, HttpServletResponse response) throws Exception{

		updateDamageMessage(request);

		return toUpdateEq(request,response);
	}

	private void updateDamageMessage(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name");
		String usernamed = request.getParameter("usernamed");
		String remarks = request.getParameter("remarks");
		String date = request.getParameter("date");
		System.out.println("date ="+date);
		java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
		System.out.println("运行到转换date之前");
		java.util.Date date1 = (java.util.Date) formatter.parse(date.toString());
		System.out.println("date="+date1+"--"+date1.getTime());
		Date d = new Date(date1.getTime());
		System.out.println("d="+d+"--"+d.getTime());
		System.out.println("运行到转换date之后");
		System.out.println("date = "+d);
		String strrentAmount = request.getParameter("amount");
		int amount  =  Integer.parseInt(strrentAmount);
		int oid = getOidByName(name);
		if(amount>0&&oid!=-1){
			equipmentService.updateDamage(name,usernamed,amount,remarks,oid);
			System.out.println("完成equipmentService.updateDamage(name,usernamed,amount,remarks,oid);");
		}

	}

	@RequestMapping("/UpdateLost")
	public ModelAndView updateLost(HttpServletRequest request, HttpServletResponse response) throws Exception{

		updateLostMessage(request);

		return toUpdateEq(request,response);
	}

	private void updateLostMessage(HttpServletRequest request) throws Exception{
		String name = request.getParameter("name");
		String usernamed = request.getParameter("usernamed");
		String remarks = request.getParameter("remarks");
		String date = request.getParameter("date");
		System.out.println("date ="+date);
		java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
		System.out.println("运行到转换date之前");
		java.util.Date date1 = (java.util.Date) formatter.parse(date.toString());
		System.out.println("date="+date1+"--"+date1.getTime());
		Date d = new Date(date1.getTime());
		System.out.println("d="+d+"--"+d.getTime());
		System.out.println("运行到转换date之后");
		System.out.println("date = "+d);
		String strrentAmount = request.getParameter("amount");
		int amount  =  Integer.parseInt(strrentAmount);
		int oid = getOidByName(name);
		if(amount>0&&oid!=-1){
			equipmentService.updateLost(name,usernamed,amount,remarks,oid);
			System.out.println("完成updateLostMessage(HttpServletRequest request) throws Exception");
		}
	}

	@RequestMapping("/toExaminationEq")
	public ModelAndView toExaminationEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("examinationEqforSuper");
		//获取所有器材 select * from equipment
		getAllAvailableEquipment(mav);
		//显示租借表
		showRentTable(mav);
		//显示损坏表
		showDamageTable(mav);
		//显示维护表
		showMaintainTable(mav);
		//显示丢失表
		showLostTable(mav);
		//每个表前一个form进行详细查询
		return mav;
	}

	@RequestMapping("")
	public ModelAndView toSuperUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("superUser");
		return mav;
	}

	//移除器材
	private void deleteEquipment(HttpServletRequest request) {
		String strOid = request.getParameter("oid");
		int oid  =  Integer.parseInt(strOid);

		String eqName = getNameByOid(oid);
		System.out.println("oid = "+oid+" eqname ="+eqName);
		java.util.Date d = new java.util.Date();
		Date date = new Date(d.getTime());
		//移除表加数据
		equipmentService.insertDelete(oid,eqName,date);
		System.out.println("完成equipmentService.insertDelete(oid,eqName,date);");
		//器材表删除数据
		equipmentService.deleteEq(oid);
		System.out.println("完成equipmentService.deleteEq(oid);");
	}

	public void createEquipment(HttpServletRequest request){
		String eqName = request.getParameter("eqName");
		String strAmount = request.getParameter("eqAmount");
		int eqAmount  =  Integer.parseInt(strAmount);
		String strPrice = request.getParameter("price");
		double price = Double.parseDouble(strPrice);
		System.out.println("eqname = "+eqName+" eqAmount = "+strAmount+" price = "+strPrice);
		if(eqAmount>0){
			//List<EquipmentPO> list = equipmentService.checkEq(eqName);
			flag = getOidByName(eqName);
			System.out.println("flag = "+flag);
			//调试输出
			//Iterator<EquipmentPO> iterator = list.iterator();
			if(flag==-1){
				equipmentService.createEq(eqName,eqAmount,price);
			}else{
				/*
					这需要做一些什么反馈给用户让用户知道器材已存在，无法添加
				 */
				System.out.println("已存在"+" flag = "+flag);
				//while (iterator.hasNext()){
				//	System.out.println(iterator.next());
				//	System.out.println("eqname = "+iterator.next().getEqName());
				//	System.out.println("oid = "+iterator.next().getOid());
				//	System.out.println("amount = "+iterator.next().getEqAmount());
				//}
			}

		}
		System.out.println("完成createEquipment(HttpServletRequest request)");
	}

	//添加损坏器材信息
	public void createDamageMessage(HttpServletRequest request){
		//似乎需要由名字查询oid
		//先做一次查询


		String eqName = request.getParameter("eqName");
		int oid = getOidByName(eqName);
		String strAmount = request.getParameter("amount");
		int amount  =  Integer.parseInt(strAmount);
		String remarks = request.getParameter("remarks");
		String usernamed = request.getParameter("usernamed");
		java.util.Date date = new java.util.Date();
		System.out.println("oid = "+oid+"eqname = "+eqName+" eqAmount = "+strAmount+" remarks = "+remarks+
							" date = "+ new Date(date.getTime()));
		if(amount>0&&oid!=-1){
			//添加信息
			flag = equipmentService.insertDamage(oid,eqName,usernamed,remarks,new Date(date.getTime()),amount);
		}
		System.out.println("完成createDamageMessage(HttpServletRequest request)");
	}

	//显示丢失表
	public  void showRentTable(ModelAndView mav){
		List<RentTablePO> listRent= equipmentService.listRent();
		System.out.println("运行到调试前");
		Iterator<RentTablePO> listlistRentIterator = listRent.iterator();
		while(listlistRentIterator.hasNext()){
			System.out.println(listlistRentIterator.next());
		}
		//调试结束
		// 放入转发参数
		mav.addObject("listRent", listRent);
		System.out.println("运行到调试后 mav.addObject(\"listRent\", listRent);");
	}

	//显示丢失表
	public  void showLostTable(ModelAndView mav){
		List<LostTablePO> listLost= equipmentService.listLost();
		System.out.println("运行到调试前");
		Iterator<LostTablePO> listLostIterator = listLost.iterator();
		while(listLostIterator.hasNext()){
			System.out.println(listLostIterator.next());
		}
		//调试结束
		// 放入转发参数
		mav.addObject("listLost", listLost);
		System.out.println("运行到调试后  mav.addObject(\"listLost\", listLost);");
	}

	//显示损坏表
	public  void showDamageTable(ModelAndView mav){
		List<DamageTablePO> listDamage= equipmentService.listDamage();
		System.out.println("运行到调试前");
		Iterator<DamageTablePO> listDamageIterator = listDamage.iterator();
		while(listDamageIterator.hasNext()){
			System.out.println(listDamageIterator.next());
		}
		//调试结束
		// 放入转发参数
		mav.addObject("listDamage", listDamage);
		System.out.println("运行到调试后  mav.addObject(\"listDamage\", listDamage);");
	}

	//显示维护表
	public  void showMaintainTable(ModelAndView mav){
		List<MaintainTablePO> listMaintain= equipmentService.listMaintain();
		System.out.println("运行到调试前");
		Iterator<MaintainTablePO> listMaintainIterator = listMaintain.iterator();
		while(listMaintainIterator.hasNext()){
			System.out.println(listMaintainIterator.next());
		}
		//调试结束
		// 放入转发参数
		mav.addObject("listMaintain", listMaintain);
		System.out.println("运行到调试后  mav.addObject(\"listMaintain\", listMaintain);");
	}

	public void getAllAvailableEquipment(ModelAndView mav){
		System.out.println("运行到list前");
		List<EquipmentPO> es= equipmentService.list();
		//调试一下
		System.out.println("运行到调试前");
		Iterator<EquipmentPO> esi = es.iterator();
		while(esi.hasNext()){
			System.out.println(esi.next());
		}
		//调试结束
		// 放入转发参数
		mav.addObject("es", es);
		System.out.println("运行到调试后  mav.addObject(\"es\", es);");
	}

	//新增器材维护信息
	private void createMaintainMessage(HttpServletRequest request) {

		String eqName = request.getParameter("eqName");
		//似乎需要由名字查询oid
		//先做一次查询
		int oid = getOidByName(eqName);
		String strAmount = request.getParameter("amount");
		int eqAmount  =  Integer.parseInt(strAmount);
		java.util.Date date = new java.util.Date();
		System.out.println("oid = "+oid+" eqname = "+eqName+" eqAmount = "+strAmount+
				" date = "+ new Date(date.getTime()));
		if(eqAmount>0&&oid!=-1){
			//添加信息
			equipmentService.insertMaintain(oid,eqName,new Date(date.getTime()),eqAmount);
		}
		System.out.println("完成createMaintainMessage(HttpServletRequest request)");
	}

	private int getOidByName(String eqName){
		try {
			int oid = equipmentService.checkOidByName(eqName);
			return oid;
		}catch (Exception e){
			e.printStackTrace();
			return -1;
		}

	}

	//新增损丢失器材信息
	private void createLostMessage(HttpServletRequest request) {

		String eqName = request.getParameter("eqName");
		//似乎需要由名字查询oid
		//先做一次查询
		int oid = getOidByName(eqName);
		String strAmount = request.getParameter("amount");
		int amount  =  Integer.parseInt(strAmount);
		String usernamed = request.getParameter("usernamed");
		String remarks = request.getParameter("remarks");
		java.util.Date date = new java.util.Date();
		Date d = new Date(date.getTime());
		System.out.println("oid = "+oid+" eqname = "+eqName+" amount = "+strAmount+
				" date = "+ d+" remarks ="+remarks+" usernamed = "+usernamed);
		if(amount>0&&oid!=-1){
			//添加信息
			equipmentService.insertLost(oid,eqName,d,amount,usernamed,remarks);
		}
		System.out.println("完成createLostMessage(HttpServletRequest request) ");
	}

	private String getNameByOid(int oid){

		return equipmentService.getNameByOid(oid);
	}

}
