package br.com.cwi.crescer.tcc.ibook.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "ib_store")
public class Store extends User {

    @Column
    private String cnpj;

    @OneToOne
    @JoinColumn
    private Delivery delivery;

}
