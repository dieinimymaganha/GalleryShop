package GalleryShop.controller;


import GalleryShop.controller.dto.ClientDto;
import GalleryShop.controller.form.ClientForm;
import GalleryShop.model.Client;
import GalleryShop.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.validation.Valid;
import java.net.URI;



@RestController
@RequestMapping("/clients")
public class ClientController {
	
	@Autowired
	private ClientRepository clientRepository;
	
	@GetMapping
	public Page<ClientDto> getListAll(@PageableDefault(sort = "id", direction = Sort.Direction.DESC, size = 10)
												  Pageable paginacao){
		Page<Client> clients = clientRepository.findAll(paginacao);
		return ClientDto.converter(clients);
	}
	
	@PostMapping
	public ResponseEntity<ClientDto> registerNewClient(@RequestBody  @Valid ClientForm form, UriComponentsBuilder uriBuilder ){
		Client client = form.converter();
		clientRepository.save(client);
		URI uri = uriBuilder.path("/clients/{id}").buildAndExpand(client.getId()).toUri();
		return ResponseEntity.created(uri).body(new ClientDto(client));		
	}

}
