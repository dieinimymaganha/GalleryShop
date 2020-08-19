package GalleryShop.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.dto.ClientDto;
import GalleryShop.controller.form.ClientForm;
import GalleryShop.model.Client;
import GalleryShop.repository.ClientRepository;
import GalleryShop.repository.ProfileRepository;

@RestController
@RequestMapping("/clients")
public class ClientController {

	@Autowired
	private ClientRepository clientRepository;

	@Autowired
	private ProfileRepository profileRepository;

	@GetMapping
	@Cacheable(value = "customersList")
	public List<ClientDto> getAll() {
		List<Client> clients = clientRepository.findAll();
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
	@Transactional
	@CacheEvict(value = "customersList", allEntries = true)
	public ResponseEntity<ClientDto> createNewClient(@RequestBody @Valid ClientForm form,
			UriComponentsBuilder uriBuilder) {

		Client client = form.converter(profileRepository);

		Optional<Client> clientCpf = clientRepository.findByCpf(client.getCpf());
		Optional<Client> clientPhoneNumber = clientRepository.findByPhoneNumber(client.getPhoneNumber());
		Optional<Client> clientEmail = clientRepository.findByEmail(client.getEmail());

		if(clientCpf.isPresent() || clientPhoneNumber.isPresent() || clientEmail.isPresent() ){
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}

		clientRepository.save(client);
		URI uri = uriBuilder.path("/clients/{id}").buildAndExpand(client.getId()).toUri();
		return ResponseEntity.created(uri).body(new ClientDto(client));
	}

	@PutMapping("/{id}")
	@Transactional
	@CacheEvict(value = "customersList", allEntries = true)
	public ResponseEntity<ClientDto> updateClient(@PathVariable Long id, @RequestBody @Valid ClientForm form) {
		Optional<Client> optional = clientRepository.findById(id);

		if (optional.isPresent()) {
			Client client = form.upload(id, clientRepository);
			return ResponseEntity.ok(new ClientDto(client));
		}
		return ResponseEntity.notFound().build();
	}

	@DeleteMapping("/{id}")
	@Transactional
	@CacheEvict(value = "customersList", allEntries = true)
	public ResponseEntity<?> deleteClient(@PathVariable Long id) {
		Optional<Client> optional = clientRepository.findById(id);

		if (optional.isPresent()) {
			clientRepository.deleteById(id);
			return ResponseEntity.ok().build();
		}
		return ResponseEntity.notFound().build();
	}

}
