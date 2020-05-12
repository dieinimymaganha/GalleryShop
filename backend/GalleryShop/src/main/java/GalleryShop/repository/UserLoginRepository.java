package GalleryShop.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.UserLogin;

public interface UserLoginRepository extends JpaRepository<UserLogin, Long> {
    Optional<UserLogin> findByEmail(String email);
}