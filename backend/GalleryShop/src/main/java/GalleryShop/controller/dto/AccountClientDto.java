package GalleryShop.controller.dto;

import GalleryShop.model.AccountClient;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class AccountClientDto {
    private Long id;
    private Double amount;
    private Double amountPaid;
    private Double balance;
    private ClientDto clientDto;
    private List<ServiceRecordDto> serviceRecordDto;
    private List<SaleDto> saleDto;

    public AccountClientDto(final AccountClient accountClient) {
        this.id = accountClient.getId();
        this.amount = accountClient.getAmount();
        this.amountPaid = accountClient.getAmountPaid();
        this.balance = accountClient.getBalance();
        this.clientDto = new ClientDto(accountClient.getClient());
        this.serviceRecordDto = new ArrayList<>();
        this.serviceRecordDto.addAll(accountClient.getServiceRecord().stream().map(ServiceRecordDto::new).collect(Collectors.toList()));
        this.saleDto = new ArrayList<>();
        this.saleDto.addAll(accountClient.getSales().stream().map(SaleDto::new).collect(Collectors.toList()));
    }

    public List<SaleDto> getSaleDto() {
        return saleDto;
    }

    public List<ServiceRecordDto> getServiceRecordDto() {
        return serviceRecordDto;
    }

    public Long getId() {
        return id;
    }

    public Double getAmount() {
        return amount;
    }

    public Double getAmountPaid() {
        return amountPaid;
    }

    public Double getBalance() {
        return balance;
    }

    public ClientDto getClientDto() {
        return clientDto;
    }

    public static List<AccountClientDto> convertDto(final List<AccountClient> accountClients) {
        return accountClients.stream().map(AccountClientDto::new).collect(Collectors.toList());
    }

}
