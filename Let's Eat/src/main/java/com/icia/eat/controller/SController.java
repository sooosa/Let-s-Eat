package com.icia.eat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.eat.dto.Review_SaveDTO;
import com.icia.eat.service.SService;


@Controller
public class SController {

	@Autowired
	private SService sSvc;
	
	private ModelAndView mav = new ModelAndView();
	
	

	// 업체 상세보기 (회원)
	@RequestMapping(value = "/storeView", method = RequestMethod.GET)
	public ModelAndView storeView(@RequestParam("storeCode") String storeCode, @RequestParam("mCode") String mCode) {

		mav = sSvc.storeView(storeCode, mCode);
		return mav;
	}
	

	// 업체 상세보기 선택날짜
	@RequestMapping(value = "/storeViewD", method = RequestMethod.GET)
	public ModelAndView storeViewD(@RequestParam("storeCode") String storeCode, @RequestParam("bookDate") String bookDate, @RequestParam("mCode") String mCode) {
		System.out.println("bookDate : " + bookDate);
				
		mav = sSvc.storeViewD(storeCode,bookDate,mCode);
		return mav;
	}
	
	
	
	// 업체 상세보기 (점주)
	@RequestMapping(value = "/sView", method = RequestMethod.GET)
	public ModelAndView sView(@RequestParam("storeCode") String storeCode) {
		
		mav = sSvc.sView(storeCode);

		return mav;
	}
	
	
	
	// 업체 상세보기에서 들어가는 리뷰 목록 - 최신순 (모든 회원, 점주가 볼 수 있음)
	@RequestMapping(value = "/storeRList", method = RequestMethod.GET)
	public @ResponseBody List<Review_SaveDTO> storeReviewList(@RequestParam("storeCode") String storeCode) {
		System.out.println(" storeCode : " + storeCode);

		List<Review_SaveDTO> storeRList = sSvc.storeReviewList(storeCode);
		return storeRList;
	}
	
	// 업체 상세보기에서 들어가는 리뷰 목록 - 평점 높은순
	@RequestMapping(value = "/storeRList_high", method = RequestMethod.GET)
	public @ResponseBody List<Review_SaveDTO> storeRListHigh(@RequestParam("storeCode") String storeCode) {

		List<Review_SaveDTO> storeRListHigh = sSvc.storeReviewListHigh(storeCode);
		return storeRListHigh;
	}

	// 업체 상세보기에서 들어가는 리뷰 목록 - 평점 낮은순
	@RequestMapping(value = "/storeRList_low", method = RequestMethod.GET)
	public @ResponseBody List<Review_SaveDTO> storeRListLow(@RequestParam("storeCode") String storeCode) {

		List<Review_SaveDTO> storeRListLow = sSvc.storeReviewListLow(storeCode);
		return storeRListLow;
	}
		
	// 해당업체 리뷰목록에서 본인이 쓴 리뷰 삭제하기
	@RequestMapping(value = "/storeReviewDel", method = RequestMethod.GET)
	public @ResponseBody String storeReviewDel(@RequestParam("rCode") String rCode) {

		String resultMsg = sSvc.storeReviewDel(rCode);
		return resultMsg;
	}
	
	
	
	
	
		
}




