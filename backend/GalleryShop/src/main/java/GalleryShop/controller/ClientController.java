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
import java.util.Optional;


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

	@GetMapping("/{id}")
	public ResponseEntity<ClientDto> getClientId(@PathVariable Long id) {
		Optional<Client> client = clientRepository.findById(id);
		if (client.isPresent()) {
			return ResponseEntity.ok(new ClientDto(client.get()));
		}
		return ResponseEntity.notFound().build();
	}

	@GetMapping("/cpf={cpf}")
	public ResponseEntity<ClientDto> getClientCpf(@PathVariable String cpf) {
		Optional<Client> client = clientRepository.findByCpf(cpf);
		if (client.isPresent()) {
			return ResponseEntity.ok(new ClientDto(client.get()));
		}
		return ResponseEntity.notFound().build();
	}

	@PostMapping
	public ResponseEntity<ClientDto> registerNewClient(@RequestBody  @Valid ClientForm form, UriComponentsBuilder uriBuilder ){
		Client client = form.converter();
		clientRepository.save(client);
		URI uri = uriBuilder.path("/clients/{id}").buildAndExpand(client.getId()).toUri();
		return ResponseEntity.created(uri).body(new ClientDto(client));		
	}

	@PutMapping("/{id}")
	public ResponseEntity<ClientDto> uploadClient(@PathVariable Long id, @RequestBody @Valid ClientForm form){
		Optional<Client> optional = clientRepository.findById(id);

		if(optional.isPresent()){
			Client client = form.upload(id, clientRepository);
			return ResponseEntity.ok(new ClientDto(client));
		}
		return ResponseEntity.notFound().build();
	}

	

}
