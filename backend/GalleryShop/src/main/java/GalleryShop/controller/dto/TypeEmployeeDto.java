package GalleryShop.controller.dto;

import java.util.List;
import java.util.stream.Collectors;

import GalleryShop.model.TypeEmployee;

public class TypeEmployeeDto {

    private Long id;
    private String description;

    public TypeEmployeeDto(TypeEmployee typeEmployee) {
        this.id = typeEmployee.getId();
        this.description = typeEmployee.getDescription();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public static List<TypeEmployeeDto> converter(List<TypeEmployee> typeEmployees) {
        return typeEmployees.stream().map(TypeEmployeeDto::new).collect(Collectors.toList());
    }

}
