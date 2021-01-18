package GalleryShop.controller;

import GalleryShop.controller.form.CloseAccountClientForm;
import GalleryShop.model.AccountClient;
import GalleryShop.model.Payment;
import GalleryShop.repository.AccountClientRepository;
import GalleryShop.repository.FlagCardPaymentRepository;
import GalleryShop.repository.PaymentRepository;
import GalleryShop.repository.TypePaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import javax.validation.Valid;

@RestController
@RequestMapping("/closeAccountClient")
public class CloseAccountClientController {

    @Autowired
    AccountClientRepository accountClientRepository;

    @Autowired
    FlagCardPaymentRepository flagCardPaymentRepository;

    @Autowired
    TypePaymentRepository typePaymentRepository;

    @Autowired
    PaymentRepository paymentRepository;

    @PostMapping
    @Transactional
    public ResponseEntity<?> closeAccount(@RequestBody @Valid CloseAccountClientForm form) {
        AccountClient accountClient = form.convertClose(accountClientRepository, flagCardPaymentRepository,
                typePaymentRepository, paymentRepository);
        return ResponseEntity.ok().build();
    }


}
