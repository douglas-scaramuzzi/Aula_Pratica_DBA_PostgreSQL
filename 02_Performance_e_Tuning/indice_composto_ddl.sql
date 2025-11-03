-- Comando DDL para otimizar consultas que filtram por gênero, duração e ordenam por tamanho (bytes).
-- Criado para eliminar a operação de 'Sort' (Ordenação) em consultas de alto custo.

CREATE INDEX idx_track_performance
ON track (
    genre_id,
    milliseconds,
    bytes DESC
);
