package GalleryShop.controller.dto;

import GalleryShop.model.ProductSold;
import GalleryShop.model.Sale;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class SaleDto {

    private Long id;
    private Date dateSale;
    private ProductSoldDto productSoldDto;

    public SaleDto(final Sale sale) {
        this.id = sale.getId();
        this.dateSale = sale.getDateSale();
        this.productSoldDto = new ProductSoldDto(sale.getProductSold());
    }

    public Long getId() {
        return id;
    }

    public Date getDateSale() {
        return dateSale;
    }

    public ProductSoldDto getProductSoldDto() {
        return productSoldDto;
    }

    public static List<SaleDto> convertDto(final List<Sale> sales) {
        return sales.stream().map(SaleDto::new).collect(Collectors.toList());
    }

}
