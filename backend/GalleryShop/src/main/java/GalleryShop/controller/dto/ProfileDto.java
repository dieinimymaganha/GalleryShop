package GalleryShop.controller.dto;

import GalleryShop.model.Profile;

public class ProfileDto {

    private String role;

    public ProfileDto(Profile profile) {
        this.role = profile.getRole();
    }

    public ProfileDto(String role) {
        this.role = role;
    }

}