package GalleryShop.repository;

import GalleryShop.model.ServiceRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface ServiceRecordRepository extends JpaRepository<ServiceRecord, Long> {


    @Query(value = "select * from service_record s \n" +
            "inner join account_client ac on s.account_client_id = ac.id \n" +
            "inner join billed_service b ON b.id = s.billed_service_id \n" +
            "where ac.client_id = ?", nativeQuery = true)
    List<ServiceRecord> findByClientId(Long id);

    @Query(value = "select * from service_record s " +
            "inner join account_employee ac on s.account_employee_id = ac.id " +
            "inner join billed_service b ON b.id = s.billed_service_id \n" +
            "where ac.employee_id = ?", nativeQuery = true)
    List<ServiceRecord> findByEmployeeId(Long id);



}
