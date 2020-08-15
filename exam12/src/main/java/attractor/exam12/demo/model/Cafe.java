package attractor.exam12.demo.model;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Data
@Table(name = "cafes")
@Entity
@Builder
@AllArgsConstructor(access = AccessLevel.PACKAGE)
@NoArgsConstructor
public class Cafe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotBlank
    @Column
    private String title;

    @NotBlank
    @Column
    private String description;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "cafe")
    private List<Image> images;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "cafe")
    private List<Review> reviews;

    @Column
    private float rating;
}
