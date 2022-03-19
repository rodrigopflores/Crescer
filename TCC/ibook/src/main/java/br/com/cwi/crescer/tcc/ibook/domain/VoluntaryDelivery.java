package br.com.cwi.crescer.tcc.ibook.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Getter
@Setter
@Entity
@Table(name = "ib_voluntary_delivery")
public class VoluntaryDelivery extends Delivery {

    @Column
    private Double creditPrice;

}
