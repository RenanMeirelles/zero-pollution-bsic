
# Main Functions of the ZeroPollution Contract

## Write Functions

### addCitizen
      User Story - Register as a Citizen
      Adiciona um Address à role de Citizen
      Verifica se o Address já é um Checkpoint - Confirmar
      Permite adicionar Nome e E-mail - para isso precisaria gastar Gas
      
### addCheckpoint
      User Story - Register as a Checkpoint
      Adiciona um Address à role de Checkpoint
      Verifica se o Address já é um Citizen - Confirmar
      Solicita o preenchimento de informações obrigatórias como:
          - Name
          - Location (zip code? address?) - Verificar como o DApp consultará os Checkpoints por Localização
          - Segment
          - Stake - optional
    
## generateBagHash
      User Story - Request ZOPO Bags (Checkpoints)
      Gera uma lista de Hashes com um QR Code para cada Bag
      Grava essas hashes numa lista de bags do Contrato (geral)*
      Associa essas Hashes a um Address de um Checkpoint (distribuidor)
      
### checkoutBag
      User Story - Checkout ZOPO Bag
      Função é chamada através da leitura do QR Code da Bag pelo Citizen
      Valida a Hash da Bag se existe no contrato*
      Se OK, associa a Hash da Bag ao Address do Citizen
      Se NOK, não faz a transação
      DApp deve travar a função de Checkout para o Citizen enquanto tiver uma "em aberto"

### checkinBag
      User Story - Checkin ZOPO Bag
      Função é chamada através da leitura do QR Code da Bag pelo Checkpoint
      Valida a Hash da Bag se existe no contrato* e se está associada ao Citizen
      Se OK, confirma o Checkin e fica pendente para pesagem. Citizen não pode fazer nem Checkout nem Checkin
      Se NOK, não faz a transação
      DApp deve travar a função de Checkout para o Citizen enquanto tiver uma "em aberto"

### mintTokens
      User Story - Wheigh Collected Plastic
      Processo deverá ser feito manualmente no início. Após Checkin confirmado, Checkpoint pesará a Bag com o Conteúdo Plástico.
      Função deverá ser chamada manualmente pelo Checkpoint - "Mint Citizen Tokens"
      Checkpoint deverá informar a quantidade de Tokens a ser emitidos
      Contrato deverá chamar o Contrato do ZOPO Token para fazer o Mint - verificar se Checkpoint terá permissão do Mint
      

## Read Functions

### isCheckpoint

### isCitizen

### citizenBags

### checkpointBags

...
