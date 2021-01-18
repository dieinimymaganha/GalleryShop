package GalleryShop.controller.dto;

import GalleryShop.model.Employee;
import GalleryShop.model.TypePayment;

import java.util.List;
import java.util.stream.Collectors;

public class TypePaymentDto {
    private Long id;

    private String description;

    private Boolean card;

    private String flag;

    private Double tax;

    public TypePaymentDto(final TypePayment typePayment) {
        this.id = typePayment.getId();
        this.description = typePayment.getDescription();
        this.card = typePayment.getCard();
        this.tax = typePayment.getTax();
        this.flag = typePayment.getFlag();
    }


    public Long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public Boolean getCard() {
        return card;
    }

    public String getFlag() {
        return flag;
    }

    public Double getTax() {
        return tax;
    }

    public static List<TypePaymentDto> convert(List<TypePayment> typePayments) {
        return typePayments.stream().map(TypePaymentDto::new).collect(Collectors.toList());
    }

    public static TypePaymentDto convertDto(TypePayment typePayment) {

        return new TypePaymentDto(typePayment);
    }
}
