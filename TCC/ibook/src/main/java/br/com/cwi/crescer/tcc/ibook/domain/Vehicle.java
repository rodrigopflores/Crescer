package br.com.cwi.crescer.tcc.ibook.domain;

import br.com.cwi.crescer.tcc.ibook.enums.VehicleType;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "ib_vehicle")
@SequenceGenerator(name = "ib_seq_vehicle", sequenceName = "ib_seq_vehicle", allocationSize = 1)
public class Vehicle {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ib_seq_vehicle")
    private Integer id;

    @Column
    private String licencePlate;

    @Column
    private String color;

    @Column
    private VehicleType type;

}
