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
    private List<ServiceRecordDto> serviceRecordDtos;

    public AccountClientDto(final AccountClient accountClient) {
        this.id = accountClient.getId();
        this.amount = accountClient.getAmount();
        this.amountPaid = accountClient.getAmountPaid();
        this.balance = accountClient.getBalance();
        this.clientDto = new ClientDto(accountClient.getClient());
        this.serviceRecordDtos = new ArrayList<>();
        this.serviceRecordDtos.addAll(accountClient.getServiceRecord().stream().map(ServiceRecordDto::new).collect(Collectors.toList()));
    }

    public List<ServiceRecordDto> getServiceRecordDtos() {
        return serviceRecordDtos;
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
