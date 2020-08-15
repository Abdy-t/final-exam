package attractor.exam12.demo.dto;

import attractor.exam12.demo.model.Cafe;
import attractor.exam12.demo.model.Image;
import lombok.*;

import javax.validation.constraints.NotBlank;
import java.util.List;

@Getter
@Setter
@Builder(access = AccessLevel.PACKAGE)
@AllArgsConstructor(access = AccessLevel.PACKAGE)
@NoArgsConstructor(access = AccessLevel.PACKAGE)
public class CafeDTO {
    private int id;
    private String title;
    private String description;
    @NotBlank(message = "Please upload image")
    private String image;
    private float rating;
    private int reviewsCount;
    private int imagesCount;

    public static CafeDTO from(Cafe cafe) {
        return builder()
                .id(cafe.getId())
                .title(cafe.getTitle())
                .description(cafe.getDescription())
                .image(getPath(cafe.getImages()))
                .rating(cafe.getRating())
                .reviewsCount(cafe.getReviews().size())
                .imagesCount(cafe.getImages().size())
                .build();
    }

    private static String getPath(List<Image> images) {
        if (images.size() == 0) {
            return "image not found";
        } else {
            return images.get(0).getPath();
        }
    }
}
