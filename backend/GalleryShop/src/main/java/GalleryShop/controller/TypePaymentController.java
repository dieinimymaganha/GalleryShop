package GalleryShop.controller;


import GalleryShop.controller.form.TypePaymentForm;
import GalleryShop.model.TypePayment;
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
@RequestMapping("/typePayment")
public class TypePaymentController {

    @Autowired
    TypePaymentRepository typePaymentRepository;

    @PostMapping
    @Transactional
    public ResponseEntity<?> createNewTypePayment(@RequestBody @Valid TypePaymentForm form) {
        TypePayment typePayment = form.converter();
        typePaymentRepository.save(typePayment);
        return ResponseEntity.ok().build();
    }

}
