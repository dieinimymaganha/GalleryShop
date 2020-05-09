package GalleryShop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import GalleryShop.controller.dto.EmployeeDto;
import GalleryShop.model.Employee;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.TypeEmployeeRepository;

@RestController
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    TypeEmployeeRepository typeEmployeeRepository;

    @GetMapping
    public List<EmployeeDto> getAll(){
        List<Employee> employees = employeeRepository.findAll();
        return EmployeeDto.converter(employees);
    }

}