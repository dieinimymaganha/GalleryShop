package GalleryShop.config.validation;

public class ErrorFormClientDto {

    private String field;
    private String error;

    public ErrorFormClientDto(String field, String error){
        this.field = field;
        this.error = error;
    }

    public String getField() {
        return field;
    }

    public String getError() {
        return error;
    }


}
