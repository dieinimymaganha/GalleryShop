package GalleryShop.controller;


import GalleryShop.controller.dto.SaleDto;
import GalleryShop.controller.form.SaleForm;
import GalleryShop.model.Sale;
import GalleryShop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.net.URI;
import java.util.Optional;

@RestController
@RequestMapping("/sales")
public class SaleController {

    @Autowired
    AccountClientRepository accountClientRepository;

    @Autowired
    ProductSoldRepository productSoldRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ClientRepository clientRepository;

    @Autowired
    SaleRepository saleRepository;


    @PostMapping
    @Transactional
    public ResponseEntity<SaleDto> createNewSale(@RequestBody @Valid SaleForm form, UriComponentsBuilder uriBuilder) {
        Sale sale = form.converter(productRepository,
                accountClientRepository,
                productSoldRepository,
                clientRepository,
                saleRepository);

        if (sale != null) {

            Optional<Sale> saleOptional = saleRepository.findByProductSoldId(sale.getProductSold().getId());

            if (saleOptional.isPresent()) {
                return ResponseEntity.ok(new SaleDto(saleOptional.get()));
            } else {
                saleRepository.save(sale);
                URI uri = uriBuilder.path("/sales/{id}").buildAndExpand(sale.getId()).toUri();

                return ResponseEntity.created(uri).body(new SaleDto(sale));
            }

        }

        return ResponseEntity.badRequest().build();


    }


}
