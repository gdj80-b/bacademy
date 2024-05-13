package com.goodee.bacademy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.bacademy.mapper.LoginMapper;
import com.goodee.bacademy.vo.Member;

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
	public String loginAction(HttpSession session,
			  			@RequestParam(name="id") String id,
			  			@RequestParam(name="pw") String pw) throws UnsupportedEncodingException {
		// requestParam 디버깅
		log.debug(yellow + "[loginAction] requestParam - id : {}, pw : {}" + reset, id, pw);
		// mapper 파라미터 세팅
		Member member = new Member();
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
			session.setAttribute("loginId", loginId);
			session.setAttribute("loginName", loginName);
			session.setAttribute("loginGrade", loginGrade);
			session.setAttribute("loginMyCash", loginMyCash);
	
			// 로그인 성공 시 메시지를 URL 매개변수로 전달
			String msg = URLEncoder.encode(loginName + "님, 환영합니다.", "UTF-8");
			
			return "redirect:/hello?msg=" + msg; // 사용자가 로그인 페이지의 URL을 유지하지 않도록 리다이렉트	
		} else {
		String msg = URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요.", "UTF-8");
		
			return "redirect:/loginForm?msg="+ msg; // 로그인 실패 시 로그인 페이지로 이동
		}
} 

	@GetMapping("/logout")
	public String logout (HttpSession session) throws UnsupportedEncodingException{
		String msg = URLEncoder.encode("로그아웃 되었습니다.", "UTF-8");
		
		String msgParam = (String) session.getAttribute("msgParam");
		
		if (msgParam != null && !msgParam.isEmpty()) {
			msg = msgParam;
		}
		
		session.invalidate();
		
		return "redirect:/login/loginForm?msg=" + msg; // loginForm.jsp로 이동
	}
}
