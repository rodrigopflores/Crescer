package br.com.cwi.crescer.tcc.ibook.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "ib_offer")
@SequenceGenerator(name = "ib_seq_offer", sequenceName = "ib_seq_offer", allocationSize = 1)
public class Offer {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ib_seq_offer")
    private Integer id;

    @ManyToOne
    @JoinColumn
    private Book book;

    @Column
    private Double price;

    @Column
    private Integer quantity;
}
