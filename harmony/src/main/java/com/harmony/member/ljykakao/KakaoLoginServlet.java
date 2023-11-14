package com.harmony.member.ljykakao;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class KakaoLoginServlet
 */
@WebServlet("/ljymember/kakaoLogin.do")
public class KakaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		System.out.println(code);
		try {
	        // URL에 포함된 code를 이용하여 액세스 토큰 발급
			HashMap<String,Object> tokens =KakaoService.getKakaoService().getKakaoAccessToken(code); 
	        String accessToken = String.valueOf(tokens.get("accessToken"));
	        System.out.println(accessToken);
	        
	        // 액세스 토큰을 이용하여 카카오 서버에서 유저 정보(카카오ID, 닉네임, 이메일) 받아오기
	        HashMap<String, Object> userInfo = KakaoService.getKakaoService().getUserInfo(accessToken);
	        System.out.println("login Controller : " + userInfo);
	        
	        // 카카오 아이디 정보
	        // String kakaoNum = String.valueOf(userInfo.get("id"));
	        
	        // 같은 카카오ID를 가진 회원이 있는지 확인
	        // Member member = MemberService.getService().selectMemberByKakaoId(kakaoNum);
	        
	        // 로그인 후 리다이렉트 될 경로 지정
	        // String path = request.getContextPath()+"/main.do";
	        
	        // 만약 카카오 아이디 정보와 일치하는 회원이 없으면
	        //if(member == null){
	        // MemberDTO에 권한(학생), 카카오ID를 넣어 세팅하고
	        // Member member = Member.builder().setMemAuthority("STUDENT").setMemKakaoNum(kakaoNum).build();
	        // MemberInfoDTO에 email을 넣어서 세팅하고
	        // MemberInfo memInfo = MemberInfo.builder().setMemInfoEmail(String.valueOf(userInfo.get("email")))
	        //											.builder();
	        // member 객체와 memberInfo객체를 전달해서 DB에 입력후, 저장된 member 정보를 가져옴
	        // member = MemberService.getService().insertMember(member, memberInfo);
	        // 가입축하메세지 + 다른 정보 추가 창으로 이동하는 경로 지정
	        // path = request.getContextPath()+"???";
	        //}
	        // member객체를 loginMember라는 이름으로 세션에 저장
	        // request.getSession().setAttribute("loginMember", member);
	        // 지정된 경로로 리다이렉트 하기
	        // response.sendRedirect(path);
	        
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
