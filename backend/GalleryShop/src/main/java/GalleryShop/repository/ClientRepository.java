package GalleryShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.Client;

import java.util.Optional;

public interface ClientRepository extends JpaRepository<Client, Long> {

    Optional<Client> findByCpf(String cpf);

    Optional<Client> findByPhoneNumber(String phoneNumber);
}
