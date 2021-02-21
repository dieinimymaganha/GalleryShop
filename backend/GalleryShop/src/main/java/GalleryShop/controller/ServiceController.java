package GalleryShop.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.dto.ServiceDto;
import GalleryShop.controller.form.ServiceForm;
import GalleryShop.model.Service;
import GalleryShop.repository.ServiceRepository;
import GalleryShop.repository.TypeEmployeeRepository;

@RestController
@RequestMapping("/services")
public class ServiceController {

    @Autowired
    ServiceRepository serviceRepository;

    @Autowired
    TypeEmployeeRepository typeEmployeeRepository;

    @GetMapping
    public List<ServiceDto> getAll() {
        List<Service> services = serviceRepository.findAll();
        return ServiceDto.converter(services);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ServiceDto> getServiceId(@PathVariable Long id) {
        Optional<Service> service = serviceRepository.findById(id);
        if (service.isPresent()) {
            return ResponseEntity.ok(new ServiceDto(service.get()));
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/typeEmployee={id}")
    public List<ServiceDto> getServiceTypeEmployee(@PathVariable Long id) {
        List<Service> services = serviceRepository.findByTypeEmployeeId(id);
        return ServiceDto.converter(services);
    }

    @PostMapping
    @Transactional
    public ResponseEntity<ServiceDto> createNewService(@RequestBody @Valid ServiceForm form,
                                                       UriComponentsBuilder uriBuilder) {

        Service service = form.converter(typeEmployeeRepository);

        Optional<Service> serviceExist = serviceRepository.findByDescriptionIgnoreCase(service.getDescription());

        if (serviceExist.isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }

        serviceRepository.save(service);
        URI uri = uriBuilder.path("/services/{id}").buildAndExpand(service.getId()).toUri();

        return ResponseEntity.created(uri).body(new ServiceDto(service));

    }

    @PutMapping("/{id}")
    @Transactional
    public ResponseEntity<ServiceDto> updateService(@PathVariable Long id, @RequestBody @Valid ServiceForm form) {
        Optional<Service> optional = serviceRepository.findById(id);

        if (optional.isPresent()) {
            Service service = form.upload(id, serviceRepository, typeEmployeeRepository);
            return ResponseEntity.ok(new ServiceDto(service));
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> deleteService(@PathVariable Long id) {
        Optional<Service> optional = serviceRepository.findById(id);

        if (optional.isPresent()) {
            serviceRepository.deleteById(id);
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.notFound().build();
    }

}