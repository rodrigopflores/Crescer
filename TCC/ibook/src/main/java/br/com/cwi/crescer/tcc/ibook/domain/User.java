package br.com.cwi.crescer.tcc.ibook.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "ib_user")
@Inheritance(strategy = InheritanceType.JOINED)
@SequenceGenerator(name = "ib_seq_user", sequenceName = "ib_seq_user", allocationSize = 1)
public abstract class User {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ib_seq_user")
    private Integer id;

    @Column
    private String name;

    @Column
    private String email;

    @Column
    private String phoneNumber;

    @Column
    private String profilePicUrl;

    @Embedded
    private Account account;

    @OneToMany
    @JoinColumn
    private List<Offer> offers;

    @Column
    private String address;

    @Column
    private String city;

    @Column
    private String state;

    @Column
    private String cep;

    @Column
    private BigDecimal longitude;

    @Column
    private BigDecimal latitude;

}
