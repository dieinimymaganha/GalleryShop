package GalleryShop.controller;


import GalleryShop.controller.dto.AccountClientDto;
import GalleryShop.controller.dto.AccountEmployeeDto;
import GalleryShop.controller.dto.PaymentClientDto;
import GalleryShop.model.AccountClient;
import GalleryShop.model.AccountEmployee;
import GalleryShop.model.Payment;
import GalleryShop.repository.AccountEmployeeRepository;
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
@RequestMapping("/accountEmployee")
public class AccountEmployeeController {

    @Autowired
    AccountEmployeeRepository accountEmployeeRepository;

    @Autowired
    PaymentRepository paymentRepository;


    @GetMapping
    public List<AccountEmployeeDto> getAll() {
        List<AccountEmployee> accountEmployees = accountEmployeeRepository.findAll();
        return AccountEmployeeDto.convertDto(accountEmployees);
    }

    @GetMapping("/payments")
    public List<PaymentClientDto> getAllPayments() {
        List<Payment> payments = paymentRepository.findByAccountEmployeeIsNotNull();
        return PaymentClientDto.convertDto(payments);
    }


    @GetMapping("/payments/{id}")
    public List<PaymentClientDto> getPaymentsByIdEmployee(@PathVariable Long id) {

        List<Payment> payments = paymentRepository.findByAccountEmployeeId(id);

        return PaymentClientDto.convertDto(payments);
    }


    @GetMapping("/employeeId={employeeId}")
    public ResponseEntity<AccountEmployeeDto> getClientId(@PathVariable Long employeeId) {
        Optional<AccountEmployee> accountEmployee = accountEmployeeRepository.findByEmployeeId(employeeId);
        if (accountEmployee.isPresent()) {
            return ResponseEntity.ok(new AccountEmployeeDto((accountEmployee.get())));
        }
        return ResponseEntity.notFound().build();

    }


}
