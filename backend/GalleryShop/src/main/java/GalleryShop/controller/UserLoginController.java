package GalleryShop.controller;

import javax.transaction.Transactional;
import javax.validation.Valid;

import GalleryShop.controller.dto.UserLoginDto;
import GalleryShop.controller.form.ServiceForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.form.UserLoginForm;
import GalleryShop.model.UserLogin;
import GalleryShop.repository.ClientRepository;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.ProfileRepository;
import GalleryShop.repository.UserLoginRepository;

import java.util.Optional;

@RestController
@RequestMapping("/users")
public class UserLoginController {

    @Autowired
    UserLoginRepository userLoginRepository;

    @Autowired
    ClientRepository clientRepository;

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    ProfileRepository profileRepository;

    @PostMapping
    @Transactional
    public ResponseEntity<?> createNewUser(@RequestBody @Valid UserLoginForm form, UriComponentsBuilder uriBuilder) {
        UserLogin userLogin = form.converter(clientRepository, employeeRepository, profileRepository);


        if (userLogin != null) {

            userLoginRepository.save(userLogin);

            return ResponseEntity.ok().build();
        }

        return ResponseEntity.notFound().build();

    }


    @PutMapping()
    @Transactional
    public ResponseEntity<UserLoginDto> updatePassword(@RequestBody UserLoginForm form) {
        Optional<UserLogin> optional = userLoginRepository.findByPhoneNumber(form.getPhoneNumber());

        if (optional.isPresent()) {
            UserLogin userLogin = form.upload(userLoginRepository);

            return ResponseEntity.ok(new UserLoginDto(userLogin));

        }
        return ResponseEntity.notFound().build();
    }


}