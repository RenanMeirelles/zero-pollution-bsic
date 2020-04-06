pragma solidity ^0.5.0;


contract CheckpointContract {

    struct Checkpoint {
        bool exists;
        string name;
        string segment;
        string zipcode;
    }

    mapping (address => Checkpoint) _checkpoints;


    address[] public _checkpointsAccts;

    function isCheckpoint(address checkpointAddress) public view returns (bool) {
        Checkpoint storage checkpoints = _checkpoints[checkpointAddress];
        return checkpoints.exists;
    }

    function addCheckpoint(string memory name, string memory segment, string memory zipcode) public returns(bool) {

        Checkpoint storage newCheckpoint = _checkpoints[msg.sender];
        newCheckpoint.name = name;
        newCheckpoint.segment = segment;
        newCheckpoint.zipcode = zipcode;
        newCheckpoint.exists = true;

        _checkpointsAccts.push(msg.sender) -1;
        return true;
    }

    function getCheckpoint(address checkpointAddress)
    public
    view
    returns (string memory name, string memory segment, string memory zipcode) {
        Checkpoint storage checkpoint = _checkpoints[checkpointAddress];
        return (checkpoint.name, checkpoint.segment, checkpoint.zipcode);
    }

}
