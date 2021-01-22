package GalleryShop.repository;

import GalleryShop.model.ServiceRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface ServiceRecordRepository extends JpaRepository<ServiceRecord, Long> {


    @Query(value = "select * from service_record s " +
            "inner join account_client ac on s.account_id = ac.id " +
            "inner join billed_service b ON b.id = s.billed_service_id " +
            "inner join payment p ON p.account_client_id = ac.id where ac.client_id = ? " +
            "and s.date_service > p.date_payment", nativeQuery = true)
    List<ServiceRecord> findByClientId(Long id);

}
