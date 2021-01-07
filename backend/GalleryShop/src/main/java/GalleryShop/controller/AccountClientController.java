package GalleryShop.controller;

import GalleryShop.controller.dto.AccountClientDto;
import GalleryShop.model.AccountClient;
import GalleryShop.repository.AccountClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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

}
