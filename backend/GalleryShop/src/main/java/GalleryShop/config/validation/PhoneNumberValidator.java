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
    public boolean isValid(String number, ConstraintValidatorContext context) {

        if(number == null){
            return false;
        }

        if (number.equals("(123) 45678-9012") ||
                number.equals("(123) 45678-9123") ||number.equals("(000) 00000-0000") ||
                number.equals("(111) 11111-1111") || number.equals("(222) 22222-2222")||
                number.equals("(333) 33333-3333") || number.equals("(444) 44444-4444")||
                number.equals("(555) 55555-5555") || number.equals("(666) 66666-6666")||
                number.equals("(777) 77777-7777") || number.equals("(888) 88888-8888")||
                number.equals("(999) 99999-9999"))
            return(false);


        Matcher matcher = padrao.matcher(number);
        return matcher.matches();
    }
}
