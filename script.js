// Problem: Hints are shown even when form is valid
// Solution: Hide and show them at appropriate times

var $password = $("#password");
var $confirmPassword = $("#confirm_password");
var $secretCode = $("#secret_code");

// Hide hints
$("form span").hide();

function isPasswordValid() {
  return $password.val().length >= 8;
}

function arePasswordsMatching() {
  return $password.val() === $confirmPassword.val();
}

const isSecretCodeValid = () => {
  return $secretCode.val().length >= 4;
}

function passwordEvent(){
    // Find out if password is valid  
    if(isPasswordValid()) {
      // Hide hint if valid
      $password.next().hide();
    } else {
      // else show hint
      $password.next().show();
    }
}

function confirmPasswordEvent() {
  // Find out if password and confirmation match
  if(arePasswordsMatching()) {
    // Hide hint if match
    $confirmPassword.next().hide();
  } else {
    // else show hint 
    $confirmPassword.next().show();
  }
}

function secretCodeEvent(){
  // Find out if secret code is valid  
  if(isSecretCodeValid()) {
    // Hide hint if valid
    $secretCode.next().hide();
  } else {
    // else show hint
    $secretCode.next().show();
  }
}

//When event happens on password input
$password.focus(passwordEvent).keyup(passwordEvent);

//When event happens on confirmation input
$confirmPassword.focus(confirmPasswordEvent).keyup(confirmPasswordEvent);

$secretCode.focus(secretCodeEvent).keyup(secretCodeEvent);

// function canSubmit() {
//   return isPasswordValid() && arePasswordsMatching() && isSecretCodeValid();
// }

// function enableSubmitEvent() {
//   $("#submit").prop("disabled", !canSubmit());
// }

// enableSubmitEvent();