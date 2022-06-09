# Funcionalidades do app Dojo

## Cadastro de Alunos
Cada aluno deve possuir um nome e matrícula.

### Requisitos Obrigatórios
1- Nome e Matrícula serão obrigatórios
2- Nome só pode aceitar letras
3- Matrícula só pode aceitar números
4- Matrícula deverá ser única.
5- Salvar dados em uma Lista
6- Fazer cobertura de Testes para criação do Aluno.

## Selecionar Piloto e Copiloto
Função que recebe uma lista não vazia de alunos e dentre eles faz uma seleção de piloto e copiloto, priorizando os que tiverem menos participações, que farão parte do DOJO, em que após eles realizarem suas funções poderão voltar para a lista e novamente participar.

### Requisitos Obrigatórios**

- Recebe Lista Alunos (Nome e Quantidade participação)
- Filtrar para chamar primeiro quem tem menos participação
- Selecionar PILOTO primeiro. Caso não haja um prévio copiloto, selecionar da lista filtrada
  - Copiloto em seguida, selecionado da lista filtrada
- Piloto só é chamado da lista na primeira vez de cada sessão, nas seguintes, o copiloto vira piloto
- Terá que ter alunos, pelo menos 2 cadastrados, caso tenha menos não pode escolher, deverá ser informado uma mensagem de erro.

## Timer

Cronometrar tempo de cada sessão
- Medida em minutos
- Start: cronometro marcando 3 minutos
- Tempo min: 3 minutos
- Tempo max: 6 minutos
- Emitir alerta sonoro ao atingir o tempo mínimo de 3 minutos
- Tempo padrão de 3 minutos
- Poder dar stop no timer em andamento
- Poder dar pause no timer em andamento
- Poder dar resume no timer pausado

## Cenários

### Falhas

1. Quando passar tempo menor que 3 minutos
  - Deverá mostrar uma mensagem de erro
  - Poderá emitir um erro sonoro
2. Quando passar tempo com valor que não seja inteiro
  - Deverá mostrar uma mensagem de erro
  - Poderá emitir um erro sonoro
3. Quando passar tempo maior que 6 minutos
  - Deverá mostrar uma mensagem de erro
  - Poderá emitir um erro sonoro
4. Quando chamar o método parar quando o timer não foi iniciado
  - Deverá mostrar uma mensagem de erro
  - Poderá emitir um erro sonoro
5. Quando chamar o método pausar quando o timer não foi iniciado
  - Deverá mostrar uma mensagem de erro
  - Poderá emitir um erro sonoro
6. Quando chamar o método resumir quando o timer não foi iniciado
  - Deverá mostrar uma mensagem de erro
  - Poderá emitir um erro sonoro

### Sucesso

1. Quando passar o tempo entre 3 ou 6 minutos ( tempo >= 3 && tempo <= 6)
  - Deverá mostrar o tempo correndo
2. Quando passar um tempo válido e o tempo acabar
  - Deverá mostrar que o tempo finalizou
  - Deverá emitir um efeito sonoro de sucesso
3. Quando não passa o tempo
  - Deverá utilizar o tempo padrão de 3 minutos
  - Deverá mostrar que o tempo finalizou
  - Deverá emitir um efeito sonoro de sucesso
4. Quando chamar o método parar
  - Deverá parar o tempo do cronômetro
5. Quando chamar o método pause
  - Deverá pausar o tempo do cronômetro
6. Quando chamar o método resumir
  - Deverá resumir o tempo do cronômetro