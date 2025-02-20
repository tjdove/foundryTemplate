// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Ecoding {
    function encodeNumber() public pure returns (bytes memory) {
        bytes memory number = abi.encode(1);
        return number;
    }

    function encodeString() public pure returns (bytes memory) {
        bytes memory someString = abi.encode("Some String");
        return someString;
    }

    function encodeStringBytes() public pure returns (bytes memory) {
        bytes memory someString = bytes("Some String");
        return someString;
    }

    function decodeString() public pure returns (string memory) {
        //bytes memory someString = abi.encode("Some String");
        string memory decodedString = abi.decode(encodeString(), (string));
        return decodedString;
    }

    function multiEncode() public pure returns (bytes memory) {
        bytes memory someString = abi.encode("Some String2", "Larger!");
        return someString;
    }

    function multiDecode() public pure returns (string memory, string memory) {
        (string memory someString, string memory someOtherString) = abi.decode(
            multiEncode(),
            (string, string)
        );
        return (someString, someOtherString);
    }

    function multiEncodePacked() public pure returns (bytes memory) {
        bytes memory someString = abi.encodePacked("Some String2", "Larger!");
        return someString;
    }

    function multiDecodePacked() public pure returns (string memory) {
        string memory someString = abi.decode(multiEncodePacked(), (string));
        return someString;
    }

    function multiStringCastPacked() public pure returns (string memory) {
        string memory someString = string(multiEncodePacked());
        return someString;
    }

    // Callll the functions themselves in transaction call

    //To send transaction, need:
    //ABI
    //Contract address
    //How do we send transaction that call functions with just datafield populated?
    //HOw do populate the data field

    //Low level fields - staticcall and call
    //call: How we call functions to change the state of the blockchain.
    //staticcall: This is how(at a low level) we do our "view" or "pure" cuntiion calls and potentially dont change the blockchain.

    // function withdraw(address recentWinner) public {
    //     (bool success, ) = recentWinner.call({value: address(this).balance}(""));
    //     return(success, "Transfer failed");
    // }

    // Transaction: Function call
    // Nonce: tx count for the account
    // Gas Limit: max gas the tx can use
    // Gas price: price per unit of gas in wei
    // To: address that the tx is sent to
    // Value: amount of wei to send
    // Data: what to send to the address
    // v, r, s: components of the signature

    // Transaction: Function call
    // Nonce: tx count for the account
    // Gas Limit: max gas the tx can use
    // Gas price: price per unit of gas in wei
    // To: address that the tx is sent to
    // Value: amount of wei to send
    // Data: what to send to the address
    // v, r, s: components of the signature
}
