package GalleryShop.controller.form;

import GalleryShop.model.TypePayment;

public class TypePaymentForm {

    private String description;
    private Boolean card;
    private String flag;
    private Double tax;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getCard() {
        return card;
    }

    public void setCard(Boolean card) {
        this.card = card;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax = tax;
    }

    public TypePayment converter() {
        return new TypePayment(description, card, flag, tax);
    }


}
