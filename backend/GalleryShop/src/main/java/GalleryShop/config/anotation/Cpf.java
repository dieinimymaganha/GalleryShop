package GalleryShop.config.anotation;


import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

import GalleryShop.config.validation.CpfValidator;


@Constraint(validatedBy = CpfValidator.class)
@Documented
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Cpf {
    String message() default "CPF inválido";
    Class[] groups() default { };
    Class<? extends Payload>[] payload() default { };
}