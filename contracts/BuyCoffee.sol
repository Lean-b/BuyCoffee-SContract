// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import "./Ownable.sol";
contract BuyCoffee is Ownable{
    
    //Estructura del mensaje para comprar un cafe.
    struct Box {
        address from;
        uint256 time;
        string name;
        string message;
    }

    //Array para almacenar los mensajes
    Box[] box;

    //Evento a emitir cuando se compra un cafe
    event NewMessage(
        address indexed from,
        uint256 time,
        string name,
        string message
    );

    constructor() {}

    /**
     * @dev Funcion para comprar un cafe.
     * @param _name entrada del nombre del comprador.
     * @param _message entrada del mensaje a enviar.
     */
    function buyCoffer(
        string memory _name,
        string memory _message
    ) public payable {
        require(msg.value > 0, "No puede compra cafe sin pagar xD");

        box.push(Box(msg.sender, block.timestamp, _name, _message));

        emit NewMessage(msg.sender, block.timestamp, _name, _message);
    }

    /**
     * @dev Funcion para ver los mensajes almacenado en el array.
     * @return Devuelve el array con los mensajes almacenado en Box.
     */
    function getBox() public view returns (Box[] memory) {
        return box;
    }

    /**
     * @dev Funcion para el retiro de ether.
     */
    function withdrawCoffee() public OnlyOwner {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }



    /**
     * @dev Funcion para saber el balance de ether en el smart contract.
     * @return Devuelve el balance en ether como un valor de tipo uint256.
     */
    function getBalance() public view  OnlyOwner returns (uint256) {
        return address(this).balance;
    }



  
}
