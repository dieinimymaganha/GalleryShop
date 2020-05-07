package GalleryShop.config.anotation;
import GalleryShop.config.validation.PhoneNumberValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Constraint(validatedBy = PhoneNumberValidator.class)
@Documented
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface PhoneNumber {
    String message() default "Telefone inválido";
    Class[] groups() default { };
    Class<? extends Payload>[] payload() default { };

}
