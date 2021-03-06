package GalleryShop.controller.dto;

import GalleryShop.model.Payment;


import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class PaymentClientDto {
    private Long id;
    private Date datePayment;
    private Double value;
    private TypePaymentDto typePaymentDto;

    public PaymentClientDto(final Payment payment) {
        this.id = payment.getId();
        this.datePayment = payment.getDatePayment();
        this.value = payment.getValue();
        this.typePaymentDto = new TypePaymentDto(payment.getTypePayment());
    }

    public static List<PaymentClientDto> convertDto(final List<Payment> payments) {
        return payments.stream().map(PaymentClientDto::new).collect(Collectors.toList());
    }


    public Long getId() {
        return id;
    }

    public Date getDatePayment() {
        return datePayment;
    }

    public Double getValue() {
        return value;
    }

    public TypePaymentDto getTypePaymentDto() {
        return typePaymentDto;
    }
}
