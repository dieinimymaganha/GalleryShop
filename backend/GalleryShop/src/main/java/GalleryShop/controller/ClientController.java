package GalleryShop.controller;



import java.awt.print.Pageable;
import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.dto.ClientDto;
import GalleryShop.controller.form.ClientForm;
import GalleryShop.model.Client;
import GalleryShop.repository.ClientRepository;

@RestController
@RequestMapping("/clients")
public class ClientController {
	
	@Autowired
	private ClientRepository clientRepository;
	
	@GetMapping
	public Page<ClientDto> getListAll(){
		Page<Client> clients = (Page<Client>) clientRepository.findAll();
		return ClientDto.converter(clients);
	}
	
	@PostMapping
	public ResponseEntity<ClientDto> registerNewClient(@RequestBody ClientForm form, UriComponentsBuilder uriBuilder ){
		Client client = form.converter();
		clientRepository.save(client);
		URI uri = uriBuilder.path("/clients/{id}").buildAndExpand(client.getId()).toUri();
		return ResponseEntity.created(uri).body(new ClientDto(client));		
	}

}
