package com.jhao.controller;

import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jhao.po.RentTablePO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhao.po.EquipmentPO;
import com.jhao.service.EquipmentService;

@RequestMapping("/toSimpleUser")
@Controller
public class SimpleUserController {

	@Autowired
	EquipmentService equipmentService;

	@RequestMapping("/toExaminationEq")
	public ModelAndView toExaminationEq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("运行到这个方法开始前");
		ModelAndView mav = new ModelAndView("examinationEq");
		getAllAvailableEquipment(mav);
		return mav;
	}

	public void getAllAvailableEquipment(ModelAndView mav) {
		System.out.println("运行到list前");
		List<EquipmentPO> es = equipmentService.list();
		/*
		 * 调试一下
		 */
		System.out.println("运行到调试前");
		Iterator<EquipmentPO> esi = es.iterator();
		while (esi.hasNext()) {

			System.out.println(esi.next());
		}
		//调试结束
		// 放入转发参数
		mav.addObject("es", es);
		System.out.println("运行到调试后  mav.addObject(, es);");
	}

	@RequestMapping("/toRentEq")
	public ModelAndView toRentEq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("运行到这个方法开始前");
		ModelAndView mav = new ModelAndView("rentEq");

		getRentEq(mav, request);
		getAllAvailableEquipment(mav);

		return mav;
	}

	public void getRentEq(ModelAndView mav, HttpServletRequest request) {
		//String username = (String) request.getAttribute("usernamed");
		//debug一下
		String username = "lee";
		request.setAttribute("usernamed",username);
		if (username != null) {

			System.out.println(username);
		}
		System.out.println("运行到listByRent前");
		try {

			List<RentTablePO> es = equipmentService.listByRent(username);
		/*
		 * 调试一下
		 */
			System.out.println("运行到调试前");
			Iterator<RentTablePO> esi = es.iterator();
			while (esi.hasNext()) {

				System.out.println(esi.next());
			}
			// 放入转发参数
			mav.addObject("esr", es);
			//调试结束
		} catch (Exception e) {
			System.out.println("运行到租借器材的 catch里,没有找到用户所租借的器材");
			e.printStackTrace();
		}
		System.out.println("运行到调试后  catch结束了");
	}

	@RequestMapping("/toReturnEq")
	public ModelAndView toReturnEq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("returnEq");
		getRentEq(mav, request);
		return mav;
	}

	@RequestMapping("")
	public ModelAndView toSimpleUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("simpleUser");
		return mav;
	}

	@RequestMapping("/rent")
	public ModelAndView rent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("rentEq");
		String name = request.getParameter("name");
		String strAmount = request.getParameter("amount");
		int amount = Integer.parseInt(strAmount);
		String strPrice = request.getParameter("price");
		double price = Double.parseDouble(strPrice);
		double allPrice = price * amount;
		int oid = getOidByName(name);
		System.out.println("oid=" + oid+" price="+price+" amount="+amount+" allPrice="+allPrice+" name="+name);
		java.util.Date d = new java.util.Date();
		Date date = new Date(d.getTime());
		String usernamed = null;
		usernamed = (String) request.getParameter("username");
		System.out.println("usernamed=" + usernamed);
		if (amount >= 0) {
				//租借表生成一个新的记录
				equipmentService.newRent(usernamed,name,amount,price,allPrice,date);
				EquipmentPO equipmentPO = equipmentService.listOne(oid);
				equipmentService.updateEq(equipmentPO.getEqAmount()-amount,equipmentPO.getEqName(),equipmentPO.getPrice(),oid);
				System.out.println("完成rent（）");
		}
		return mav;
	}

	private int getOidByName(String eqName) {
		try {
			int oid = equipmentService.checkOidByName(eqName);
			return oid;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}





	@RequestMapping("/returnEq")
	public ModelAndView returnEq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("rentEq");
		/*
		 调试一下
		 */
		//String usernamed = (String) request.getAttribute("usernamed");
		String usernamed = "lee";
		System.out.println("usernamed = "+usernamed);
		String name = request.getParameter("name");
		String strAmount = request.getParameter("amount");
		int amount = Integer.parseInt(strAmount);
		/*
		String strPrice = request.getParameter("price");
		double allPrice = Double.parseDouble(strPrice);
		double price = allPrice / amount;
		*/
		System.out.println(" amount="+amount +" name="+name);
		java.util.Date d = new java.util.Date();
		Date date = new Date(d.getTime());
		/*
				String usernamed = null;
		usernamed = (String) request.getParameter("username");
		System.out.println("usernamed=" + usernamed);
		 */

		if (amount >= 0) {
			int oid = equipmentService.findOidInRent(name,usernamed,date);
			//租借表的记录returned 设置为1
			equipmentService.returnEq(oid);
			EquipmentPO equipmentPO = equipmentService.listOne(getOidByName(name));
			System.out.println("这个器材："+equipmentPO+"其他信息 ="+equipmentPO.getEqAmount()+"--"+
					amount+"--"+equipmentPO.getEqName()+"--"+equipmentPO.getPrice());
			//equipmentService.updateEq(amount,eqName,price,oid);
			int newAmount = equipmentPO.getEqAmount()+amount;
			System.out.println("newAmount="+newAmount+" name="+equipmentPO.getEqName()+" price="+equipmentPO.getPrice()+"--------------------");
			String newName = equipmentPO.getEqName();
			double newPrice = equipmentPO.getPrice();
			int resultFlag = equipmentService.updateEq(newAmount,newName,newPrice,getOidByName(newName));
			System.out.println("resultFlag = "+resultFlag);
			System.out.println("完成returnEq（）");
		}
		getRentEq(mav, request);
		getAllAvailableEquipment(mav);
		return mav;
	}
	

}
