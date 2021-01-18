package GalleryShop.controller.dto;

import GalleryShop.model.FlagCardPayment;

import java.util.List;
import java.util.stream.Collectors;

public class FlagCardPaymentDto {

    private Long id;

    private String description;

    private Boolean debit;

    private Double taxDebit;

    private Boolean credit;

    private Double taxCredit;

    public FlagCardPaymentDto(final FlagCardPayment flagCardPayment) {
        this.id = flagCardPayment.getId();
        this.description = flagCardPayment.getDescription();
        this.debit = flagCardPayment.getDebit();
        this.taxDebit = flagCardPayment.getTaxDebit();
        this.credit = flagCardPayment.getCredit();
        this.taxCredit = flagCardPayment.getTaxCredit();
    }

    public Long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public Boolean getDebit() {
        return debit;
    }

    public Double getTaxDebit() {
        return taxDebit;
    }

    public Boolean getCredit() {
        return credit;
    }

    public Double getTaxCredit() {
        return taxCredit;
    }

    public static List<FlagCardPaymentDto> converter(final List<FlagCardPayment> flagCardPayment) {
        return flagCardPayment.stream().map(FlagCardPaymentDto::new).collect(Collectors.toList());
    }


    public static  FlagCardPaymentDto converterDto(FlagCardPayment flagCardPayment){
        return new FlagCardPaymentDto(flagCardPayment);
    }

}
