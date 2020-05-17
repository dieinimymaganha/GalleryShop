package GalleryShop.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.springframework.security.core.GrantedAuthority;

@Entity
public class Profile implements GrantedAuthority {

    private static final long serialVersionUID = 1L;

    @Id
    private String role;

    @ManyToMany(mappedBy = "profiles", cascade = CascadeType.ALL)
    private List<UserLogin> userLogins;

    

    @Override
    public String getAuthority() {
        return this.role;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }


    public List<UserLogin> getUserLogins() {
        return userLogins;
    }

    public void setUserLogins(List<UserLogin> userLogins) {
        this.userLogins = userLogins;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}