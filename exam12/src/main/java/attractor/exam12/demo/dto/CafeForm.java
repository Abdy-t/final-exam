package attractor.exam12.demo.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class CafeForm {

    @NotBlank(message = "Please add title")
    private String title = "";

    @NotBlank(message = "Please add description")
    private String description = "";

    @NotBlank(message = "Please upload image")
    private String image = "";
}
