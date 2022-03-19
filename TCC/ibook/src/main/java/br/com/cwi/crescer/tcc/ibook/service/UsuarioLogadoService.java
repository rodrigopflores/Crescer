package br.com.cwi.crescer.tcc.ibook.service;

import br.com.cwi.crescer.tcc.ibook.security.UsuarioAutenticado;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;


@Service
public class UsuarioLogadoService {

    public UsuarioAutenticado get() {
        return (UsuarioAutenticado) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
