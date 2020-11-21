package GalleryShop.repository;

import GalleryShop.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    Optional<Employee> findByPhoneNumber(String phoneNumber);

    Optional<Employee> findByCpf(String cpf);

    Optional<Employee> findByRg(String rg);

    @Query(value = "select * from employee inner join employee_type_employees " +
            "on employee_type_employees.employee_id = employee.id " +
            "where employee_type_employees.type_employees_id = ?", nativeQuery = true)
    List<Employee> findyEmployeeTypeEmployee(Long id);

}