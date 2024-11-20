# Lab 1

-- Criação do schema na source
CREATE SCHEMA source AUTHORIZATION you;

-- Criação da tabela na source
CREATE TABLE source.vendas (
    id SERIAL PRIMARY KEY,
    data_venda DATE NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    produto VARCHAR(255) NOT NULL
);

-- Criação de Stored Procedure para carregar a tabela com dados aleatórios
CREATE OR REPLACE PROCEDURE source.carrega_dados_vendas()
LANGUAGE plpgsql
AS $$
BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO source.vendas (data_venda, quantidade, valor_unitario, produto)
        VALUES (
            NOW() - (RANDOM() * (NOW() - '2024-01-01'::date)),
            TRUNC(RANDOM() * 10 + 1),
            TRUNC((RANDOM() * 100 + 1)::numeric, 2),
            CASE TRUNC(RANDOM() * 5 + 1)
                WHEN 1 THEN 'Produto A'
                WHEN 2 THEN 'Produto B'
                WHEN 3 THEN 'Produto C'
                WHEN 4 THEN 'Produto D'
                WHEN 5 THEN 'Produto E'
            END
        );
    END LOOP;
END;
$$;

-- Executa a SP
CALL source.carrega_dados_vendas();

-- Verifica os dados
SELECT * FROM source.vendas;






