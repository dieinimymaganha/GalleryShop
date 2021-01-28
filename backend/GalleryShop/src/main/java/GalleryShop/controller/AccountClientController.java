package GalleryShop.controller;

import GalleryShop.controller.dto.AccountClientDto;
import GalleryShop.controller.dto.PaymentClientDto;
import GalleryShop.model.AccountClient;
import GalleryShop.model.Payment;
import GalleryShop.repository.AccountClientRepository;
import GalleryShop.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/accountClient")
public class AccountClientController {

    @Autowired
    AccountClientRepository accountClientRepository;

    @Autowired
    PaymentRepository paymentRepository;

    @GetMapping
    public List<AccountClientDto> getAll() {
        List<AccountClient> accountClients = accountClientRepository.findAll();
        return AccountClientDto.convertDto(accountClients);
    }

    @GetMapping("/payments")
    public List<PaymentClientDto> getAllPayments() {
        List<Payment> payments = paymentRepository.findByAccountClientIsNotNull();
        return PaymentClientDto.convertDto(payments);
    }

    @GetMapping("/payments/{id}")
    public List<PaymentClientDto> getPaymentsByIdClient(@PathVariable Long id) {

        List<Payment> payments = paymentRepository.findByAccountClientId(id);

        return PaymentClientDto.convertDto(payments);
    }


    @GetMapping("/clientId={clientId}")
    public ResponseEntity<AccountClientDto> getClientId(@PathVariable Long clientId) {
        Optional<AccountClient> accountClient = accountClientRepository.findByClientId(clientId);
        if (accountClient.isPresent()) {
            return ResponseEntity.ok(new AccountClientDto((accountClient.get())));
        }
        return ResponseEntity.notFound().build();

    }

}
