package GalleryShop.repository;

import GalleryShop.model.AccountClient;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AccountClientRepository extends JpaRepository<AccountClient, Long> {

    Optional<AccountClient> findByClientId(Long id);

}
