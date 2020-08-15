package attractor.exam12.demo.model;

import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@Table(name = "reviews")
@Entity
@Builder
@AllArgsConstructor(access = AccessLevel.PACKAGE)
@NoArgsConstructor
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String text;

    @Column
    private String date;

    @Column
    private float rating;

    @Column
    private String user_name;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "cafe_id")
    private Cafe cafe;
}
