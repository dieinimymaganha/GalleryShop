package GalleryShop;


import GalleryShop.config.validation.CpfValidator;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.mockito.internal.matchers.Null;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
public class CpfValidatorTest {

    @Test
    public void testCpfInvalid() {
        CpfValidator cpfValidator = new CpfValidator();
        final String[] invalidCpfs = new String[]{"3.65.24-8", "123.456.789-1", "11111111111",
                "22222222222", "33333333333", "44444444444", "55555555555", "66666666666",
                "77777777777","88888888888", "99999999999", "12345678912", "9876543219", null, "",
        "  ", "abcdefghij"};

        for (String cpf : invalidCpfs) {
            Assert.assertFalse(cpfValidator.isValid(cpf, null));
        }
    }

    @Test
    public void testCpfValid() {
        CpfValidator cpfValidator = new CpfValidator();
        final String[] validCpfs = new String[]{"378.630.978-78", "075.129.089-03", "80623469006", "349.635.010-58",
        "637.553.210-84"};

        for (String cpf : validCpfs) {
            Assert.assertTrue(cpfValidator.isValid(cpf, null));
        }
    }


}
