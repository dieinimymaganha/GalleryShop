package GalleryShop.controller;

import GalleryShop.controller.dto.FlagCardPaymentDto;
import GalleryShop.controller.form.FlagCardPaymentForm;
import GalleryShop.controller.form.TypePaymentForm;
import GalleryShop.model.FlagCardPayment;
import GalleryShop.model.TypePayment;
import GalleryShop.repository.FlagCardPaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/flagCardPayment")
public class FlagCardPaymentController {

    @Autowired
    FlagCardPaymentRepository flagCardPaymentRepository;

    @GetMapping
    public List<FlagCardPaymentDto> getAll(){
        List<FlagCardPayment> flagCardPayments = flagCardPaymentRepository.findAll();
        return FlagCardPaymentDto.converter(flagCardPayments);
    }

    @PostMapping
    @Transactional
    public ResponseEntity<?> createNewFlagCardPayment(@RequestBody @Valid FlagCardPaymentForm form) {

        FlagCardPayment flagCardPayment = form.converter();

        Optional<FlagCardPayment> optionalFlagCardPayment = flagCardPaymentRepository.findByDescription(flagCardPayment.getDescription());

        if (optionalFlagCardPayment.isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } else {
            flagCardPaymentRepository.save(flagCardPayment);
            return ResponseEntity.ok().build();
        }
    }
}
