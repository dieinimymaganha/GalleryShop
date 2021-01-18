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

    private Boolean card;

    private Long idFlagCardPayment;

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

    public AccountClient convertClose(AccountClientRepository accountClientRepository,
                                      FlagCardPaymentRepository flagCardPaymentRepository,
                                      TypePaymentRepository typePaymentRepository,
                                      PaymentRepository paymentRepository) {
        AccountClient accountClientUpdate = new AccountClient();

        Optional<AccountClient> accountClientOptional = accountClientRepository.findById(idAccountClient);
        String descriptionTypePayment = "DINHEIRO";
        TypePayment typePayment = new TypePayment();
        Double tax = 0.0;

        if (accountClientOptional.isPresent()) {
            FlagCardPayment flagCardPayment = flagCardPaymentRepository.getOne(idFlagCardPayment);
            String flag = null;
            if (flagCardPayment != null) {
                accountClientUpdate = accountClientOptional.get();

                double totalPayable = 0;

                if (accountClientUpdate.getBalance() <= 0) {
                    totalPayable = (accountClientUpdate.getAmount() - accountClientUpdate.getAmountPaid());
                    System.out.println(">>> 1 ");
                } else {
                    totalPayable = (accountClientUpdate.getAmount() - accountClientUpdate.getAmountPaid()) - accountClientUpdate.getBalance();
                    System.out.println(">>> 3 ");
                }

                double amountPaid = accountClientUpdate.getAmountPaid() + value;

                double balance = value - abs(totalPayable);

                System.out.println("totalPayable: " + totalPayable);
                System.out.println("Valor pago: " + amountPaid);
                System.out.println("Saldo: " + balance);
                System.out.println("Valor total: " + accountClientUpdate.getAmount());


                accountClientUpdate.setAmountPaid(amountPaid);
                accountClientUpdate.setBalance(balance);

                if (card) {
                    flag = flagCardPayment.getDescription();
                    if (flagCardPayment.getCredit()) {
                        descriptionTypePayment = "CRÉDITO";
                        tax = flagCardPayment.getTaxCredit();
                    } else if (flagCardPayment.getDebit()) {
                        descriptionTypePayment = "DÉBITO";
                        tax = flagCardPayment.getTaxDebit();
                    }
                }
            }
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
