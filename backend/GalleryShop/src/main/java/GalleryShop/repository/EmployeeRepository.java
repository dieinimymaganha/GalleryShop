package GalleryShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

}