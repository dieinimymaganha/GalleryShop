package GalleryShop.controller;


import GalleryShop.controller.dto.ServiceRecordDto;
import GalleryShop.controller.form.ServiceRecordForm;
import GalleryShop.model.ServiceRecord;
import GalleryShop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.net.URI;
import java.util.List;

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

    @GetMapping
    public List<ServiceRecordDto> getAll() {
        List<ServiceRecord> serviceRecords = serviceRecordRepository.findAll();

        return ServiceRecordDto.convertDto(serviceRecords);
    }

    @PostMapping
    @Transactional
    public ResponseEntity<ServiceRecordDto> createServiceRecord(@RequestBody @Valid ServiceRecordForm form, UriComponentsBuilder uriBuilder) {
        ServiceRecord serviceRecord = form.converter(serviceRepository, employeeRepository, clientRepository, accountClientRepository, billedServiceRepository);
        serviceRecordRepository.save(serviceRecord);
        URI uri = uriBuilder.path("/serviceRecord/{id}").buildAndExpand(serviceRecord.getId()).toUri();
        return ResponseEntity.created(uri).body(new ServiceRecordDto(serviceRecord));

    }

}
