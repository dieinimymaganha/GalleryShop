package GalleryShop.controller;


import GalleryShop.controller.dto.ServiceRecordDto;
import GalleryShop.controller.form.ServiceRecordForm;
import GalleryShop.model.*;
import GalleryShop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/serviceRecord")
public class ServiceRecordController {


    @Autowired
    ServiceRecordRepository serviceRecordRepository;

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    ClientRepository clientRepository;

    @Autowired
    ServiceRepository serviceRepository;

    @Autowired
    AccountClientRepository accountClientRepository;

    @Autowired
    BilledServiceRepository billedServiceRepository;

    @Autowired
    TypePaymentRepository typePaymentRepository;

    @Autowired
    PaymentRepository paymentRepository;

    @GetMapping
    public List<ServiceRecordDto> getAll() {
        List<ServiceRecord> serviceRecords = serviceRecordRepository.findAll();

        return ServiceRecordDto.convertDto(serviceRecords);
    }

    @PostMapping
    @Transactional
    public ResponseEntity<ServiceRecordDto> createServiceRecord(@RequestBody @Valid ServiceRecordForm form,
                                                                UriComponentsBuilder uriBuilder) {
        ServiceRecord serviceRecord = form.converter(serviceRepository, employeeRepository, clientRepository,
                accountClientRepository, billedServiceRepository, typePaymentRepository, paymentRepository);
        serviceRecordRepository.save(serviceRecord);
        URI uri = uriBuilder.path("/serviceRecord/{id}").buildAndExpand(serviceRecord.getId()).toUri();
        return ResponseEntity.created(uri).body(new ServiceRecordDto(serviceRecord));

    }


    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> deleteServiceRecord(@PathVariable Long id) {
        Optional<ServiceRecord> optional = serviceRecordRepository.findById(id);

        if (optional.isPresent()) {
            ServiceRecord serviceRecord = optional.get();
            Date dateService = new Date();
            SimpleDateFormat fd = new SimpleDateFormat("yyyy-MM-dd");

            if (serviceRecord.getDateService().toString().equals(fd.format(dateService))) {
                AccountClient accountClient = accountClientRepository.getOne(serviceRecord.getAccountClient().getId());

                List<Payment> paymentList =
                        paymentRepository.findByAccountClientIDAndDatePayment(serviceRecord.getAccountClient().getId(),
                                serviceRecord.getDateService());

                if (paymentList.isEmpty()) {
                    accountClient.setAmount(accountClient.getAmount() -
                            serviceRecord.getBilledService().getValueFinal());
                    serviceRecordRepository.deleteById(id);

                } else {
                    return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
                }
            }

        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }


        return ResponseEntity.ok().build();
    }


}
