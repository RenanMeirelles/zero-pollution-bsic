pragma solidity ^0.5.0;


contract CitizenContract {

    struct Citzen {
        bool exists;
        string name;
        string email;
    }

    mapping (address => Citzen) _citzens;


    address[] public _citzensAccts;

    function isCitzen(address citzenAddress) public view returns (bool) {
        Citzen storage citzen = _citzens[citzenAddress];
        return citzen.exists;
    }

    function addCitzen(string memory name, string memory email) public returns(bool) {

        Citzen storage newCitzen = _citzens[msg.sender];
        newCitzen.name = name;
        newCitzen.email = email;
        newCitzen.exists = true;

        _citzensAccts.push(msg.sender) -1;
        return true;
    }

    function getCitzen(address citzenAddress)
    public
    view
    returns (string memory name, string memory email) {
        Citzen storage citzen = _citzens[citzenAddress];
        return (citzen.name, citzen.email);
    }


}
