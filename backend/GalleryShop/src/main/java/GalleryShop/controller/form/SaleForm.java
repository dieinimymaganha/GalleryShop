package GalleryShop.controller.form;

import GalleryShop.model.*;
import GalleryShop.repository.*;

import java.util.Date;
import java.util.Optional;

public class SaleForm {

    private Long productId;

    private Long clientId;

    private Integer quantity;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getClientId() {
        return clientId;
    }

    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Sale converter(ProductRepository productRepository,
                          AccountClientRepository accountClientRepository,
                          ProductSoldRepository productSoldRepository,
                          ClientRepository clientRepository,
                          SaleRepository saleRepository) {

        Product product = productRepository.getOne(productId);

        Client client = clientRepository.getOne(clientId);


        AccountClient accountClient = new AccountClient();

        Date dateSale = new Date();

        ProductSold productSold = new ProductSold();

        double valueTotal = 0.0;

        if (product != null) {
            Optional<AccountClient> accountClientOptional = accountClientRepository.findByClientId(clientId);

            if (accountClientOptional.isPresent()) {
                accountClient = accountClientOptional.get();

                Optional<ProductSold> productSoldOptional = productSoldRepository.findByProductSoldDescription(product.getDescription());
                valueTotal = quantity * product.getValue();

                if (productSoldOptional.isPresent()) {

                    productSold = productSoldOptional.get();
                    Optional<Sale> saleOptional = saleRepository.findByProductSoldId(productSold.getId());

                    Sale sale = saleOptional.get();
                    int newQuantity = quantity + productSold.getQuantity();
                    productSold.setValueTotal(productSold.getValueTotal() + valueTotal);
                    productSold.setQuantity(newQuantity);

                    return sale;


                } else {
                    productSold.setDescription(product.getDescription());
                    productSold.setValue(product.getValue());
                    productSold.setQuantity(quantity);
                    productSold.setValueTotal(valueTotal);
                    productSoldRepository.save(productSold);
                }
                accountClient.setAmount(accountClient.getAmount() + valueTotal);

            }
        }
        return new Sale(dateSale, client, productSold, accountClient);
//        return null;
    }
}
