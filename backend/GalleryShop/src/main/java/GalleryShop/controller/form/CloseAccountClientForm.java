package GalleryShop.controller.form;

import GalleryShop.model.AccountClient;
import GalleryShop.model.FlagCardPayment;
import GalleryShop.model.Payment;
import GalleryShop.model.TypePayment;
import GalleryShop.repository.AccountClientRepository;
import GalleryShop.repository.FlagCardPaymentRepository;
import GalleryShop.repository.PaymentRepository;
import GalleryShop.repository.TypePaymentRepository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static java.lang.Math.abs;

public class CloseAccountClientForm {

    private Long idAccountClient;

    private Double value;

    private Boolean useBalance;

    private Boolean card;

    private Long idFlagCardPayment;

    private Boolean creditCard;

    private Boolean debitCard;

    public Boolean getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(Boolean creditCard) {
        this.creditCard = creditCard;
    }

    public Boolean getDebitCard() {
        return debitCard;
    }

    public void setDebitCard(Boolean debitCard) {
        this.debitCard = debitCard;
    }

    public Long getIdAccountClient() {
        return idAccountClient;
    }

    public void setIdAccountClient(Long idAccountClient) {
        this.idAccountClient = idAccountClient;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public Boolean getCard() {
        return card;
    }

    public void setCard(Boolean card) {
        this.card = card;
    }

    public Long getIdFlagCardPayment() {
        return idFlagCardPayment;
    }

    public void setIdFlagCardPayment(Long idFlagCardPayment) {
        this.idFlagCardPayment = idFlagCardPayment;
    }

    public Boolean getUseBalance() {
        return useBalance;
    }

    public void setUseBalance(Boolean useBalance) {
        this.useBalance = useBalance;
    }

    public AccountClient convertClose(AccountClientRepository accountClientRepository,
                                      FlagCardPaymentRepository flagCardPaymentRepository,
                                      TypePaymentRepository typePaymentRepository,
                                      PaymentRepository paymentRepository) {
        AccountClient accountClientUpdate = new AccountClient();

        Optional<AccountClient> accountClientOptional = accountClientRepository.findById(idAccountClient);
        String descriptionTypePayment = "DINHEIRO";
        TypePayment typePayment = new TypePayment();

        double tax = 0.0;
        double totalPayable = 0;
        double amountPaid = 0.0;
        double balance = 0.0;

        accountClientUpdate = accountClientOptional.get();

        if (accountClientOptional.isPresent()) {

            String flag = null;

            // Verifica se pagamento é com cartão de crédito
            if (card) {
                // Verifica a bandeira do cartão e se é crédito ou débito
                FlagCardPayment flagCardPayment = flagCardPaymentRepository.getOne(idFlagCardPayment);
                flag = flagCardPayment.getDescription();

                if (flagCardPayment.getCredit() && creditCard) {
                    descriptionTypePayment = "CRÉDITO";
                    if (useBalance && accountClientUpdate.getBalance() > 0) {
                        descriptionTypePayment = "CRÉDITO + SALDO";
                    }
                    tax = flagCardPayment.getTaxCredit();

                } else if (flagCardPayment.getDebit() && debitCard) {
                    descriptionTypePayment = "DÉBITO";
                    if (useBalance && accountClientUpdate.getBalance() > 0) {
                        descriptionTypePayment = "DÉBITO + SALDO";
                    }
                    tax = flagCardPayment.getTaxDebit();
                }
            }

            totalPayable = (accountClientUpdate.getAmount() - accountClientUpdate.getAmountPaid());

            balance = value - totalPayable;
//
//            if (value > totalPayable) {
//                balance = value - totalPayable;
//            } else if (value < totalPayable && accountClientUpdate.getBalance() > 0) {
//                balance = (value - totalPayable) + accountClientUpdate.getBalance();
//            } else if (value < totalPayable && accountClientUpdate.getBalance() <= 0) {
//                balance = (value - totalPayable) - accountClientUpdate.getBalance();
//            } else {
//                balance = 0.0;
//            }

            amountPaid = accountClientUpdate.getAmountPaid() + value;


            if (useBalance && !card && accountClientUpdate.getBalance() > 0) {
                descriptionTypePayment = "DINHEIRO + SALDO";
            }

            if (useBalance.equals(true) && value == null) {
                descriptionTypePayment = "SALDO";

            }

            accountClientUpdate.setAmountPaid(amountPaid);
            accountClientUpdate.setBalance(balance);

            typePayment.setDescription(descriptionTypePayment);
            typePayment.setFlag(flag);
            typePayment.setTax(tax);
            typePayment.setCard(card);
            typePaymentRepository.save(typePayment);

            Date datePayment = new Date();

            Payment payment = new Payment(datePayment, typePayment, accountClientUpdate, value);
            paymentRepository.save(payment);

        }

        return accountClientUpdate;

    }


}
