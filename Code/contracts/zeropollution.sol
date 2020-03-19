pragma solidity 0.5.10;
pragma experimental ABIEncoderV2;

contract Zopo {
    
    struct Checkpoint {
        address payable checkpointAddress;
        uint reputation;
        uint price;
        bool exists;
    }
    
    struct Citizen {
        address payable personalAddress;
        uint pendingDataDeliver;
        bool exists;
        mapping(string => Info) personalInfo;
        string[] fields;        
    }


    

    function addCitizen(uint _infoCode, DataCategory _dataCategory, string memory _field, string memory _data, uint _price) 
        public
        returns (bool)
    {
        require(_price >= 0, "You must inform correct value");
        Persona storage p = members[msg.sender];
        p.personalAddress = msg.sender;
        p.pendingDataDeliver = 0;
        p.exists = true;
        p.fields.push(_field);
        
        Info storage i = p.personalInfo[_field];
        i.infoCategoryCode = _infoCode;
        i.dataCategory = _dataCategory;
        i.field = _field;
        i.data = _data;
        i.price = _price;
        i.exists = true;
        i.lastStatus = ValidationChoices.NewData;
        
        emit NewData(msg.sender, _dataCategory, _infoCode, _field);
        return true;
    }
    
    
    function addCheckpoint(ValidationCostStrategy _strategy, uint _price) 
        public
        payable 
        returns (bool)
    {
        require(msg.value >= 1 ether, "You have to pay 1 ether to become a validator");
        Persona memory p = members[msg.sender];
        require(p.exists, "You must be a persona within Holon to become a validator");
        holonValidators[msg.sender] = Validator(msg.sender, 0, _strategy, _price, true);
        holonValidatorsList.push(msg.sender);
        return true;
    }
    

    
    function checkoutBag(address _validator, string memory _field,string memory _proofUrl) 
        public
        payable
        returns (bool)
    {
        Validator memory v = holonValidators[_validator];
        require(v.exists, "Validator informed is not registered");
        // require(correctPrice(v.strategy, msg.value), "You must send a correct value"); DON'T REMOVE!!!


        Persona storage persona = members[msg.sender];
        require(persona.exists, "Persona not found");

        if (v.strategy == ValidationCostStrategy.Charged) {
            require(msg.value >= v.price, "Invalid Value");
            v.validatorAddress.transfer(msg.value);
        }

        Info storage fieldInfo = persona.personalInfo[_field];
        require(fieldInfo.exists, "Persona field not found");

        fieldInfo.lastStatus = ValidationChoices.ValidationPending;
        Stamp memory pendingStamp = Stamp(msg.sender, fieldInfo.lastStatus, block.timestamp, block.number);
        fieldInfo.validations.push(pendingStamp);
        
        emit ValidateMe(msg.sender, _validator, fieldInfo.dataCategory, _field, fieldInfo.data, _proofUrl);
        return true;
    }

    function GetFieldLastStatus(string memory _field)
        public
        view
        returns (ValidationChoices)
        {        
            Persona storage persona = members[msg.sender];
            require(persona.exists, "Persona not found");

            Info storage fieldInfo = persona.personalInfo[_field];
            require(fieldInfo.exists, "Persona field not found");

            return fieldInfo.lastStatus;
        }

    function validate(address _persona, string memory _field, ValidationChoices _status) 
        public
        payable
        returns (bool)
    {
        Validator storage v = holonValidators[msg.sender];
        Persona storage p = members[_persona];
        Info storage i = p.personalInfo[_field];
        address payable ppp = p.personalAddress;

        // if (v.strategy == ValidationCostStrategy.Rebate) {
        //     require(msg.value >= i.price, "You must send a correct value");
        // } DON'T REMOVE!!!
        i.lastStatus = _status;
        i.validators[msg.sender] = v;
        Stamp memory s = Stamp(msg.sender, _status, block.timestamp, block.number);
        i.validations.push(s);
        emit ValidationResult(_persona, msg.sender, _field, _status);
        if (_status == ValidationChoices.CannotEvaluate) {
            return true;
        }
        if (v.strategy == ValidationCostStrategy.Rebate) {
            ppp.transfer(msg.value);
        }
        if (_status == ValidationChoices.Validated) {
            i.reputation++;
        }
        v.reputation++;
        return true;
    }
    

    function GetRequestedFields()
    public
    view
    returns (address[] memory, string[] memory, string[] memory)
    {
      
        }

        return (zzzzAddress, zzzzName, fields);
    }


    function getTotalCheckpoints()
        public
        view
        returns (uint) 
    {        
        return checkpointsList.length;
    }
}