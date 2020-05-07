package GalleryShop.controller.form;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import GalleryShop.model.TypeEmployee;

public class TypeEmployeeForm {

    @NotNull @NotEmpty
    private String description;
    

    



    public TypeEmployee converter(){
        return new TypeEmployee(description);
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}