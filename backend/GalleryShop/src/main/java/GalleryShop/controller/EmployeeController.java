package GalleryShop.controller;

import java.net.URI;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.dto.EmployeeDto;
import GalleryShop.controller.form.EmployeeForm;
import GalleryShop.model.Employee;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.TypeEmployeeRepository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    TypeEmployeeRepository typeEmployeeRepository;

    @GetMapping
    public List<EmployeeDto> getAll() {
        List<Employee> employees = employeeRepository.findAll();
        return EmployeeDto.converter(employees);
    }

    @PostMapping
    @Transactional
    public ResponseEntity<EmployeeDto> createNewEmployee(@RequestBody @Valid EmployeeForm form,
            UriComponentsBuilder uriBuilder) {
        Employee employee = form.converter(typeEmployeeRepository);
        if (employee.getTypeEmployees() == null) {
            return ResponseEntity.noContent().build();
        } else {
            employeeRepository.save(employee);
            URI uri = uriBuilder.path("/employees/{id}").buildAndExpand(employee.getId()).toUri();
            return ResponseEntity.created(uri).body(new EmployeeDto(employee));
        }

    }

}