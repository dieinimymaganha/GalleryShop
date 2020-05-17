package GalleryShop.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    Optional<Employee> findByPhoneNumber(String phoneNumber);

}