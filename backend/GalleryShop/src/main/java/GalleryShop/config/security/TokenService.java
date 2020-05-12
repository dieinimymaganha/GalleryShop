package GalleryShop.config.security;

import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import GalleryShop.model.UserLogin;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Service
public class TokenService {

    @Value("${galleryshop.jwt.expiration}")
    private String expiration;

    @Value("${galleryshop.jwt.secret}")
    private String secret;

    public String generateToken(Authentication authentication) {
        UserLogin logged = (UserLogin) authentication.getPrincipal();
        Date today = new Date();
        Date dateExpiration = new Date(today.getTime() + Long.parseLong(expiration));

        return Jwts.builder().setIssuer("API GalleryShop").setSubject(logged.getId().toString()).setIssuedAt(today)
                .setExpiration(dateExpiration).signWith(SignatureAlgorithm.HS256, secret).compact();
    }

}