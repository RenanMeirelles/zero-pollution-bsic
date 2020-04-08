
# Main Functions of the ZeroPollution Smart Contracts

## To test the Smart Contracts
>If you want to run the smart contracts, copy the code of each one (Citizen.sol / Checkpoint.sol). 
Then, go to the https://remix.ethereum.org/
Create a new file (+) and paste the code.
Check if your versions are OK. Check if you have Metamask installed in your Browser (extension).
Check if you have the plugins installed in the Remix - if not, go to the Plugins tab and add the Compiler and Deployer.
Compile the Code, and Deploy using the Injected Web3 option - you will have to sign the transaction and wait.
After the transaction is confirmed, you can explore the Contracts functions!

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
Function is called trhough the ZOPO bags QR Code scanned (and confirmed)
Checks if the hash is valid and exists in the SmartContract
If its OK, associates the bag address to the Citizens address
If NOK, transaction is not completed
DApp must lock the checkout funciont to the Citizen while the Check in is not completed

### checkinBag
>User Story - Checkin ZOPO Bag
Function is called through the bags QR Code scanning by the Checkpoint
Checks if the hash is valid and exists in the contract, and if the bag is associated with the right Citizen address
If OK, confirms the Check in and is able to transfer/mint tokens or pay the bounty
If NOK, transaction is not completed
DApp must lock the Check out function for the Citizen while the check in is not completed

      

## Read Functions

### isCheckpoint

### isCitizen

### citizenBags

### checkpointBags

...


