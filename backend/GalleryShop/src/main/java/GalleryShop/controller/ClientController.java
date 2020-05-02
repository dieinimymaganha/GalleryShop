package GalleryShop.controller;


import GalleryShop.controller.dto.ClientDto;
import GalleryShop.controller.form.ClientForm;
import GalleryShop.model.Client;
import GalleryShop.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.util.UriComponentsBuilder;
import java.net.URI;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



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
	public ResponseEntity<ClientDto> registerNewClient(@RequestBody ClientForm form, UriComponentsBuilder uriBuilder ){
		Client client = form.converter();
		clientRepository.save(client);
		URI uri = uriBuilder.path("/clients/{id}").buildAndExpand(client.getId()).toUri();
		return ResponseEntity.created(uri).body(new ClientDto(client));		
	}

}
