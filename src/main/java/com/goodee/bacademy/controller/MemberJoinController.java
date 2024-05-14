package com.goodee.bacademy.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpHeaders;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goodee.bacademy.mapper.MemberJoinMapper;
import com.goodee.bacademy.vo.MemberVO;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class MemberJoinController {

	private final String yellow = "\u001B[33m";
	private final String reset = "\u001B[0m";

	@Autowired
	MemberJoinMapper memberJoinMapper; // 사용할 mapper bean 의존성 주입받기
	
	// 차성호 : 회원가입 화면으로 이동
	@GetMapping("/memberJoinForm")
	public String memberJoinForm() {
		return "memberJoin/joinForm";
	}
	
	// 차성호 : 회원가입
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
			rattr.addFlashAttribute("msgType", "회원가입 실패 메시지");
			rattr.addFlashAttribute("msg", "회원가입에 실패하였습니다.");
			return "redirect:loginForm";
		}
		rattr.addFlashAttribute("msgType", "회원가입 성공 메시지");
		rattr.addFlashAttribute("msg", "회원가입에 성공하였습니다.");
		return "redirect:loginForm"; // 로그인 화면으로 redirect
	}

	// 차성호 : ajax에 data 전달하는 용도로 String 반환
	@ResponseBody
	@GetMapping("/checkId")
	public int memRegisterCheck(@RequestParam("id") String id) {

		MemberVO member = memberJoinMapper.checkId(id);
		if (member != null || id.isBlank()) {
			return 0; // 이미 존재하는 회원, 입력불가
		}
		return 1; // 사용가능한 아이디 // 회원가입 처리
	}

	// 차성호 : 아이디 찾기 화면으로 이동
	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "memberJoin/findIdForm";
	}

	// 차성호 : 아이디 찾기
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

	// 차성호 : 비밀번호 찾기 화면
	@GetMapping("/findPwForm")
	public String findPwForm() {
		return "memberJoin/findPwForm";
	}

	// 차성호 : 비밀번호 찾기
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
	
	// 차성호 : 비밀번호 찾기 화면
	@GetMapping("/modifyPwForm")
	public String modifyPwForm() {
		return "/memberJoin/modifyPwForm";
	}

	// 차성호 : 비밀번호 수정
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
	
	// 정건희 : 강사등록 페이지
	@GetMapping("/addTeacherForm")
	public String addTeacherForm() {
		return "addTeacherForm";
	}
	
	@Value("${spring.cloud.gcp.storage.credentials.location}")
	private String keyFileName;
	
	@Value("${spring.cloud.gcp.storage.bucket}")
	private String bucketName;
	
	// 정건희 : 강사등록 액션
	// 구글 클라우드 프로필 이미지 업로드
	@PostMapping("/addTeacher")
	public String addTeacherAction(@RequestParam("profileImg") MultipartFile file, @RequestParam Map<String, String> teacherInfo) throws IOException {
		
		String birth = teacherInfo.get("birth-year") + "-" + teacherInfo.get("birth-month") + "-" + teacherInfo.get("birth-day");
		String ext = file.getContentType();
		String txt = (UUID.randomUUID().toString()).replace("-", "");
		String saveName = txt + ext; // (txt: 원본이름).(ext: 확장자)
		
		// 구글 클라우드 이미지 업로드 코드		
		InputStream keyFile = ResourceUtils.getURL(keyFileName).openStream();
		Storage storage = StorageOptions.newBuilder()
				.setCredentials(GoogleCredentials.fromStream(keyFile))
				.build()
				.getService();
		
		BlobInfo blobInfo = BlobInfo.newBuilder(bucketName, txt).setContentType(ext).build();
		Blob blog = storage.create(blobInfo, file.getInputStream());
		
		System.out.println("teacherInfo : " + teacherInfo);
		System.out.println("birth : " + birth);
		System.out.println("profileImg : " + saveName);
		
		// 강사등록에서 넘어온 로그인 정보 저장
		Map<String, String> insertMemberInfo = new HashMap<String, String>();
		insertMemberInfo.put("id", teacherInfo.get("id"));
		insertMemberInfo.put("pw", teacherInfo.get("pw"));
		insertMemberInfo.put("phoneNum", teacherInfo.get("phoneNum"));
		insertMemberInfo.put("grade", "1");
		insertMemberInfo.put("state", "재직");
		
		// 강사등록에서 넘어온 강사 개인정보 저장
		Map<String, String> insertTeacherInfo = new HashMap<String, String>();
		insertTeacherInfo.put("id", teacherInfo.get("id"));
		insertTeacherInfo.put("name", teacherInfo.get("name"));
		insertTeacherInfo.put("gender", teacherInfo.get("gender"));
		insertTeacherInfo.put("birth", birth);
		insertTeacherInfo.put("email", teacherInfo.get("email"));
		insertTeacherInfo.put("profileImg", txt);
		
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
	
	// 정건희 : 강사탈퇴 액션
	@Transactional
	@PostMapping("/deleteTeacher")
	public String deleteTeacherAction(@RequestParam("id") String id) {
		
		int updateMemberResult = memberJoinMapper.updateMember(id);
		int deleteTeacherResult = memberJoinMapper.deleteTeacher(id);
		
		if (updateMemberResult == 1 && deleteTeacherResult == 1) {
			System.out.println("성공");
			return "redirect:empList";
		} else {
			System.out.println("실패");
			return "redirect:empList";
		}
	}
}
