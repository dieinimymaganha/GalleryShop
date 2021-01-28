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
    @JoinColumn(name = "client_id", referencedColumnName = "id")
    private Client client;

    @OneToOne
    @JoinColumn(name = "productSold_id", referencedColumnName = "id")
    @Cascade({org.hibernate.annotations.CascadeType.REMOVE})
    private ProductSold productSold;

    @ManyToOne()
    @JoinColumn(name = "account_id")
    private AccountClient accountClient;

    @ManyToOne()
    private AccountEmployee accountEmployee;

    public Sale(Date dateSale, Client client, ProductSold productSold, AccountClient accountClient) {
        this.dateSale = dateSale;
        this.client = client;
        this.productSold = productSold;
        this.accountClient = accountClient;
    }

    public Sale(Long id, Date dateSale, ProductSold productSold, AccountEmployee accountEmployee) {
        this.id = id;
        this.dateSale = dateSale;
        this.productSold = productSold;
        this.accountEmployee = accountEmployee;
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

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
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
                ", client=" + client +
                ", productSold=" + productSold +
                ", accountClient=" + accountClient +
                '}';
    }
}
