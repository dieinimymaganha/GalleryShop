package GalleryShop.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.TypeEmployee;

public interface TypeEmployeeRepository extends JpaRepository<TypeEmployee, Long> {

    TypeEmployee findByDescription(String descriptionTypeEmployee);
}
