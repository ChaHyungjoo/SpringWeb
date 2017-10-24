package com.newlecture.webapp.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.fabric.xmlrpc.base.Data;
import com.newlecture.webapp.dao.MemberDao;
import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.dao.NoticeFileDao;
import com.newlecture.webapp.entity.Notice;
import com.newlecture.webapp.entity.NoticeFile;
import com.newlecture.webapp.entity.NoticeView;
import com.newlecture.webapp.service.admin.BoardService;

@Controller
@RequestMapping("/admin/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;

	/*@Autowired
	private NoticeDao noticeDao;	//service-context�� bean ���Ϸ� ��������� ��밡��
	
	@Autowired
	private NoticeFileDao noticeFileDao;	//service-context�� bean ���Ϸ� ��������� ��밡��
	
	@Autowired
	private MemberDao memberDao;*/
	
	@RequestMapping("notice")
	public String notice(
			@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field, 
			@RequestParam(value="q", defaultValue="") String query, 
			Model model) {
		
		List<NoticeView> list = service.getNoticeList();
		model.addAttribute("list", list);
		
		return "admin.board.notice.list";
	}
	
	@RequestMapping("notice/{id}")
	public String noticeDetail(@PathVariable(value="id") String id, Model model) {
		
		model.addAttribute("n", service.getNotice(id));
		model.addAttribute("prev", service.getNotice(id));
		model.addAttribute("next", service.getNoticeNext(id));
		
		return "admin.board.notice.detail";
	}
	
	@RequestMapping(value="notice/reg", method=RequestMethod.GET)
	public String noticeReg() {
		
		return "admin.board.notice.reg";
	}
	
	@RequestMapping(value="notice/reg", method=RequestMethod.POST)
	public String noticeReg(
			Notice notice, 
			String aa, 
			MultipartFile file,
			HttpServletRequest request,
			Principal principal) throws IOException {
		//Principal: ���� �����(�α��� �� ����� id)�� ������
		
		//��¥ ��� ���
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);

		String nextId = service.getNextId();
		
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath(
				String.format("/resource/customer/notice/%d/%s", year, nextId));
		
		System.out.println(path);
		
		File f = new File(path);	//������ ����� ��θ� ��ü�� ������ ����
		
		//��ΰ� ���� ��� �ش� ���(����)�� ����
		if(!f.exists()) {
			if(!f.mkdirs())
				System.out.println("���丮�� ������ �� �����ϴ�.");
		}
		
		//������ ����� ���+�����̸��� path�� ����
		path += File.separator + file.getOriginalFilename();
		File f2 = new File(path);
		
		InputStream fis = file.getInputStream();
		OutputStream fos = new FileOutputStream(f2);
		
		byte[] buf = new byte[1024];
		
		int size = 0;
		while((size = fis.read(buf)) >0)
			fos.write(buf, 0, size);
		
		fos.close();
		fis.close();
		
		
		//file.getInputStream();
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		
		String writerId = "a";
		//String writerId = principal.getName();
		
		System.out.println(notice.getTitle());
		notice.setWriterId(writerId);
		
		//int row = noticeDao.insert(title, content, writerId);
		int row = service.insertAndPointUp(notice);
		//memberDao.pointUp(principal.getName());
		
		
		service.insert(new NoticeFile(null, fileName, nextId));
		
		return "redirect:../notice";
	}
	
	
}
