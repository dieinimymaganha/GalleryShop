package GalleryShop.controller;

import GalleryShop.controller.form.CloseAccountClientForm;
import GalleryShop.model.AccountClient;
import GalleryShop.model.AccountEmployee;
import GalleryShop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import javax.validation.Valid;

@RestController
@RequestMapping("/closeAccount")
public class CloseAccountController {

    @Autowired
    AccountClientRepository accountClientRepository;

    @Autowired
    FlagCardPaymentRepository flagCardPaymentRepository;

    @Autowired
    TypePaymentRepository typePaymentRepository;

    @Autowired
    PaymentRepository paymentRepository;

    @Autowired
    AccountEmployeeRepository accountEmployeeRepository;

    @PostMapping
    @Transactional
    public ResponseEntity<?> closeAccount(@RequestBody @Valid CloseAccountClientForm form) {

        if (form.getIdAccountClient() != null && form.getIdAccountEmployee() == null) {
            AccountClient accountClient = form.convertCloseAccountClient(accountClientRepository, flagCardPaymentRepository,
                    typePaymentRepository, paymentRepository);

            if (accountClient != null) {
                return ResponseEntity.ok().build();
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }
        } else if (form.getIdAccountClient() == null && form.getIdAccountEmployee() != null) {
            AccountEmployee accountEmployee = form.convertCloseAccountEmployee(flagCardPaymentRepository,
                    typePaymentRepository, paymentRepository, accountEmployeeRepository);

            if (accountEmployee != null) {
                return ResponseEntity.ok().build();
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();

        }


    }


}
