package br.com.cwi.crescer.tcc.ibook.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "ib_book")
@SequenceGenerator(name = "ib_seq_book", sequenceName = "ib_seq_book", allocationSize = 1)
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ib_seq_book")
    private Integer id;

    @Column
    private String title;

    @Column
    private String author;

    @Column
    private String description;

}
