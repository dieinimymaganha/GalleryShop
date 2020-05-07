package GalleryShop.controller;

import java.net.URI;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.dto.TypeEmployeeDto;
import GalleryShop.controller.form.TypeEmployeeForm;
import GalleryShop.model.TypeEmployee;
import GalleryShop.repository.TypeEmployeeRepository;

@RestController
@RequestMapping("/typeemployees")
public class TypeEmployeeController {
    @Autowired
    private TypeEmployeeRepository typeEmployeeRepository;

    @GetMapping
    public List<TypeEmployeeDto> getListAll() {
        List<TypeEmployee> typeEmployees = typeEmployeeRepository.findAll();
        return TypeEmployeeDto.converter(typeEmployees);

    }

    @PostMapping
    @Transactional
    public ResponseEntity<TypeEmployeeDto> createNew(@RequestBody @Valid TypeEmployeeForm form, UriComponentsBuilder uriBuilder){
        TypeEmployee typeEmployee = form.converter();
        typeEmployeeRepository.save(typeEmployee);
        URI uri = uriBuilder.path("/typeemployees/{id}").buildAndExpand(typeEmployee.getId()).toUri();
		return ResponseEntity.created(uri).body(new TypeEmployeeDto(typeEmployee));		
    }

}