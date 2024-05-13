package com.goodee.bacademy.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodee.bacademy.mapper.MemberJoinMapper;
import com.goodee.bacademy.vo.MemberVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberJoinController {

	private final String yellow = "\u001B[33m";
	private final String reset = "\u001B[0m";

	@Autowired
	MemberJoinMapper memberJoinMapper; // 사용할 mapper mean 의존성 주입받기

	@GetMapping("/memberJoinForm")
	public String memberJoinForm() {
		return "memberJoin/joinForm"; // 회원가입 화면으로 이동
	}
	
	@Transactional
	@PostMapping("/memberJoin")
	public String memberJoinAction(@RequestParam Map<String, String> studntInfo, RedirectAttributes rattr) {
		// mapper에 전달할 parameter 세팅
		Map<String, String> memberMap = new HashMap<String, String>();
		Map<String, String> studentMap = new HashMap<String, String>();
		
		memberMap.put("id",studntInfo.get("id"));
		memberMap.put("pw",studntInfo.get("pw"));
		memberMap.put("phoneNum",studntInfo.get("phoneNum"));
		
		studentMap.put("id",studntInfo.get("id"));
		studentMap.put("name",studntInfo.get("name"));
		studentMap.put("gender",studntInfo.get("gender"));
		studentMap.put("birth",studntInfo.get("birth"));
		studentMap.put("email",studntInfo.get("email"));
		// 멤버, 학생 테이블 insert 동시 수행
		int memberResult = memberJoinMapper.memberJoin(memberMap);
		int studentResult = memberJoinMapper.studentJoin(studentMap);
		
		if (memberResult != 1 || studentResult != 1) {
			rattr.addFlashAttribute("joinMsg", "회원가입에 실패하였습니다.");
			return "redirect:loginForm";
		}
		rattr.addFlashAttribute("joinMsg", "회원가입에 성공하였습니다.");
		return "redirect:loginForm"; // 로그인 화면으로 redirect
	}

	@ResponseBody // ajax에 data 전달하는 용도로 String 반환
	@GetMapping("/checkId")
	public int memRegisterCheck(@RequestParam("id") String id) {

		MemberVO member = memberJoinMapper.checkId(id);
		if (member != null || id.isBlank()) {
			return 0; // 이미 존재하는 회원, 입력불가
		}
		return 1; // 사용가능한 아이디 // 회원가입 처리
	}

	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "memberJoin/findIdForm"; // 아이디 찾기 화면으로 이동
	}

