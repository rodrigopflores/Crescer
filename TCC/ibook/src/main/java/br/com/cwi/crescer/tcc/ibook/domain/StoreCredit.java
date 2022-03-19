package br.com.cwi.crescer.tcc.ibook.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "ib_store_credit")
@SequenceGenerator(name = "ib_seq_store_credit", sequenceName = "ib_seq_store_credit", allocationSize = 1)
public class StoreCredit {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ib_seq_store_credit")
    private Integer id;

    @ManyToOne
    @JoinColumn
    private Store store;

    @ManyToOne
    @JoinColumn
    private VoluntaryDelivery deliveryPerson;

    @Column
    private Double credit;

}
