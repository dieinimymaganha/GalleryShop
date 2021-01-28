package GalleryShop.controller.form;


import GalleryShop.model.*;
import GalleryShop.repository.*;

import java.util.Date;
import java.util.Optional;

public class SaleForm {

    private Long productId;

    private Long clientId;

    private Integer quantity;

    private Long employeeId;

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

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
                          SaleRepository saleRepository,
                          AccountEmployeeRepository accountEmployeeRepository) {

        Product product = productRepository.getOne(productId);

        AccountClient accountClient = new AccountClient();

        AccountEmployee accountEmployee = new AccountEmployee();


        Date dateSale = new Date();

        ProductSold productSold = new ProductSold();

        double valueTotal = quantity * product.getValue();

        if (product != null && quantity != null) {
            Optional<AccountClient> accountClientOptional = accountClientRepository.findByClientId(clientId);
            Optional<AccountEmployee> accountEmployeeOptional = accountEmployeeRepository.findByEmployeeId(employeeId);

            if (accountClientOptional.isPresent() && accountEmployeeOptional.isPresent()) {
                return null;
            } else if (accountClientOptional.isPresent() && employeeId == null) {
                Optional<ProductSold> productSoldOptional = productSoldRepository.findByProductSoldIdClientDescription(accountClientOptional.get().getClient().getId(), product.getDescription());
                System.out.println("AQUI >>>>> 0 <<<<<");
                if (productSoldOptional.isPresent()) {
                    productSold = productSoldOptional.get();
                    System.out.println("AQUI >>>>> 1 <<<<<");
                }
            } else if (accountEmployeeOptional.isPresent() && clientId == null) {
                Optional<ProductSold> productSoldOptional = productSoldRepository.findByProductSoldIdEmployeeDescription(
                        accountEmployeeOptional.get().getEmployee().getId(), product.getDescription());
                if (productSoldOptional.isPresent()) {
                    productSold = productSoldOptional.get();
                }
            }

            if (productSold.getId() == null) {
                productSold.setDescription(product.getDescription());
                productSold.setValue(product.getValue());
                productSold.setQuantity(quantity);
                productSold.setValueTotal(valueTotal);
                productSoldRepository.save(productSold);

            } else {
                Optional<Sale> saleOptional = saleRepository.findByProductSoldId(productSold.getId());
                Sale sale = saleOptional.get();
                if (sale.getAccountClient() != null) {
                    accountClient = sale.getAccountClient();
                    accountClient.setAmount(accountClient.getAmount() + valueTotal);
                } else if (sale.getAccountEmployee() != null) {
                    accountEmployee = sale.getAccountEmployee();
                    accountEmployee.setAmount(accountEmployee.getAmount() + valueTotal);
                }
                int newQuantity = quantity + productSold.getQuantity();
                productSold.setValueTotal(productSold.getValueTotal() + valueTotal);
                productSold.setQuantity(newQuantity);
                return sale;
            }

            if (accountClientOptional.isPresent() && accountEmployeeOptional.isPresent()) {
                return null;
            } else if (accountClientOptional.isPresent() && employeeId == null) {
                accountClient = accountClientOptional.get();
                accountClient.setAmount(accountClient.getAmount() + valueTotal);
                return new Sale(dateSale, productSold, accountClient);
            } else if (accountEmployeeOptional.isPresent() && clientId == null) {
                accountEmployee = accountEmployeeOptional.get();
                accountEmployee.setAmount(accountEmployee.getAmount() + valueTotal);
                return new Sale(dateSale, productSold, accountEmployee);
            } else {
                return null;
            }
        }
        return null;
    }


    public ProductSold upload(Long id, SaleRepository saleRepository,
                              ProductRepository productRepository, ProductSoldRepository productSoldRepository) {

        Optional<Sale> saleOptional = saleRepository.findById(id);

        if (saleOptional.isPresent()) {
            Sale sale = saleOptional.get();

            ProductSold productSold = new ProductSold();

            Product product = productRepository.getOne(productId);

            Optional<ProductSold> productSoldOptional = productSoldRepository.findById(sale.getProductSold().getId());

            if (productSoldOptional.isPresent() &&
                    productSoldOptional.get().getDescription().equals(product.getDescription())) {

                productSold = productSoldOptional.get();

                double valueFinal = quantity * productSold.getValue();

                if (productSold.getQuantity() == quantity) {
                    if (sale.getAccountClient() != null) {
                        AccountClient accountClient = sale.getAccountClient();
                        accountClient.setAmount(accountClient.getAmount());
                    } else if (sale.getAccountEmployee() != null) {
                        AccountEmployee accountEmployee = sale.getAccountEmployee();
                        accountEmployee.setAmount(accountEmployee.getAmount());
                    }

                } else {
                    if (sale.getAccountClient() != null) {
                        AccountClient accountClient = sale.getAccountClient();
                        accountClient.setAmount((accountClient.getAmount() - productSold.getValueTotal()) + valueFinal);
                    } else if (sale.getAccountEmployee() != null) {
                        AccountEmployee accountEmployee = sale.getAccountEmployee();
                        accountEmployee.setAmount((accountEmployee.getAmount() - productSold.getValueTotal()) + valueFinal);
                    }

                }
                productSold = productSoldOptional.get();
                productSold.setQuantity(quantity);
                productSold.setValueTotal(valueFinal);

                return productSold;
            }
        }


        return null;
    }


}
