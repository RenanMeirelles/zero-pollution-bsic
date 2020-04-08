
# Main Functions of the ZeroPollution Smart Contracts

## CITIZEN CONTRACT:

### Write Functions

### addCitizen
>User Story - Register as a Citizen
Adds an Address to the Citizen Role in the Smart Contract (mapping)
Check if the Address is already a Checkpoint - to be defined
Citizen can add Name and E-mail if he wants - check the Gas use

## CHECKPOINT CONTRACT:
      
### addCheckpoint
>User Story - Register as a Checkpoint
Adds an Address to the Checkpoints Role in the Smart Contract (mapping)
Checks inf the Address is already a Citizen - to be defined
Needs mandatory information to confirm:
          - Name
          - Location (Zip Code) - Chek how the Dapp will return the location infos
          - Segment
   
      
### generateBagHash
>User Story - Request ZOPO Bags (Checkpoints)
Generates a list of hashes (1 per bag) with a QR Code
Register the hashes into a list in the Contract
Hashes are associated to a Checkpoint
The same quantity of Bags are minted in Tokens to the Checkpoint wallet
      
### checkoutBag
>User Story - Checkout ZOPO Bag
Função é chamada através da leitura do QR Code da Bag pelo Citizen
Valida a Hash da Bag se existe no contrato*
Se OK, associa a Hash da Bag ao Address do Citizen
Se NOK, não faz a transação
DApp deve travar a função de Checkout para o Citizen enquanto tiver uma "em aberto"

### checkinBag
>User Story - Checkin ZOPO Bag
Função é chamada através da leitura do QR Code da Bag pelo Checkpoint
Valida a Hash da Bag se existe no contrato* e se está associada ao Citizen
Se OK, confirma o Checkin e fica pendente para pesagem. Citizen não pode fazer nem Checkout nem Checkin
Se NOK, não faz a transação
DApp deve travar a função de Checkout para o Citizen enquanto tiver uma "em aberto"

### mintTokens
>User Story - Wheigh Collected Plastic
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

