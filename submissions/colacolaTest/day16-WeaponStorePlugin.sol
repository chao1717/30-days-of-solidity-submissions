pragma solidity ^0.8.0;
contract WeaponStorePlugin {

    mapping(address => string) public equippedWeapon;

    function setWeapon(address user, string memory weapon) public {
        equippedWeapon[user] = weapon;
    }

    function getWeapon(address user) public view returns(string memory) {
        require(user != address(0), "Invalid address");
        return equippedWeapon[user];
    }
}
