package GalleryShop.controller.dto;

import GalleryShop.model.ServiceRecord;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class ServiceRecordDto {
    private Long id;
    private Double discount;
    private Date dateService;
    private EmployeeDtoBasic employeeDtoBasic;
    private ClientDto clientDto;
    private ServiceDto serviceDto;


    public ServiceRecordDto(final ServiceRecord serviceRecord) {
        this.id = serviceRecord.getId();
        this.discount = serviceRecord.getDiscount();
        this.dateService = serviceRecord.getDateService();
        this.employeeDtoBasic = new EmployeeDtoBasic(serviceRecord.getEmployee());
        this.clientDto = new ClientDto(serviceRecord.getClient());
        this.serviceDto = new ServiceDto(serviceRecord.getService());

    }

    public Date getDateService() {
        return dateService;
    }

    public ServiceDto getServiceDto() {
        return serviceDto;
    }

    public ClientDto getClientDto() {
        return clientDto;
    }

    public Long getId() {
        return id;
    }

    public Double getDiscount() {
        return discount;
    }

    public EmployeeDtoBasic getEmployeeDtoBasic() {
        return employeeDtoBasic;
    }

    public static List<ServiceRecordDto> convertDto(final List<ServiceRecord> serviceRecords) {
        return serviceRecords.stream().map(ServiceRecordDto::new).collect(Collectors.toList());
    }


}
