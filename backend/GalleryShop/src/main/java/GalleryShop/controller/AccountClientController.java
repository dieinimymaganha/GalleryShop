package GalleryShop.controller;

import GalleryShop.controller.dto.AccountClientDto;
import GalleryShop.model.AccountClient;
import GalleryShop.repository.AccountClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/accountClient")
public class AccountClientController {

    @Autowired
    AccountClientRepository accountClientRepository;

    @GetMapping
    public List<AccountClientDto> getAll() {
        List<AccountClient> accountClients = accountClientRepository.findAll();
        return AccountClientDto.convertDto(accountClients);
    }


    @GetMapping("/clientId={clientId}")
    public ResponseEntity<AccountClientDto> getClientId(@PathVariable Long clientId) {
        Optional<AccountClient> accountClient = accountClientRepository.findByClientId(clientId);
        if (accountClient.isPresent()) {
            return ResponseEntity.ok(new AccountClientDto((accountClient.get())));
        }
        return ResponseEntity.notFound().build();

    }

}
