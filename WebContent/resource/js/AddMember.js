function validatePassword(password) {
      var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d|.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
      return passwordRegex.test(password);
    }
    function onSubmit() {
      var passwordInput = document.getElementById("passwordInput");
      var password = passwordInput.value;
      
      if (!validatePassword(password)) {
        alert("비밀번호는 영문 대소문자, 숫자, 특수문자 중 2가지 이상을 조합하여 8자 이상으로 만들어주세요.");
        return false;
      } 
      
      var email = document.getElementsByName("userEmail")[0].value;
 	  var select = document.getElementsByTagName("select")[0];
 	  var domain = select.options[select.selectedIndex].value;
	  var pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
      
      
      if (domain == "") {
	    domain = document.getElementsByName("emailDomain")[0].value;
	  }
	  
	  if (!pattern.test(email + domain)) {
	    alert("유효한 이메일 주소를 입력하세요.");
	    return false;
	  }
	  
	  return true;
      
      
    }

