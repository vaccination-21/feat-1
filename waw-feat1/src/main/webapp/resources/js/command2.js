$(document).ready(function(){
			$('#register').click(function(){ //회원 가입 처리
				alert("클릭회원가입")
				var _email = $('#email').val();
				var _id = $('#id').val();
				var _name = $('#name').val();
				var _pwd = $('#pwd').val();
				var _pwd2= $('#pwd2').val();		
				var _phoneNumber = $('#phoneNumber').val();
				
				var userInfo = {
				 email : _email,
				 id : _id,
				 name : _name,
				 pwd  : _pwd,
				 phoneNumber : _phoneNumber
				 };
				 
				if (_email == '') {
				alert("이메일을 입력해주세요.");
				return;
				}
				if (_id == '') {
				alert("아이디를 입력해주세요.");
				return;
				}
				if (_name == '') {
				alert("이름을 입력해주세요.");
				return;
				}
				
				if (_pwd == '') {
				alert("비밀번호를 입력해주세요.");
				return;
				}
				
				if (_pwd != _pwd2) {
				alert("비밀번호 확인과 일치하지 않습니다.");
				return;
				}
				
				if (_phoneNumber == '') {
				alert("전화번호를 입력해주세요.");
				return;
				}
				
				$.ajax({
					type:"post",
					url:"/waw/user",
					headers: {
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST"
					},
					dataType: "text",
					data:Json.stringify(userInfo),
					success:function(result){
					consol.log("result:" +result);
					if(result == "register") {
						alert("성공")	
						self.close()
					}
					}
					
				});
				
			});
        })

			
			
			

			