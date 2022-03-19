package br.com.cwi.crescer.tcc.ibook.repository;

import br.com.cwi.crescer.tcc.ibook.domain.Offer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OfferRepository extends JpaRepository<Offer, Integer> {
}
