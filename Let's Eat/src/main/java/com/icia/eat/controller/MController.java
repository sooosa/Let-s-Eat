package com.icia.eat.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.icia.eat.api.NaverJoinApi;
import com.icia.eat.api.NaverLoginApi;
import com.icia.eat.dto.MemberDTO;
import com.icia.eat.dto.ReservationDTO;
import com.icia.eat.dto.Review_SaveDTO;
import com.icia.eat.dto.SearchDTO;
import com.icia.eat.service.MService;

@Controller
public class MController {

	@Autowired
	private MService mSvc;
	
	@Autowired
	private HttpSession session;
	
	
	@Autowired
	private NaverJoinApi naverJoinApi;
	
	@Autowired
	private NaverLoginApi naverLoginApi;
	
	private String apiResult;
	
	MemberDTO nmember = new MemberDTO();
	
	private ModelAndView mav = new ModelAndView();
	
	
	
	// 인덱스(시작페이지)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView startlist() {

		mav = mSvc.startlist();
		return mav;
	}
	
	// 인덱스 페이지로 이동시 업체목록 불러오기
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		
		mav = mSvc.startlist();
		return mav;
	}
	
	// 회원 가입 폼
	@RequestMapping(value = "mjoinForm", method = RequestMethod.GET)
	public String JoinForm() {
		
		return "mJoin";
	}

	// 회원가입
	@RequestMapping(value = "mjoin", method = RequestMethod.POST)
	public ModelAndView joinForm(@ModelAttribute MemberDTO member, @RequestParam("postcode") String postcode,
			@RequestParam("addr1") String addr1, @RequestParam("addr2") String addr2,
			@RequestParam("addr3") String addr3) {
		System.out.println("MemberDTO객체 확인");
		System.out.println(member);
		System.out.println("넘어온 주소값 확인");
		System.out.println("postcode : " + postcode);
		System.out.println("addr1 : " + addr1);
		System.out.println("addr2 : " + addr2);
		System.out.println("addr3 : " + addr3);

		String addr = addr1 + ", " + addr2 + addr3 + ", 우편번호 : " + postcode;
		member.setmAddr(addr);

		mav = mSvc.join(member);

		return mav;

	}
	
	// 회원 id Over lap (아이디 중복확인)
	@RequestMapping(value = "/midoverlap", method = RequestMethod.POST)
	public @ResponseBody String midOverlap(@RequestParam("mId") String mId) {

		String resultMsg = mSvc.midOverlap(mId);

		return resultMsg;
	}

	// 로그인 폼으로 이동
	@RequestMapping(value = "mloginForm", method = RequestMethod.GET)
	public String LoginForm() {
		
		return "mLogin";
	}

	// 일반 로그인
	@RequestMapping(value = "mlogin", method = RequestMethod.POST)
	public String Login(@RequestParam("mId") String mId, @RequestParam("mPw") String mPw, RedirectAttributes re) {

		String mChkey = mSvc.mLogin(mId, mPw);
		System.out.println("mChkey : " + mChkey);

		if (mChkey == "OK") {
			return "redirect:index";
		} else {
			re.addFlashAttribute("mChkey", mChkey);
		}
		return "redirect:mloginForm";
	}

	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public ModelAndView Logout() {
		
		session.invalidate();
		mav = mSvc.startlist();
		
		return mav;
	}

	// 회원 정보보기
	@RequestMapping(value = "/mview", method = RequestMethod.GET)
	public ModelAndView mView(@RequestParam("mId") String mId) {

		mav = new ModelAndView();

		mav = mSvc.mView(mId);

		return mav;
	}

	// 회원 정보 수정하기
	@RequestMapping(value = "/mModify", method = RequestMethod.POST)
	public ModelAndView mModify(MemberDTO member, @RequestParam("postcode") String postcode,
			@RequestParam("addr1") String addr1, @RequestParam("addr2") String addr2,
			@RequestParam("addr3") String addr3) {
		System.out.println("MemberDTO객체 확인");
		System.out.println(member);
		

		String addr = addr1 + ", " + addr2 + addr3 + ", 우편번호 : " + postcode;
		member.setmAddr(addr);

		mav = mSvc.mModify(member);

		return mav;
	}

	// 회원 삭제
	@RequestMapping(value = "/mDel", method = RequestMethod.GET)
	public @ResponseBody String mDel(@RequestParam("mId") String mId) {

		String resultMSG = mSvc.mDel(mId);
		return resultMSG;
	}

	// 회원아이디 찾기로 이동
	@RequestMapping(value = "findmId", method = RequestMethod.GET)
	public String findId() {
		
		return "mFindId";
	}

	// 아이디 찾기 checkId
	@RequestMapping(value = "/mfindid", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public @ResponseBody String CheckId(@RequestParam("mName") String mName, @RequestParam("mPhone") String mPhone) {
		System.out.println("mName , mPhone : " + mName + mPhone);
		
		String checkmid = mSvc.CheckmId(mName, mPhone);

		return checkmid;

	}

	// 회원 비밀번호 찾기 페이지
	@RequestMapping(value = "/findmPw", method = RequestMethod.GET)
	public String findmPwForm() {
		
		return "mFindPw";
	}

	// 회원 이메일 인증 번호 보내기
	@RequestMapping(value = "/mfindpw", method = RequestMethod.POST)
	public @ResponseBody String sendEmail(@RequestParam("mId") String mId, @RequestParam("mEmail") String mEmail) {

		String code = mSvc.sendEmail(mId, mEmail);

		return code;
	}

	// 이메일 인증 후 key_alter
	@RequestMapping(value = "/mkey_alter", method = RequestMethod.GET)
	public ModelAndView keyAlter(@ModelAttribute MemberDTO member) {
		
		mav = mSvc.mkeyAlter(member);
		return mav;
	}

	// 회원 비밀번호 변경
	@RequestMapping(value = "/changemPw", method = RequestMethod.POST)
	public ModelAndView mChange(@ModelAttribute MemberDTO member) {
		System.out.println("member" + member);
		
		mav = mSvc.mChange(member);
		return mav;
	}

	
	// 네이버 아이디로 회원가입
	@RequestMapping(value = "/naverjoin")
	public ModelAndView naverJoin() {
		String naverUrl = naverJoinApi.getAutorizationUrl(session);

		mav.addObject("naverUrl", naverUrl);
		mav.setViewName("NaverJoin");

		return mav;
	}

	// 네이버 로그인으로 회원가입 성공시 회원 callback호출
	@RequestMapping(value = "/naverjoinok")
	public ModelAndView callbackJoin(@RequestParam("code") String code, @RequestParam("state") String state)
			throws IOException, ParseException {

		OAuth2AccessToken oauthToken;
		oauthToken = naverJoinApi.getAccessToken(session, code, state);

		// 네이버에 로그인 된 사용자 정보 호출
		apiResult = naverJoinApi.getUserProfile(oauthToken);

		// apiResult에 담긴 내용이 JSON타입이기 때문에 String 변환 작업 수행
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);

		JSONObject member = (JSONObject) obj;
		JSONObject memberInfo = (JSONObject) member.get("response");

		System.out.println(memberInfo);

		// memberInfo : 네이버에 가입할 때 등록했던 유저 정보
		nmember.setmId("n" + (String) memberInfo.get("id"));
		nmember.setmName((String) memberInfo.get("name"));
		nmember.setmBirth((String) memberInfo.get("birthyear") + (String) memberInfo.get("birthday"));
		nmember.setmGender((String) memberInfo.get("gender"));
		nmember.setmEmail((String) memberInfo.get("email"));
		nmember.setmPhone((String) memberInfo.get("mobile"));
		mav = mSvc.nJoin(nmember);

		return mav;
	}

	// 네이버 로그인 버튼을 눌렀을 경우 회원 
	@RequestMapping(value = "/naverlogin")
	public ModelAndView naverLogin() {
		String naverUrl = naverLoginApi.getAutorizationUrl(session);

		mav.addObject("naverUrl", naverUrl);
		mav.setViewName("NaverJoin");

		return mav;
	}

	// 네이버에 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverloginok")
	public ModelAndView callbackLogin(@RequestParam("code") String code, @RequestParam("state") String state)
			throws IOException, ParseException {

		OAuth2AccessToken oauthToken;
		oauthToken = naverJoinApi.getAccessToken(session, code, state);

		// 네이버에 로그인 된 사용자 정보 호출
		apiResult = naverJoinApi.getUserProfile(oauthToken);

		// apiResult에 담긴 내용이 JSON타입이기 때문에 String 변환 작업 수행
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);

		JSONObject member = (JSONObject) obj;
		JSONObject memberInfo = (JSONObject) member.get("response");

		System.out.println(memberInfo);

		// memberInfo : 네이버에 가입할 때 등록했던 유저 정보

		String mId = "n" + (String) memberInfo.get("id");

		mav = mSvc.nLogin(mId);

		return mav;
	}
	
	
	// 검색기능
	@RequestMapping(value = "/search")
	public ModelAndView Search(@ModelAttribute SearchDTO search) {
		System.out.println("searchc : " + search);

		mav = mSvc.Search(search);
		return mav;
	}
	
	
	// 예약 목록
	@RequestMapping(value = "/reservationlist", method = RequestMethod.GET)
	public ModelAndView reservationlist(@ModelAttribute ReservationDTO reservation, @ModelAttribute Review_SaveDTO review) {
		
		mav = mSvc.reservationlist(reservation, review);
		return mav;
	}
	
	// 예약 취소하기
	@RequestMapping(value = "/mybookDel", method = RequestMethod.GET)
	public ModelAndView mybookDel(@RequestParam("bCode") String bCode, @RequestParam("bmCode") String bmCode) {

		mav = mSvc.mybookDel(bCode, bmCode);
		return mav;
	}
		
	
	// 찜 메소드 (추가) @ResponseBody=json 타입사용
	@RequestMapping(value = "/storesave", method = RequestMethod.GET)
	public @ResponseBody String storesave(@RequestParam("storeCode") String storeCode, @RequestParam("mCode") String mCode) {
		System.out.println("storeCode : " + storeCode);
		System.out.println("mCode : " + mCode);

		String resultMsg = mSvc.storesave(storeCode, mCode);
		
		System.out.println("resultMsg : " + resultMsg);

		return resultMsg;
	}

	// 찜 메소드 (취소) @ResponseBody=json 타입사용
	@RequestMapping(value = "/storesavex", method = RequestMethod.GET)
	public @ResponseBody String storesavex(@RequestParam("storeCode") String storeCode, @RequestParam("mCode") String mCode) {
		System.out.println("storeCode : " + storeCode);
		System.out.println("mCode : " + mCode);

		String resultMsg = mSvc.storesavex(storeCode, mCode);
		
		System.out.println("resultMsg : " + resultMsg);

		return resultMsg;
	}

	// 찜 목록보기
	@RequestMapping(value = "/savelist", method = RequestMethod.GET)
	public ModelAndView savelist(@RequestParam("smCode") String smCode) {
		
		mav = mSvc.savelist(smCode);
		return mav;
	}
	
	
	// 포인트 충전 폼으로 이동
	@RequestMapping(value = "/mPoint", method = RequestMethod.GET)
	public String mPoint() {
		
		return "addPointForm";
	}

	// 포인트 충전을 위한 메소드
	@RequestMapping(value = "/addPoint", method = RequestMethod.GET)
	public @ResponseBody String addPoint(@RequestParam("mPoint") String mPoint, @RequestParam("mCode") String mCode) {
		System.out.println("mPoint : " + mPoint);
		System.out.println("mCode : " + mCode);

		String resultMsg = mSvc.addPoint(mPoint, mCode);
		
		System.out.println("resultMsg : " + resultMsg);

		return resultMsg;
	}
	
	
	
	// 리뷰 작성하는 페이지로 이동 (예약코드 가지고 가기)
	@RequestMapping(value = "/rwriteForm", method = RequestMethod.GET)
	public ModelAndView WriteForm(@RequestParam("bCode") String bCode) {
		
		mav = mSvc.writeForm(bCode);
		return mav;
	}
	
	// 리뷰 작성
	@RequestMapping(value = "/rwrite", method = RequestMethod.POST)
	public ModelAndView Write(@ModelAttribute Review_SaveDTO Review) {
		System.out.println("review : " + Review);
		
		Review.setrBook(Review.getrBook().substring(0, 4) + "-" + Review.getrBook().substring(6, 8) + "-" + Review.getrBook().substring(10, 12));
		
		System.out.println("Review.getrBook : " + Review.getrBook());
		
		mav = mSvc.reviewWrite(Review);
		return mav;
	}
	
	// 내가 쓴 리뷰 목록 (마이 리뷰)
	@RequestMapping(value = "/myRList", method = RequestMethod.GET)
	public ModelAndView myReviewList(@RequestParam("rmId") String rmId) {
		
		mav = mSvc.myReviewList(rmId);
		return mav;
	}
	
	// 내가 쓴 리뷰 삭제하기 (마이 리뷰)
	@RequestMapping(value = "/myReviewDel", method = RequestMethod.GET)
	public ModelAndView myReviewDel(@RequestParam("rmId") String rmId, @RequestParam("rCode") String rCode) {
		
		mav = mSvc.myReviewDel(rCode, rmId);
		return mav;
	}
	
	// 나의 문의 현황 (회원)
	@RequestMapping(value = "/m_myQnAList", method = RequestMethod.GET)
	public ModelAndView M_myQnAList(@RequestParam("mQnAmId") String mQnAmId) {
		
		mav = mSvc.M_myQnAList(mQnAmId);
		return mav;
	}
	
	
	
	
	
	
	
	
	
}





