package GalleryShop.model.Enum;

public enum DayOfTheWeek {

    SEGUNDA("segunda"), TERCA("terça"), QUARTA("quarta"), QUINTA("quinta"), SEXTA("sexta"), SABADO("sabado"),
    DOMINGO("domngo");

    private String description;

    DayOfTheWeek(final String description) {
        this.description = description;
    }

    public String getDescricao() {
        return description;
    }
}