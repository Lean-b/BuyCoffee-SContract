// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;


contract Ownable {

    //Direcion del propietario
    address private owner;

    //Evento que se emite durante el cambio de propietario del smart contract
    event ChangeOwner(address indexed owner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
    }

    modifier OnlyOwner{
        require(msg.sender == owner,"La dirrecion no coincide con el propietario");
        _;
    }


    /**
     * @dev Funcion que intercambia el propietario del smart contract.
     * @param _newOwner Direcion del nuevo propietario.
     */
    function changeOwner(address _newOwner) public OnlyOwner{
        require(_newOwner != address(0),"La dirrecion no puede ser cero");
        emit ChangeOwner(owner, _newOwner);
        owner = _newOwner;
    }




    /**
     * @dev Funcion que llama la direccion del propietario
     * @return Devuelve la direccion 
     */
    function getOwner() public view OnlyOwner returns (address) {
        return owner;
    }
}