package GalleryShop.config.validation;

import GalleryShop.config.anotation.PhoneNumber;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PhoneNumberValidator  implements ConstraintValidator<PhoneNumber, String> {

    private Pattern padrao = Pattern.compile("(\\(\\d{2,3}\\)?\\s)?(\\d{5}\\-\\d{4})");

    @Override
    public void initialize(PhoneNumber constraintAnnotation) {

    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {

        if(email == null){
            return false;
        }

        if (email.equals("(123) 45678-9012") ||
                email.equals("(123) 45678-9123") ||email.equals("(000) 00000-0000") ||
                email.equals("(111) 11111-1111") || email.equals("(222) 22222-2222")||
                email.equals("(333) 33333-3333") || email.equals("(444) 44444-4444")||
                email.equals("(555) 55555-5555") || email.equals("(666) 66666-6666")||
                email.equals("(777) 77777-7777") || email.equals("(888) 88888-8888")||
                email.equals("(999) 99999-9999"))
            return(false);


        Matcher matcher = padrao.matcher(email);
        return matcher.matches();
    }
}
