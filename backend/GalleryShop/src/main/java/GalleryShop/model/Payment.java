package GalleryShop.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private @Temporal(TemporalType.DATE)
    Date dateService;

    @ManyToOne()
    @JoinColumn(name = "type_payment_id")
    private TypePayment typePayment;

    @ManyToOne()
    private AccountClient accountClient;


    private Double value;


}
