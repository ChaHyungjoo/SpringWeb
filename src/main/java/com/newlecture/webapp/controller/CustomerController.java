package com.newlecture.webapp.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.entity.NoticeView;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@RequestMapping("notice")
	public String notice(
			@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field, 
			@RequestParam(value="q", defaultValue="") String query, 
			Model model) {
		
		List<NoticeView> list = noticeDao.getList(page, field, query);
		model.addAttribute("list", list);
		model.addAttribute("count", noticeDao.getCount());
		
		
		return "customer.notice.list";
	}
	
	//@RequestMapping(value="notice-ajax", produces="text/plain;charset=UTF-8")
	@RequestMapping("notice-ajax")
	@ResponseBody
	public String noticeAjax(
			@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field, 
			@RequestParam(value="q", defaultValue="") String query, 
			Model model) throws UnsupportedEncodingException {
		
		List<NoticeView> list = noticeDao.getList(page, field, query);
		
		/*String json = "";
		StringBuilder builder = new StringBuilder();
		builder.append("[");
		builder.append("");
		builder.append("");
		builder.append("");
		
		json = builder.toString();*/
		
		String json = "";
		
		Gson gson = new Gson();
		json = gson.toJson(list);
		
		/*try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		return json;
	}
	
	@RequestMapping("notice/{id}")
	public String noticeDetail(@PathVariable(value="id") String id, Model model) {
		
		model.addAttribute("n", noticeDao.get(id));
		//model.addAttribute("prev", noticeDao.getPrev(id));
		//model.addAttribute("next", noticeDao.getNext(id));
		
		return "customer.notice.detail";
	}
	
	
}
