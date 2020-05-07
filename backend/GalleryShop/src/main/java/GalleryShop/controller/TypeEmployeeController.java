package GalleryShop.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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

    @GetMapping("/{id}")
    public ResponseEntity<TypeEmployeeDto> getTypeEmployeeId(@PathVariable Long id) {
        Optional<TypeEmployee> typeEmployee = typeEmployeeRepository.findById(id);
        if (typeEmployee.isPresent()) {
            return ResponseEntity.ok(new TypeEmployeeDto(typeEmployee.get()));
        }
        return ResponseEntity.notFound().build();

    }

    @PostMapping
    @Transactional
    public ResponseEntity<TypeEmployeeDto> createNew(@RequestBody @Valid TypeEmployeeForm form,
            UriComponentsBuilder uriBuilder) {
        TypeEmployee typeEmployee = form.converter();
        typeEmployeeRepository.save(typeEmployee);
        URI uri = uriBuilder.path("/typeemployees/{id}").buildAndExpand(typeEmployee.getId()).toUri();
        return ResponseEntity.created(uri).body(new TypeEmployeeDto(typeEmployee));
    }

    @PutMapping("/{id}")
    @Transactional
    public ResponseEntity<TypeEmployeeDto> uploadTypeEmployee(@PathVariable Long id,
            @RequestBody @Valid TypeEmployeeForm form) {

        Optional<TypeEmployee> optional = typeEmployeeRepository.findById(id);

        if (optional.isPresent()){
            TypeEmployee typeEmployee = form.upload(id, typeEmployeeRepository);
            return ResponseEntity.ok(new TypeEmployeeDto(typeEmployee));
        }

        return ResponseEntity.notFound().build();

    }

}