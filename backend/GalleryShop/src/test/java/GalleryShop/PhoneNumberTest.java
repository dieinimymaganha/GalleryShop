package GalleryShop;

import GalleryShop.config.validation.PhoneNumberValidator;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class PhoneNumberTest {

    @Test
    public void testPhoneNumberInvalid(){
        PhoneNumberValidator phoneNumberValidator = new PhoneNumberValidator();
        final String[] invalidPhoneNumber = new String[] {"(000) 00000-0000", "(111) 1111-1111", "(222) 22222-2222",
                "(333) 33333-3333", "(444) 44444-4444","(555) 55555-5555", "(666) 66666-6666", "(777) 77777-7777",
                "(888) 88888-8888", "(999) 99999-9999", "041 99163-90", "(041) 9163-9199", "041 99163-9199",
                "(111) 1111-1111", "(123) 45678-9012", "(123) 45678-9123", "", null};

        for (String email : invalidPhoneNumber){
            Assert.assertFalse(phoneNumberValidator.isValid(email, null));
        }
    }

    @Test
    public void testPhoneNumberValid(){
        PhoneNumberValidator phoneNumberValidator = new PhoneNumberValidator();
        final String[] validPhoneNumber = new String[] {"(041) 99163-9199", "(123) 45678-9012"};

        for (String email : validPhoneNumber){
            Assert.assertTrue(phoneNumberValidator.isValid(email, null));
        }
    }
}
