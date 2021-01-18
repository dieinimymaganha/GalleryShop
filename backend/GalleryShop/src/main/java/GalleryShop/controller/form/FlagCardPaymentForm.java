package GalleryShop.controller.form;

import GalleryShop.model.FlagCardPayment;

import javax.persistence.Entity;


public class FlagCardPaymentForm {

    private String description;

    private Boolean debit;

    private Double taxDebit;

    private Boolean credit;

    private Double taxCredit;


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getDebit() {
        return debit;
    }

    public void setDebit(Boolean debit) {
        this.debit = debit;
    }

    public Double getTaxDebit() {
        return taxDebit;
    }

    public void setTaxDebit(Double taxDebit) {
        this.taxDebit = taxDebit;
    }

    public Boolean getCredit() {
        return credit;
    }

    public void setCredit(Boolean credit) {
        this.credit = credit;
    }

    public Double getTaxCredit() {
        return taxCredit;
    }

    public void setTaxCredit(Double taxCredit) {
        this.taxCredit = taxCredit;
    }

    public FlagCardPayment converter() {
           return new FlagCardPayment(description.toUpperCase(), debit, taxDebit, credit, taxCredit);
    }
}
