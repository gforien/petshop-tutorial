pragma solidity ^0.5.0;

contract Adoption {

    // addresses are 20-byte
    // public variables have automatic getters methods
    // Solidity is a compiled language: we need to compile Solidity to bytecode for the Ethereum Virtual Machine (EVM) 
    address[16] public adopters;

     
     /**
     * Adopt a pet.
     *
     * @param  petId between 0 and 15
     * @return petId
     */
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);

        // msg.sender = the address of the person or smart contract who called this function
        adopters[petId] = msg.sender;

        return petId;
    }


    /*
    * Returns the entire array of adopters (not native in Solidity).
    *
    * The view keyword in the function declaration means that this function will not modify the state of the contract.
    * The memory keyword gives the data location for the variable.
    *
    * @return array
    */
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }


}