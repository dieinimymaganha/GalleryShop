package GalleryShop.config.security;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import GalleryShop.model.UserLogin;
import GalleryShop.repository.UserLoginRepository;

@Service
@Transactional
public class AuthenticationService implements UserDetailsService {
    @Autowired
    private UserLoginRepository repository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Optional<UserLogin> userLogin = repository.findByPhoneNumber(username);

        if (userLogin.isPresent()) {
            return userLogin.get();
        }

        throw new UsernameNotFoundException("Dados inválidos");
    }

}