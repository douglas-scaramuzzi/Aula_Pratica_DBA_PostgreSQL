# Aula Prática DBA PostgreSQL

Repositório de estudos práticos e avançados em **Administração** e **Otimização de Banco de Dados PostgreSQL**, baseado no currículo e tutoria de IA.

---

## 🎯 Objetivo Geral do Projeto

Aplicar as melhores práticas de **Database Administration (DBA)** no PostgreSQL, abrangendo:
* Instalação e Configuração de Ambiente.
* Otimização de Consultas e **Tuning de Performance**.
* Implementação de **Segurança** e Gerenciamento de Acesso.
* Rotinas de Backup e Recuperação.

---

## 🚀 Status e Últimas Atualizações

### 🔵 PASSO 1: Configuração do Ambiente (Concluído)

* **Data:** [03/11/2025]
* **Objetivo:** Instalação do Sistema Gerenciador de Banco de Dados (SGBD) e criação de um ambiente de prática funcional.

#### Ações Realizadas:
1.  **Instalação do SGBD:** Instalado o PostgreSQL (Versão 16) e o cliente gráfico pgAdmin 4.
2.  **Configuração de Acesso:** Definida a senha para o superusuário `postgres` e a porta de comunicação (`5432`).
3.  **Criação do Banco de Prática:** Criado o banco de dados `pratica_dba`.
4.  **Importação do Dataset Chinook:** Importado o conjunto de dados Chinook (loja de música) usando a linha de comando (`psql`) para carga de dados.

#### Desafios de DBA Enfrentados:
* **Violação de Chave Estrangeira (FK):** O script de importação original falhou devido à violação de integridade referencial.
* **Solução Aplicada:** Utilizada a técnica de DBA de **desativação temporária das Chaves Estrangeiras** (`SET session_replication_role = 'replica';`) na sessão de importação para permitir a carga total dos dados, seguida pela restauração da verificação (`'origin'`).

---

### 🟢 PASSO 2: Otimização e Tuning (Concluído)

* **Data:** [03/11/2025]
* **Objetivo:** Analisar e otimizar uma consulta de alto custo (`SELECT` em `track`, `album` e `genre` com filtros e ordenação) para eliminar a etapa de **Sort** (Ordenação).

#### Ações Realizadas:
1.  **Diagnóstico Inicial (Plano Original):** Executado `EXPLAIN ANALYZE` para identificar o gargalo de performance. O plano mostrou um alto custo na etapa de **Sort** (Ordenação).
2.  **Solução Implementada:** Criado um **Índice Composto** para cobrir os filtros e a ordenação.
    * **Comando DDL:** `CREATE INDEX idx_track_performance ON track (genre_id, milliseconds, bytes DESC);`
3.  **Validação de Desempenho:** Reexecutada a consulta com `EXPLAIN ANALYZE` (forçando o uso do índice com `SET enable_seqscan TO OFF`) para confirmar que a etapa de **Sort foi eliminada**, validando a solução de DBA.

**Artefatos Gerados:**
* `02_Desempenho_e_Ajuste/consulta_original.sql`: Consulta SQL alvo da otimização.
* `02_Desempenho_e_Ajuste/indice_composto_ddl.sql`: DDL do índice criado.
* `02_Desempenho_e_Ajuste/plano_original.txt`: Saída do `EXPLAIN ANALYZE` antes da otimização.

---

## 🛠️ Ambiente de Trabalho

* **SGBD:** PostgreSQL 16
* **GUI:** pgAdmin 4
* **Banco de dados:** `pratica_dba`
* **Esquema utilizado:** Banco de dados Chinook
