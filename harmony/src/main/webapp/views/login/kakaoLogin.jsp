<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.main {
    width: 250px;
    height: 300px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border: 1px solid lightgrey;
    border-radius: 5px;
}

.logo {
    margin-top: 0px;
    margin-bottom: 40px;
}

#login {
    width: 100%;
    background-color: skyblue;
    border-color: transparent;
    color: white;
}

.account {
    display: block;
    margin-bottom: 3px;
    padding: 3px;
    border: 1px solid lightgray;
    border-radius: 3px;
}

#alert {
    border-color: transparent;
}
</style>
</head>

<body>

	<button onclick="kakaoLogin();">
          <span>카카오 로그인</span>
      </button>
	<button onclick="kakaoLogout();">
          <span>카카오 로그아웃</span>
     </button>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

//카카오로그인
/* function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
      Kakao.API.request({
      url: '/v2/user/me',
      success: function (response) {
    	  console.log(response.kakao_account['email']);
    	  console.log(response.properties['nickname']);
    	  
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  } */

function kakaoLogin() {
	location.href = 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=7a71de50fa7db8d6bb2395a8a5fba504&redirect_uri=http://localhost:8080/harmony/member/kakaoLogin.do';
}
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
      url: '/v1/user/unlink',
      success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

</body>
</html>