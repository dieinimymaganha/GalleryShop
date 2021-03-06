package GalleryShop.controller;


import GalleryShop.controller.dto.ProductDto;
import GalleryShop.controller.dto.ProductSoldDto;
import GalleryShop.controller.dto.SaleDto;
import GalleryShop.controller.dto.ServiceDto;
import GalleryShop.controller.form.SaleForm;
import GalleryShop.model.*;
import GalleryShop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

    @Autowired
    PaymentRepository paymentRepository;

    @Autowired
    AccountEmployeeRepository accountEmployeeRepository;


    @GetMapping
    public List<SaleDto> getAll() {
        List<Sale> sales = saleRepository.findAll();
        return SaleDto.convertDto(sales);
    }

    @GetMapping("/clientId={id}")
    public List<SaleDto> getSalesClientId(@PathVariable Long id) {
        List<Sale> sales = saleRepository.findByClientId(id);

        return SaleDto.convertDto(sales);


    }

    @GetMapping("/employeeId={id}")
    public List<SaleDto> getSalesEmployeeId(@PathVariable Long id) {
        List<Sale> sales = saleRepository.findByEmployeeId(id);
        return SaleDto.convertDto(sales);


    }


    @PostMapping
    @Transactional
    public ResponseEntity<SaleDto> createNewSale(@RequestBody @Valid SaleForm form, UriComponentsBuilder uriBuilder) {
        Sale sale = form.converter(productRepository,
                accountClientRepository,
                productSoldRepository,
                clientRepository,
                saleRepository, accountEmployeeRepository);

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

    @PutMapping("productSold/{id}")
    @Transactional
    public ResponseEntity<ProductSoldDto> updateProductSold(@PathVariable Long id, @RequestBody @Valid SaleForm form) {

        Optional<Sale> saleOptional = saleRepository.findById(id);

        if (saleOptional.isPresent()) {

            Sale sale = saleOptional.get();

            Date dateSale = new Date();

            SimpleDateFormat fd = new SimpleDateFormat("yyyy-MM-dd");

            if (sale.getDateSale().toString().equals(fd.format(dateSale))) {
                List<Payment> paymentList = new ArrayList<>();

                if (sale.getAccountEmployee() != null) {
                    paymentList = paymentRepository.findByAccountEmployeeIDAndDatePayment(sale.getAccountEmployee().getId(), sale.getDateSale());

                } else if (sale.getAccountClient() != null) {
                    paymentList = paymentRepository.findByAccountClientIDAndDatePayment(sale.getAccountClient().getId(), sale.getDateSale());
                }

                if (paymentList.isEmpty()) {
                    ProductSold productSold = form.upload(id, saleRepository, productRepository, productSoldRepository);
                    if (productSold != null) {
                        return ResponseEntity.ok(new ProductSoldDto(productSold));
                    }
                    return ResponseEntity.status(HttpStatus.LOCKED).build();

                }
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
            }
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> deleteSale(@PathVariable Long id) {
        Optional<Sale> optional = saleRepository.findById(id);
        if (optional.isPresent()) {
            Sale sale = optional.get();
            Date dateSale = new Date();
            SimpleDateFormat fd = new SimpleDateFormat("yyyy-MM-dd");
            if (sale.getDateSale().toString().equals(fd.format(dateSale))) {
                List<Payment> paymentList = new ArrayList<>();
                AccountClient accountClient = new AccountClient();
                AccountEmployee accountEmployee = new AccountEmployee();

                if (sale.getAccountEmployee() != null) {
                    paymentList = paymentRepository.findByAccountEmployeeIDAndDatePayment(sale.getAccountEmployee().getId(), sale.getDateSale());

                } else if (sale.getAccountClient() != null) {
                    paymentList = paymentRepository.findByAccountClientIDAndDatePayment(sale.getAccountClient().getId(), sale.getDateSale());
                }

                if (paymentList.isEmpty()) {
                    if (sale.getAccountEmployee() != null) {
                        accountEmployee = sale.getAccountEmployee();
                        accountEmployee.setAmount(accountEmployee.getAmount() - sale.getProductSold().getValueTotal());
                        saleRepository.deleteById(id);
                        return ResponseEntity.ok().build();
                    } else if (sale.getAccountClient() != null) {
                        accountClient = sale.getAccountClient();
                        accountClient.setAmount(accountClient.getAmount() - sale.getProductSold().getValueTotal());
                        saleRepository.deleteById(id);
                        return ResponseEntity.ok().build();
                    }
                }
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
            }
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        return ResponseEntity.notFound().build();
    }

}
