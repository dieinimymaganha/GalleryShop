package GalleryShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.Profile;

public interface ProfileRepository extends JpaRepository<Profile, Long> {

    Profile findByRole(String role);

}