//	@PostMapping("/findId2") 
//	public String findIdAction2(@RequestParam("name") String name
//							, @RequestParam("phoneNum") String phoneNum
//							, RedirectAttributes rattr) {
//	    //requestParam 유효성 검사
//		if (name == null || name.isBlank() || phoneNum == null || phoneNum.isBlank()) {
//	        rattr.addFlashAttribute("msg", "이름과 전화번호를 모두 입력하세요.");
//	        return "redirect:/findIdForm";
//	    }
//	    //requestParam 디버깅
//	    log.debug(yellow + "[findIdAction] requestParam - name : {}, phoneNum : {}" + reset, name, phoneNum);
//	    
//	    //requestParam String -> Map 변환
//	    Map<String, String> map = new HashMap<String, String>();
//	    map.put("name", name);
//	    map.put("phoneNum", phoneNum);
//	    
//	    // 입력정보와 일치하는 데이터 조회 및 검사
//	    Map<String, String> findMap = memberJoinMapper.findId(map); 
//		if (findMap == null) {
//	        rattr.addFlashAttribute("msg", "일치하는 정보가 없습니다.");
//	        return "redirect:/findIdForm"; // 아이디 존재하지 않으면 메시지와 함께 아이디찾기 화면으로 redirect
//		}
//		logMap(findMap);
//		
//	    // 찾은 아이디를 전달하기 위한 객체
//	    String id = (String) findMap.get("id");
//	    rattr.addFlashAttribute("findId", id); 
//	    return "redirect:/loginForm"; // 아이디 찾으면 로그인 url로 redirect + 아이디입력란에 찾은 아이디값 표기해놓음
//	}

	@PostMapping("/findId")
	public String findIdAction(@RequestParam Map<String, String> studentInfo, RedirectAttributes rattr) {

		// 유효성 검사 통과 못할시 아이디찾기 url로 redirect
		boolean isVaild = studentInfo
									.values()
									.stream()
									.allMatch(value -> value != null && !value.isBlank());

		if (!isVaild) {
			rattr.addFlashAttribute("msg", "이름과 전화번호를 모두 입력하세요.");
			return "redirect:/findIdForm";
		}
		// requestParam 디버깅
		studentInfo
				.entrySet()
				.stream()
				.forEach(entry -> log.debug(yellow + "[findIdAction] mapperResult - Key : {}, Value : {}" + reset
						, entry.getKey(), entry.getValue()));
		// 입력정보와 일치하는 데이터 조회 및 검사
		Map<String, Object> findMap = memberJoinMapper.findId(studentInfo);
		if (findMap == null) {
			rattr.addFlashAttribute("msg", "일치하는 정보가 없습니다.");
			return "redirect:/findIdForm"; // 아이디 존재하지 않으면 메시지와 함께 아이디찾기 화면으로 redirect
		}
		// mapperResult 디버깅
		findMap
			.entrySet()
			.stream()
			.forEach(entry -> log.debug(yellow + "[findIdAction] mapperResult - Key : {}, Value : {}" + reset
					, entry.getKey(), entry.getValue()));

		// 찾은 아이디를 전달하기 위한 객체
		String id = (String) findMap.get("id");
		rattr.addFlashAttribute("findId", id);
		return "redirect:/loginForm"; // 아이디 찾으면 로그인 url로 redirect + 아이디입력란에 찾은 아이디값 표기해놓음
	}

	@GetMapping("/findPwForm")
	public String findPwForm() {
		return "memberJoin/findPwForm"; // 비밀번호 찾기 화면
	}

	
	@PostMapping("/findPw") 
	public String findPwAction(@RequestParam Map<String, String> studentPwInfo, RedirectAttributes rattr) {
		// requestParam 유효성 검사 
		boolean isValid = studentPwInfo
									.values()
									.stream()
									.allMatch(value -> value != null && !value.isBlank());
		
		//log.debug(yellow + "[findPwAction] isValid : {}" + reset, isValid);
		if (!isValid) {
			rattr.addFlashAttribute("msg","아이디와 이름, 전화번호를 모두 입력하세요.");
			return "redirect:/findPwForm"; // 값 미입력시 비밀번호찾기 url로 redirect
		}
		// requestParam 디버깅
		studentPwInfo
				.entrySet()
				.stream()
				.forEach(entry -> log.debug(yellow + "[findPwAction] mapperResult - Key : {}, Value : {}" + reset
						, entry.getKey(), entry.getValue()));
		// 입력정보와 일치하는 데이터 조회 및 검사
		Map<String, Object> findMap = memberJoinMapper.findPw(studentPwInfo);
		if (findMap == null) { 
			rattr.addFlashAttribute("msg", "일치하는 정보가 없습니다.");  
			return "redirect:/findPwForm"; // 아이디 존재하지 않으면 메시지와 함께 비밀번호 찾기 화면으로 redirect  
		} 
		// mapperResult 디버깅
		findMap.entrySet()
				.stream()
				.forEach(entry -> log.debug(yellow + "[findPwAction] mapperResult - Key : {}, Value : {}" + reset
						, entry.getKey(), entry.getValue()));
		// 비밀번호 수정 대상 정보 객체에 담기
		
		rattr.addFlashAttribute("map",findMap);
		return "redirect:/modifyPwForm"; // 비밀번호 찾으면 비밀번호 수정 url로 redirect (forward로 WEB-INF 안의 view를 response하는게 좋을수도)
	}
	
	@GetMapping("/modifyPwForm")
	public String modifyPwForm() {
		return "/memberJoin/modifyPwForm"; // 비밀번호 찾기 화면
	}

	@PostMapping("/modifyPw")
	public String modifyPwAction(@RequestParam Map<String, String> studentPwInfo, RedirectAttributes rattr) {
		// requestParam 유효성 검사
		boolean isValid = studentPwInfo
									.values()
									.stream()
									.allMatch(value -> value != null && !value.isBlank());
		if (!isValid) {
			rattr.addFlashAttribute("msg", "잘못된 입력");
	        return "redirect:/modifyPwForm"; // 값 미입력시 비밀번호 찾기 url로 redirect
		}
		// requestParam 디버깅
		studentPwInfo
				.entrySet()
				.stream()
				.forEach(entry -> log.debug(yellow + "[modifyPwAction] mapperResult - Key : {}, Value : {}" + reset
						, entry.getKey(), entry.getValue()));

		// 비밀번호 업데이트 쿼리 실행
		int result = memberJoinMapper.modifyPw(studentPwInfo);
		
		// 업데이트 결과에 따른 redirect 분기
		if (result == 0) {
			rattr.addFlashAttribute("msg", "비밀번호 업데이트 실패"); // 실패 메세지와 함께 로그인 url로 redirect
			return "redirect:/loginForm";
		}
		rattr.addFlashAttribute("msg", "비밀번호 업데이트 성공"); // 성공 메세지와 함께 로그인 url로 redirect
		return "redirect:/loginForm";
	}	
	
	// 강사등록 페이지
	@GetMapping("/addTeacherForm")
	public String addTeacherForm() {
		return "addTeacherForm";
	}
	
	// 강사등록 액션
	@PostMapping("/addTeacher")
	public String addTeacherAction(@RequestParam Map<String, String> teacherInfo) {
		
		// 강사등록에서 넘어온 로그인 정보 저장
		Map<String, String> insertMemberInfo = new HashMap<String, String>();
		insertMemberInfo.put("id", teacherInfo.get("id"));
		insertMemberInfo.put("id", teacherInfo.get("pw"));
		insertMemberInfo.put("id", teacherInfo.get("phoneNum"));
		insertMemberInfo.put("grade", "1");
		insertMemberInfo.put("state", "재직");
		
		// 강사등록에서 넘어온 강사 개인정보 저장
		Map<String, String> insertTeacherInfo = new HashMap<String, String>();
		insertTeacherInfo.put("id", teacherInfo.get("id"));
		insertTeacherInfo.put("name", teacherInfo.get("name"));
		insertTeacherInfo.put("gender", teacherInfo.get("gender"));
		insertTeacherInfo.put("birth", teacherInfo.get("birth"));
		insertTeacherInfo.put("email", teacherInfo.get("email"));
		insertTeacherInfo.put("profileImg", teacherInfo.get("profileImg"));
		
		// HashMap에 담긴 내용을 Mapper로 전달
		int addMemberResult = memberJoinMapper.addMember(insertMemberInfo);
		int addTeacherResult = memberJoinMapper.addTeacher(insertTeacherInfo);
		
		if (addMemberResult == 1 && addTeacherResult == 1) {
			System.out.println("성공");
			return "redirect:empList";
		} else {
			System.out.println("실패");
			return "redirect:empList";
		}
	}
	
	// 강사탈퇴 액션
	@PostMapping("/deleteTeacher")
	public String deleteTeacherAction() {
		return "redirect:empList";
	}
}
