package br.com.cwi.crescer.tcc.ibook.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "ib_delivery")
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Delivery extends RegularUser {

    @OneToMany
    @JoinColumn
    private List<Vehicle> vehicles;

}
