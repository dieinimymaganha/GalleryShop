package GalleryShop;

import GalleryShop.config.validation.EmailValidator;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class EmailValidatorTest {

    @Test
    public void testEmailInvalid(){

        EmailValidator emailValidator = new EmailValidator();

        final String[] invalidEmails = new String[] { "gallerydev", "gallerydev@.com.my",
                "gallerydev123@gmail.a", "gallerydev123@.com", "gallerydev123@.com.com", ".gallerydev@gallerydev.com",
                "gallerydev()*@gmail.com", "gallerydev@%*.com", "gallerydev..2002@gmail.com", "gallerydev.@gmail.com",
                "gallerydev@gallerydev@gmail.com", "gallerydev@gmail.com.1a"};

        for(String temp : invalidEmails){
            Assert.assertFalse(emailValidator.isValid(temp, null));
        }

    }

    @Test
    public void testEmailValid(){
        EmailValidator emailValidator = new EmailValidator();

        final String[] validEmails = new String[] { "gallerydev@yahoo.com", "gallerydev-100@yahoo.com",
                "gallerydev.100@yahoo.com", "gallerydev111@gallerydev.com", "gallerydev-100@gallerydev.net",
                "gallerydev.100@gallerydev.com.au", "gallerydev@1.com", "gallerydev@gmail.com.com",
                "gallerydev+100@gmail.com", "gallerydev-100@yahoo-test.com"};

        for (String email : validEmails){
            System.out.println(email);
            Assert.assertTrue(emailValidator.isValid(email,null));
        }
    }

}