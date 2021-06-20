Remove metas cadastradas:

Scenario: Aviso de remover meta com avaliações
    Given Estou na página de metas
    And possui uma meta  ‘requisitos’
    And a meta ‘requisitos’ já foi avaliada pelo professor e alunos
    When tento remover essa meta
    Then Aparece um aviso na tela “essa meta já foi avaliada, tem certeza que deseja excluir?”

Scenario: Aviso de remover única meta da turma
    Given Estou na página de metas
    And possui apenas a meta  ‘elicitação’
    When tento remover 'elicitação'
    Then Aparece um aviso na tela “essa é a única meta da turma, tem certeza que deseja excluir?”

Scenario: Remover única meta da turma
    Given Tem apenas a meta ‘gerenciameto’ associada a turma ‘4 periodo’
    When Eu tento remover a meta ‘gerenciamento’
	Then retorna um erro de única meta cadastrada

Scenario: Remover meta inválida
	Given Estou na página de metas
    When Tento remover uma meta pelo nome ‘design’
    Then O sistema retorna  um erro de meta não existente.

Scenario: Falha ao remover metas
    Given Estou na página de metas
    And possui uma meta  ‘requisitos’
    When tento remover a meta 'requisitos'
    Then a meta 'requisitos' continua na lista de metas
    And a meta 'requisitos' ainda possui todas avaliações

Scenario: Remover metas com sucesso
    Given Estou logado em 'admin'.
    And Estou na página de metas.
    And possui algumas metas e uma meta 'Desenvolvimento’.
    When Tento remover a meta 'Desenvolvimento'.
    Then A meta 'Desenvolvimento' nao aparece mais na lista de metas.
