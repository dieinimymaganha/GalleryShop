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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.dto.EmployeeDto;
import GalleryShop.controller.form.EmployeeForm;
import GalleryShop.model.Employee;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.ProfileRepository;
import GalleryShop.repository.TypeEmployeeRepository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    TypeEmployeeRepository typeEmployeeRepository;

    @Autowired
    ProfileRepository profileRepository;

    @GetMapping
    public List<EmployeeDto> getAll() {
        List<Employee> employees = employeeRepository.findAll();
        return EmployeeDto.converter(employees);
    }

    @GetMapping("/{id}")
    public ResponseEntity<EmployeeDto> getEmployeeId(@PathVariable Long id) {
        Optional<Employee> employee = employeeRepository.findById(id);
        if (employee.isPresent()) {
            return ResponseEntity.ok(new EmployeeDto(employee.get()));
        }

        return ResponseEntity.notFound().build();
    }

    @GetMapping("/phoneNumber={phoneNumber}")
    public ResponseEntity<EmployeeDto> getEmployeePhoneNumber(@PathVariable String phoneNumber) {
        Optional<Employee> employee = employeeRepository.findByPhoneNumber(phoneNumber);

        if (employee.isPresent()) {
            return ResponseEntity.ok(new EmployeeDto(employee.get()));
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @Transactional
    public ResponseEntity<EmployeeDto> createNewEmployee(@RequestBody @Valid EmployeeForm form,
                                                         UriComponentsBuilder uriBuilder) {
        Employee employee = form.converter(typeEmployeeRepository, profileRepository);

        Optional<Employee> employeeCpf = employeeRepository.findByCpf(employee.getCpf());
        Optional<Employee> employeeRg = employeeRepository.findByRg(employee.getRg());
        Optional<Employee> employeePhoneNumber = employeeRepository.findByPhoneNumber(employee.getPhoneNumber());

        if (employeeCpf.isPresent() || employeeRg.isPresent() || employeePhoneNumber.isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }

        if (employee.getTypeEmployees() == null) {
            return ResponseEntity.noContent().build();
        } else {
            employeeRepository.save(employee);
            URI uri = uriBuilder.path("/employees/{id}").buildAndExpand(employee.getId()).toUri();
            return ResponseEntity.created(uri).body(new EmployeeDto(employee));
        }

    }

    @PutMapping("/{id}")
    @Transactional
    public ResponseEntity<EmployeeDto> updateEmployee(@PathVariable Long id, @RequestBody @Valid EmployeeForm form) {

        Optional<Employee> optional = employeeRepository.findById(id);

        if (optional.isPresent()) {
            Employee employee = form.upload(id, employeeRepository, typeEmployeeRepository);
            return ResponseEntity.ok(new EmployeeDto(employee));
        }

        return ResponseEntity.notFound().build();

    }

    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> deleteEmployee(@PathVariable Long id) {
        Optional<Employee> optional = employeeRepository.findById(id);
        if (optional.isPresent()) {
            employeeRepository.deleteById(id);
            return ResponseEntity.ok().build();

        }

        return ResponseEntity.notFound().build();
    }


    @GetMapping("/typeEmployeeId={id}")
    @Transactional
    public List<EmployeeDto> findEmployee(@PathVariable Long id) {
        List<Employee> listEmployees = employeeRepository.findyEmployeeTypeEmployee(id);
        return EmployeeDto.converter(listEmployees);
    }

}