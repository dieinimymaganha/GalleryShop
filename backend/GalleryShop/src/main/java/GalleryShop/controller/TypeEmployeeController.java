package GalleryShop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import GalleryShop.controller.dto.TypeEmployeeDto;
import GalleryShop.model.TypeEmployee;
import GalleryShop.repository.TypeEmployeeRepository;

@RestController
@RequestMapping("/typeemployee")
public class TypeEmployeeController {
    @Autowired
    private TypeEmployeeRepository typeEmployeeRepository;

    @GetMapping
    public List<TypeEmployeeDto> getListAll() {
        List<TypeEmployee> typeEmployees = typeEmployeeRepository.findAll();
        return TypeEmployeeDto.converter(typeEmployees);

    }

}