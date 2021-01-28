package GalleryShop.model;


import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Sale {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private @Temporal(TemporalType.DATE)
    Date dateSale;

    @OneToOne
    @JoinColumn(name = "productSold_id", referencedColumnName = "id")
    @Cascade({org.hibernate.annotations.CascadeType.REMOVE})
    private ProductSold productSold;

    @ManyToOne()
    private AccountClient accountClient;

    @ManyToOne()
    private AccountEmployee accountEmployee;


    public Sale(Date dateSale, ProductSold productSold, AccountEmployee accountEmployee) {
        this.dateSale = dateSale;
        this.productSold = productSold;
        this.accountEmployee = accountEmployee;
    }

    public Sale(Date dateSale, ProductSold productSold, AccountClient accountClient) {
        this.dateSale = dateSale;
        this.productSold = productSold;
        this.accountClient = accountClient;
    }

    public AccountEmployee getAccountEmployee() {
        return accountEmployee;
    }

    public void setAccountEmployee(AccountEmployee accountEmployee) {
        this.accountEmployee = accountEmployee;
    }

    public Sale() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDateSale() {
        return dateSale;
    }

    public void setDateSale(Date dateSale) {
        this.dateSale = dateSale;
    }


    public ProductSold getProductSold() {
        return productSold;
    }

    public void setProductSold(ProductSold productSold) {
        this.productSold = productSold;
    }

    public AccountClient getAccountClient() {
        return accountClient;
    }

    public void setAccountClient(AccountClient accountClient) {
        this.accountClient = accountClient;
    }

    @Override
    public String toString() {
        return "Sale{" +
                "id=" + id +
                ", dateSale=" + dateSale +
                ", productSold=" + productSold +
                ", accountClient=" + accountClient +
                '}';
    }
}
