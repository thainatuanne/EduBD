# EduBD - Banco de Dados Educacional

## 📌 Descrição
Banco de Dados PostgreSQL para gerenciamento de alunos, professores e turmas. Inclui tabelas relacionadas para armazenar informações de usuários, especialidades dos professores e matrículas de alunos em cursos.

## 🛠 Estrutura do Banco de Dados
O banco de dados contém as seguintes tabelas principais:

### 🔹 `alunos`
Armazena informações dos alunos cadastrados.
- `id` (SERIAL) - Identificador único (gerado automaticamente pela sequência `alunos_id_seq`).
- `nome` (VARCHAR 50) - Nome do aluno.
- `sobrenome` (VARCHAR 80) - Sobrenome do aluno.
- `cpf` (VARCHAR 11) - CPF único do aluno (com restrição `UNIQUE`).
- `ativo` (BOOLEAN) - Indica se o aluno está ativo.

### 🔹 `professores`
Armazena informações dos professores.
- `id` (SERIAL) - Identificador único (gerado automaticamente pela sequência `professores_id_seq`).
- `nome` (VARCHAR 50) - Nome do professor.
- `sobrenome` (VARCHAR 80) - Sobrenome do professor.
- `cpf` (VARCHAR 11) - CPF único do professor (com restrição `UNIQUE`).
- `especialidade` (ENUM `especialidadeprofessor`) - Especialidade do professor (Desenvolvedor, Cientista de Dados, UX/UI, Engenheiro de Dados).

### 🔹 `turmas`
Armazena informações das turmas disponíveis.
- `id` (SERIAL) - Identificador único (gerado automaticamente pela sequência `turmas_id_seq`).
- `nome` (VARCHAR 100) - Nome da turma (com restrição `UNIQUE`).
- `data_inicio` (DATE) - Data de início.
- `data_termino` (DATE) - Data de término.

### 🔹 `turmasalunos`
Relaciona alunos às turmas em que estão matriculados.
- `id` (SERIAL) - Identificador único (gerado automaticamente pela sequência `turmasalunos_id_seq`).
- `id_turma` (INTEGER) - ID da turma (com chave estrangeira `REFERENCES turmas(id) ON DELETE CASCADE`).
- `id_alunos` (INTEGER) - ID do aluno (com chave estrangeira `REFERENCES alunos(id) ON DELETE CASCADE`).

### 🔹 `turmasprofessor`
Relaciona professores às turmas que ministram.
- `id` (SERIAL) - Identificador único (gerado automaticamente pela sequência `turmasprofessor_id_seq`).
- `id_turma` (INTEGER) - ID da turma (com chave estrangeira `REFERENCES turmas(id) ON DELETE CASCADE`).
- `id_professor` (INTEGER) - ID do professor (com chave estrangeira `REFERENCES professores(id) ON DELETE CASCADE`).

## 🔑 Chaves e Restrições
- Cada CPF nas tabelas `alunos` e `professores` deve ser único.
- As tabelas `turmasalunos` e `turmasprofessor` possuem chaves estrangeiras vinculando alunos e professores às turmas, garantindo integridade referencial.
- As colunas `id` são geradas automaticamente através de sequências (`SEQUENCE`).

## 📊 Exemplo de Dados
### Alunos Cadastrados:
| ID | Nome           | Sobrenome       | CPF          | Ativo |
|----|--------------|----------------|------------|-------|
| 5  | Thainá       | Borges da Silva | 97461673000 | TRUE  |
| 6  | Jabel        | Martins         | 91461673001 | TRUE  |
| 7  | Gilmar       | Borges da Silva | 98461673020 | TRUE  |

### Professores Cadastrados:
| ID | Nome       | Sobrenome     | CPF          | Especialidade        |
|----|------------|--------------|------------|------------------|
| 1  | André     | Tadesco      | 82358634131 | Desenvolvedor    |
| 2  | Margarete | Auxiliadora  | 74837840590 | Cientista de Dados |
| 3  | Josué     | Abreu        | 55614325247 | UX/UI            |

## 🚀 Como Utilizar
1. Clone o repositório:  
   ```sh
   git clone https://github.com/thainatuanne/EduBD.git
   ```
2. Conecte-se ao PostgreSQL e importe o dump do banco:
   ```sh
   psql -U seu_usuario -d edudb -f edudb_dump.sql
   ```
3. Consulte os dados:
   ```sql
   SELECT * FROM alunos;
   ```

## 📌 Observações
Este banco de dados foi projetado para fins acadêmicos e pode ser expandido para incluir mais funcionalidades conforme necessário.

---
**Desenvolvido por Thainá Tuanne Borges da Silva** 📚
