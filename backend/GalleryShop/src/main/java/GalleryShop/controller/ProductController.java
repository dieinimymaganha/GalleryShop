package GalleryShop.controller;

import GalleryShop.controller.dto.ProductDto;
import GalleryShop.controller.form.ProductForm;
import GalleryShop.model.Product;
import GalleryShop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/products")
public class ProductController {

    @Autowired
    ProductRepository productRepository;


    @GetMapping
    public List<ProductDto> getAll() {
        List<Product> products = productRepository.findAll();
        return ProductDto.converter(products);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductDto> getProductId(@PathVariable Long id) {
        Optional<Product> productOptional = productRepository.findById(id);
        if (productOptional.isPresent()) {
            return ResponseEntity.ok(new ProductDto(productOptional.get()));
        }
        return ResponseEntity.notFound().build();

    }


    @PostMapping
    @Transactional
    public ResponseEntity<ProductDto> createNewProduct(@RequestBody @Valid ProductForm form, UriComponentsBuilder uriBuilder) {
        Product product = form.converter();

        Optional<Product> productExist = productRepository.findByDescriptionIgnoreCase(product.getDescription());

        if (productExist.isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();

        }

        productRepository.save(product);
        URI uri = uriBuilder.path("products/{id}").buildAndExpand(product.getId()).toUri();
        return ResponseEntity.created(uri).body(new ProductDto(product));

    }


    @PutMapping("/{id}")
    @Transactional
    public ResponseEntity<ProductDto> updateProduct(@PathVariable Long id, @RequestBody @Valid ProductForm form) {
        Optional<Product> optional = productRepository.findById(id);
        if (optional.isPresent()) {
            Product product = form.upload(id, productRepository);
            return ResponseEntity.ok(new ProductDto(product));
        }
        return ResponseEntity.notFound().build();
    }


    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> deleteProduct(@PathVariable Long id) {
        Optional<Product> optional = productRepository.findById(id);

        if (optional.isPresent()) {
            productRepository.deleteById(id);
            return ResponseEntity.ok().build();

        }
        return ResponseEntity.notFound().build();

    }

}
