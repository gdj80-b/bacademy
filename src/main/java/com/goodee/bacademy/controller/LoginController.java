package com.goodee.bacademy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodee.bacademy.mapper.LoginMapper;
import com.goodee.bacademy.vo.MemberVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	private final String yellow = "\u001B[33m";
	private final String reset = "\u001B[0m";
	
	@Autowired
	private LoginMapper loginMapper;
	
	@GetMapping("/loginForm")
	public String loginForm() {
		
		return "login/loginForm";
	}

	@PostMapping("/memberLogin")
	public String loginAction(HttpSession session
			  			, @RequestParam("id") String id
			  			, @RequestParam("pw") String pw
			  			, RedirectAttributes rattr) throws UnsupportedEncodingException {
		
		// requestParam 디버깅
		log.debug(yellow + "[loginAction] requestParam - id : {}, pw : {}" + reset, id, pw);
		// mapper 파라미터 세팅
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPw(pw);

		// 입력된 로그인 정보에 맞는 정보 가져오기
		Map<String, Object> loginInfo = loginMapper.validateMember(member);

		// 로그인 성공 시 
		if (loginInfo != null && !loginInfo.isEmpty()) {
			String loginId = (String) loginInfo.get("id");
			String loginName = (String) loginInfo.get("name");
			int loginGrade = (int) loginInfo.get("grade");
			int loginMyCash = (int) loginInfo.get("myCash");
		
			// mapper result 디버깅
			log.debug("loginId :{}, loginName :{}, loginGrade :{}, loginMyCash :{}"
					, loginId, loginName, loginGrade, loginMyCash); 
			
			//세션 정보 저장 (학생 case : 아이디, 이름, 권한, 캐쉬)
			session.setAttribute("loginInfo", loginInfo);
				
			return "redirect:/studentMainPage"; // 사용자가 로그인 페이지의 URL을 유지하지 않도록 리다이렉트	
		} else {
			rattr.addFlashAttribute("msgType", "로그인 실패 메시지");
			rattr.addFlashAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			return "redirect:/loginForm"; // 로그인 실패 시 로그인 페이지로 이동
		}
} 

	@GetMapping("/logout")
	public String logout (HttpSession session, RedirectAttributes rattr) throws UnsupportedEncodingException{
		// 세션 초기화	
		session.invalidate();
		// 로그아웃 메시지 전달
		rattr.addFlashAttribute("msgType", "로그아웃 메시지");
		rattr.addFlashAttribute("msg", "로그아웃 되었습니다.");

		return "redirect:/loginForm"; // loginForm.jsp로 이동
	}
}
