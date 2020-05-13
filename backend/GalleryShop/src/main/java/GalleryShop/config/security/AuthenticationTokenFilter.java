package GalleryShop.config.security;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import GalleryShop.model.UserLogin;
import GalleryShop.repository.UserLoginRepository;

public class AuthenticationTokenFilter extends OncePerRequestFilter {

    private UserLoginRepository userLoginRepository;

    private final TokenService tokenService;

    public AuthenticationTokenFilter(final TokenService tokenService, final UserLoginRepository userLoginRepository) {
        this.tokenService = tokenService;
        this.userLoginRepository = userLoginRepository;
    }

    @Override
    protected void doFilterInternal(final HttpServletRequest request, final HttpServletResponse response,
            final FilterChain filterChain) throws ServletException, IOException {
        final String token = recoverToken(request);

        final boolean validated = tokenService.isTokenValid(token);
        if (validated) {
            authenticateUserToken(token);
        }

        filterChain.doFilter(request, response);

    }

    private String recoverToken(final HttpServletRequest request) {
        final String token = request.getHeader("Authorization");

        if (token == null || token.isEmpty() || !token.startsWith("Bearer ")) {
            return null;
        }
        return token.substring(7, token.length());
    }

    private void authenticateUserToken(final String token) {

        Long idUser = tokenService.getIdUser(token);
        UserLogin userLogin = userLoginRepository.findById(idUser).get();
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userLogin, null,
                userLogin.getAuthorities());

        SecurityContextHolder.getContext().setAuthentication(authentication);

    }

}