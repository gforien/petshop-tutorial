pragma solidity^0.5.0;

import '../contracts/Adoption.sol';
// referring to global Truflle directory
import 'truffle/Assert.sol';
import 'truffle/DeployedAddresses.sol';

contract AdoptionTest {

    Adoption testContract = Adoption(DeployedAddresses.Adoption());
    uint expectedPetId = 8;
    address expectedAdopter = address(this);

    // ALL test function names must begin by test in order to be run


    // testing the function adopt()
    function testAdopt() public {
        uint result = testContract.adopt(expectedPetId);

        Assert.equal(result, expectedPetId, "Should be the adopted pet id");
    }

    // testing if the pet has actually been adopted
    function testGetAdopter() public {
        address result = testContract.adopters(expectedPetId);          // we use the built-in getter

        Assert.equal(result, expectedAdopter, "Should be the expected adopter");
    }


    // test for function getAdopters()
    function testGetAdopters() public {
        address[16] memory result = testContract.getAdopters();

        Assert.equal(result.length, 16, "Should be an array of size 16");
        Assert.equal(result[expectedPetId], expectedAdopter, "Should be the expected adopter");
    }
}