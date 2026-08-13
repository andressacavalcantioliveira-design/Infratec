CREATE TABLE devolucoes (
    id_entrega INTEGER NOT NULL,
    id_funcionario INTEGER NOT NULL,
    id_epi INTEGER NOT NULL,
    data_devolucao DATE NOT NULL,
    quantidade INTEGER NOT NULL,
    estado VARCHAR(30) NOT NULL,
    CONSTRAINT pk_devolucoes
        PRIMARY KEY (id_entrega, id_funcionario, id_epi),
    CONSTRAINT fk_devolucao_entrega
        FOREIGN KEY (id_entrega)
        REFERENCES entregas(id_entrega),
    CONSTRAINT fk_devolucao_funcionario
        FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id),
    CONSTRAINT fk_devolucao_epi
        FOREIGN KEY (id_epi)
        REFERENCES epis(id_epi)
);