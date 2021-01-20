package GalleryShop.controller;

import GalleryShop.controller.dto.FlagCardPaymentDto;
import GalleryShop.controller.form.FlagCardPaymentForm;
import GalleryShop.model.FlagCardPayment;
import GalleryShop.repository.FlagCardPaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/flagCardPayment")
public class FlagCardPaymentController {

    @Autowired
    FlagCardPaymentRepository flagCardPaymentRepository;

    @GetMapping
    public List<FlagCardPaymentDto> getAll() {
        List<FlagCardPayment> flagCardPayments = flagCardPaymentRepository.findAll(Sort.by("description").ascending().ascending());
        return FlagCardPaymentDto.converter(flagCardPayments);
    }

    @PostMapping
    @Transactional
    public ResponseEntity<?> createNewFlagCardPayment(@RequestBody @Valid FlagCardPaymentForm form, UriComponentsBuilder uriBuilder) {

        FlagCardPayment flagCardPayment = form.converter();

        Optional<FlagCardPayment> optionalFlagCardPayment = flagCardPaymentRepository.findByDescription(flagCardPayment.getDescription());

        if (optionalFlagCardPayment.isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        } else {
            flagCardPaymentRepository.save(flagCardPayment);
            URI uri = uriBuilder.path("flagCardPayment/{id}").buildAndExpand(flagCardPayment.getId()).toUri();
            return ResponseEntity.created(uri).body(new FlagCardPaymentDto(flagCardPayment));
        }
    }

    @PutMapping("/{id}")
    @Transactional
    public ResponseEntity<FlagCardPaymentDto> updateFlagCardPayment(@PathVariable Long id, @RequestBody @Valid FlagCardPayment form) {
        Optional<FlagCardPayment> optionalFlagCardPayment = flagCardPaymentRepository.findById(id);
        if (optionalFlagCardPayment.isPresent()) {
            FlagCardPayment flagCardPayment = form.upload(id, flagCardPaymentRepository);
            return ResponseEntity.ok(new FlagCardPaymentDto(flagCardPayment));
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> deleteFlagCardPayment(@PathVariable Long id) {
        Optional<FlagCardPayment> optionalFlagCardPayment = flagCardPaymentRepository.findById(id);
        if (optionalFlagCardPayment.isPresent()) {
            flagCardPaymentRepository.deleteById(id);
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.notFound().build();

    }


}
