package GalleryShop.model;

import GalleryShop.repository.FlagCardPaymentRepository;

import javax.persistence.*;

@Entity
public class FlagCardPayment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(unique = true)
    private String description;

    private Boolean debit;

    private Double taxDebit;

    private Boolean credit;

    private Double taxCredit;

    public FlagCardPayment(String description, Boolean debit, Double taxDebit, Boolean credit, Double taxCredit) {
        this.description = description;
        this.debit = debit;
        this.taxDebit = taxDebit;
        this.credit = credit;
        this.taxCredit = taxCredit;
    }

    public FlagCardPayment() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public FlagCardPayment upload(Long id, FlagCardPaymentRepository flagCardPaymentRepository) {
        FlagCardPayment flagCardPayment = flagCardPaymentRepository.getOne(id);

        flagCardPayment.setDescription(this.description.toUpperCase());
        flagCardPayment.setDebit(this.debit);
        flagCardPayment.setTaxDebit(this.taxDebit);
        flagCardPayment.setCredit(this.credit);
        flagCardPayment.setTaxDebit(this.taxCredit);

        return flagCardPayment;
    }


}
