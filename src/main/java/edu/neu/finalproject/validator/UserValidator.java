package edu.neu.finalproject.validator;

import edu.neu.finalproject.model.User;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return User.class.equals(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		User user = (User) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username",
				"validate.username", "Your User Name Is Incorrenct");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password",
				"validate.password", "Your Password Is Incorrenct");
	}
}
