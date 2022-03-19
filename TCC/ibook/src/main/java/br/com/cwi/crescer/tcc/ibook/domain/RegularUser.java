package br.com.cwi.crescer.tcc.ibook.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "ib_regular_user")
public class RegularUser extends User {

    @Column
    private String cpf;

}
