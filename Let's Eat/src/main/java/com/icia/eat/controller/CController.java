package com.icia.eat.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.eat.dto.CompanyDTO;
import com.icia.eat.dto.StoreDTO;
import com.icia.eat.service.CService;


@Controller
public class CController {

	@Autowired
	private CService cSvc;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav = new ModelAndView();
	
	
	
	// 점주 회원가입 폼
	@RequestMapping(value = "cjoinForm", method = RequestMethod.GET)
	public String JoinForm() {
		return "cJoin";
	}

	// 점주 회원가입
	@RequestMapping(value = "cjoin", method = RequestMethod.POST)
	public ModelAndView joinForm(CompanyDTO company) {

		mav = new ModelAndView();

		mav = cSvc.join(company);

		return mav;
	}

	// idOver lap (아이디 중복확인)
	@RequestMapping(value = "/cidoverlap", method = RequestMethod.POST)
	public @ResponseBody String idOverlap(@RequestParam("cId") String cId) {

		String resultcMsg = cSvc.cidOverlap(cId);

		return resultcMsg;
	}
	
	// 로그인 폼으로 이동
	@RequestMapping(value = "cloginForm", method = RequestMethod.GET)
	public String LoginForm() {
		return "cLogin";
	}

	// 점주 로그인
	@RequestMapping(value = "clogin", method = RequestMethod.POST)
	public String Login(@RequestParam("cId") String cId, @RequestParam("cPw") String cPw, RedirectAttributes re) {

		String cChkey = cSvc.cLogin(cId, cPw);
		System.out.println("cChkey : " + cChkey);

		if (cChkey == "OK") {
			return "redirect:index";
			
		} else if(cChkey == "AD"){
			return "redirect:sa_index";
			
		} else {
			re.addFlashAttribute("cChkey", cChkey);
		}
		
		return "redirect:cloginForm";
	}

	// 점주 정보보기
	@RequestMapping(value = "/cview", method = RequestMethod.GET)
	public ModelAndView cView(@RequestParam("cId") String cId) {
		mav = new ModelAndView();

		mav = cSvc.cView(cId);

		return mav;
	}

	// 점주 수정하기
	@RequestMapping(value = "/cModify", method = RequestMethod.POST)
	public ModelAndView cModify(CompanyDTO company) {

		mav = cSvc.cModify(company);

		return mav;
	}

	// 점주 삭제
	@RequestMapping(value = "/cDel", method = RequestMethod.GET)
	public @ResponseBody String cDel(@RequestParam("cId") String cId) {

		String resultMSG = cSvc.cDel(cId);

		return resultMSG;
	}

	// 점주 아이디 찾기로 이동
	@RequestMapping(value = "findcId", method = RequestMethod.GET)
	public String cfindId() {
		return "cFindId";
	}

	// 점주 아이디 찾기 checkId
	@RequestMapping(value = "/cfindid", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public @ResponseBody String CheckId(@RequestParam("cName") String cName, @RequestParam("cPhone") String cPhone) {
		System.out.println("cName , cPhone : " + cName + cPhone);
		
		String checkid = cSvc.CheckcId(cName, cPhone);

		return checkid;

	}

	// 점주 이메일 인증 번호 보내기
	@RequestMapping(value = "/cfindpw", method = RequestMethod.POST)
	public @ResponseBody String sendcEmail(@RequestParam("cId") String cId, @RequestParam("cEmail") String cEmail) {

		String code = cSvc.sendcEmail(cId, cEmail);
		return code;
	}

	// 이메일 인증 후 ckeyalter
	@RequestMapping(value = "/ckeyalter", method = RequestMethod.GET)
	public ModelAndView ckeyAlter(@ModelAttribute CompanyDTO company) {
		mav = cSvc.ckeyAlter(company);
		return mav;
	}
	
	// 점주 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/findcPw", method = RequestMethod.GET)
	public String cfindPwForm() {
		return "cFindPw";
	}

	// 점주 비밀번호 변경
	@RequestMapping(value = "/changecPw", method = RequestMethod.POST)
	public ModelAndView cChange(@ModelAttribute CompanyDTO company) {

		System.out.println("company" + company);

		mav = cSvc.cChange(company);
		return mav;
	}
	
	
	// 업체관리 페이지(점주 - 업체 리스트) 
	@RequestMapping(value = "/mgstore", method = RequestMethod.GET)
	public ModelAndView mgstore(@RequestParam("scCode") String scCode) {
		System.out.println("scCode : " + scCode);
		
		mav = cSvc.mgstore(scCode);
		return mav;
	}
	
	// 업체 등록 폼으로 이동
	@RequestMapping(value = "/upform", method = RequestMethod.GET)
	public String upform() {
		
		return "upform";
	}
	
	// 업체 등록 메소드
	@RequestMapping(value = "/cupdate", method = RequestMethod.POST)
	public ModelAndView cupdate(@ModelAttribute StoreDTO store, @RequestParam("addr1") String addr1, @RequestParam("addr2") String addr2, @RequestParam("addr3") String addr3,
			@RequestParam("sFood") String sFood, @RequestParam("keyword1") String keyword1, @RequestParam("keyword2") String keyword2, @RequestParam("keyword3") String keyword3,
			@RequestParam("keyword4") String keyword4, @RequestParam("keyword5") String keyword5) throws IllegalStateException, IOException {

		store.setsFood("#" + sFood);
		store.setsKeyword("#" + keyword1 + ", #" + keyword2 + ", #" + keyword3 + ", #" + keyword4 + ", #" + keyword5);
		store.setsAddr(addr1 + ", " + addr2 + addr3);
		
		System.out.println(store);
		
		mav = cSvc.cupdate(store);
		System.out.println(store);

		return mav;
	}
	
	
	
	// 나의 문의 현황 (점주)
	@RequestMapping(value = "/c_myQnAList", method = RequestMethod.GET)
	public ModelAndView C_myQnAList(@RequestParam("cQnAcId") String cQnAcId) {

		mav = cSvc.C_myQnAList(cQnAcId);
		return mav;
	}
	
	
	
	

	
		
	
	
}



