package GalleryShop.config.anotation;


import GalleryShop.config.validation.EmailValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Constraint(validatedBy = EmailValidator.class)
@Documented
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface EmailRegex {
    String message() default "Email inválido";
    Class[] groups() default { };
    Class<? extends Payload>[] payload() default { };
}
