package com.jhao.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView toExaminationEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("运行到这个方法开始前");
		ModelAndView mav = new ModelAndView("examinationEq");
		getAllAvailableEquipment(mav);
		return mav;
	}
	
	public void getAllAvailableEquipment(ModelAndView mav){
		System.out.println("运行到list前");
		List<EquipmentPO> es= equipmentService.list();
		/*
		 * 调试一下
		 */
		System.out.println("运行到调试前");
		 Iterator<EquipmentPO> esi = es.iterator();
		 while(esi.hasNext()){
			 
			 System.out.println(esi.next());
		 }
		 //调试结束
        // 放入转发参数
        mav.addObject("es", es);
        System.out.println("运行到调试后  mav.addObject(, es);");
	}
	
	@RequestMapping("/toRentEq")
	public ModelAndView toRentEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("运行到这个方法开始前");
		ModelAndView mav = new ModelAndView("rentEq");
		
        getRentEq(mav, request);
        getAllAvailableEquipment(mav);
		return mav;
	}
	
	public void getRentEq(ModelAndView mav,HttpServletRequest request){
		String username = (String) request.getAttribute("usernamed");
		if(username!=null){
			
			System.out.println(username);
		}
		System.out.println("运行到listByRent前");
		try{
			
			List<EquipmentPO> es= equipmentService.listByRent(username);
		/*
		 * 调试一下
		 */
		System.out.println("运行到调试前");
		 Iterator<EquipmentPO> esi = es.iterator();
		 while(esi.hasNext()){
			 
			 System.out.println(esi.next());
		 }
		 // 放入转发参数
		 mav.addObject("esr", es);
		 //调试结束
		}catch(Exception e){
			System.out.println("运行到租借器材的 catch里");
			e.printStackTrace();
		}   
        System.out.println("运行到调试后  catch结束了");
	}
	
	@RequestMapping("/toReturnEq")
	public ModelAndView toReturnEq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("returnEq");
		getRentEq(mav, request);
		return mav;
	}
	
	@RequestMapping("")
	public ModelAndView toSimpleUser(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("simpleUser");
		return mav;
	}
	
	@RequestMapping("/rent")
	public ModelAndView rent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("rentEq");
		
		String oid =request.getParameter("oid");
		System.out.println("oid="+oid);
		int oid1  =  Integer.parseInt(oid);;
		System.out.println("oid1="+oid1);
		EquipmentPO ePO = equipmentService.listOne(oid1);
		int eqAmount = ePO.getEqAmount()-1;
		System.out.println("eqAmount="+eqAmount);
		String eqName = ePO.getEqName();
		System.out.println("eqName="+eqName);
		double price = ePO.getPrice();
		String usernamed = null;
		usernamed = (String)request.getParameter("username");
		System.out.println("usernamed="+usernamed);
		if(eqAmount>=0){
		
			int flag = equipmentService.rentUpdate(eqAmount,oid1);
			System.out.println("flag="+flag);
			if(flag!=0){
			//租借表生成一个新的记录
			equipmentService.newRent(usernamed, eqName, 1, price, price);
			}
		}
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
