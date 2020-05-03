package GalleryShop.config.validation;
import GalleryShop.config.anotation.EmailRegex;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class EmailValidator implements ConstraintValidator<EmailRegex, String>{

    private Pattern padrao = Pattern.compile("^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$");

    @Override
    public void initialize(EmailRegex constraintAnnotation) {

    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {

        Matcher matcher = padrao.matcher(value);
        return matcher.matches();
    }

}

