function validatePassword(password) {
      var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d|.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
      return passwordRegex.test(password);
    }
    
function onSubmit() {
      var passwordInput = document.getElementById("passwordInput");
      var password = passwordInput.value;
      
       if (!validatePassword(password)) {
        alert("8~16자 영문 대 소문자, 숫자, 특수문자를 사용해주세요.");
        return false;
      } 
     	return true;
    }
      