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

        Assert.assertFalse(emailValidator.isValid("gallerydev", null));
        Assert.assertFalse(emailValidator.isValid("gallerydev@.com.my", null));
        Assert.assertFalse(emailValidator.isValid("gallerydev123@gmail.a", null));
        Assert.assertFalse(emailValidator.isValid("gallerydev123@.com", null));
        Assert.assertFalse(emailValidator.isValid("gallerydev123@.com.com", null));
        Assert.assertFalse(emailValidator.isValid(".gallerydev@gallerydev.com", null));
        Assert.assertFalse(emailValidator.isValid("gallerydev()*@gmail.com", null));
        Assert.assertFalse(emailValidator.isValid("gallerydev@%*.com", null));
        Assert.assertFalse(emailValidator.isValid("gallerydev..2002@gmail.com", null));
        Assert.assertFalse(emailValidator.isValid("gallerydev.@gmail.com", null));
        Assert.assertFalse(emailValidator.isValid("gallerydev@gallerydev@gmail.com", null));
        Assert.assertFalse(emailValidator.isValid("gallerydev@gmail.com.1a" , null));
        Assert.assertFalse(emailValidator.isValid("dieinimy@gmail.com" , null));
    }

    @Test
    public void testEmailValid(){
        EmailValidator emailValidator = new EmailValidator();
        Assert.assertTrue(emailValidator.isValid("gallerydev@yahoo.com", null));
        Assert.assertTrue(emailValidator.isValid("gallerydev-100@yahoo.com", null));
        Assert.assertTrue(emailValidator.isValid("gallerydev.100@yahoo.com", null));

    }

}