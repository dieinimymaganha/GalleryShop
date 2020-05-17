package GalleryShop.controller;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.form.UserLoginForm;
import GalleryShop.model.UserLogin;
import GalleryShop.repository.ClientRepository;
import GalleryShop.repository.UserLoginRepository;

@RestController
@RequestMapping("/users")
public class UserLoginController {

    @Autowired
    UserLoginRepository userLoginRepository;

    @Autowired
    ClientRepository clientRepository;

    @PostMapping
    @Transactional
    public ResponseEntity<?> createNewUser(@RequestBody @Valid UserLoginForm form, UriComponentsBuilder uriBuilder) {
        UserLogin userLogin = form.coverter(clientRepository);
        userLoginRepository.save(userLogin);

        return ResponseEntity.ok().build();

    }

}