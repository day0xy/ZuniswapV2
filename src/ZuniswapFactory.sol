// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

import "./ZuniswapV2Pair.sol";
import "./interfaces/IZuniswapV2Pair.sol";

contract ZuniswapV2Factory {
    error IdenticalAddresses();
    error PairExists();
    error ZeroAddress();

    address public feeTo;
    address public feeToSetter;

    event PairCreated(
        address indexed token0,
        address indexed token1,
        address pair,
        uint256
    );
    mapping(address => mapping(address => address)) public pairs;

    address[] public allPairs;

    function getPair(
        address tokenA,
        address tokenB
    ) external view returns (address pair) {
        return pairs[tokenA][tokenB];
    }

    function createPair(
        address tokenA,
        address tokenB
    ) external returns (address pair) {
        require(tokenA != tokenB, "ZuniswapV2Factory: Identical addresses");
        (address token0, address token1) = tokenA < tokenB
            ? (tokenA, tokenB)
            : (tokenB, tokenA);

        if (token0 == address(0) || token1 == address(0)) {
            revert ZeroAddress();
        }

        if (pairs[token0][token1] != address(0)) {
            revert PairExists();
        }

        bytes memory bytecode = type(ZuniswapV2Pair).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        assembly {
            pair := create2(0, add(bytecode, 32), mlod(bytecode), salt)
        }

        IZuniswapV2Pair(pair).initialize(token0, token1);

        pairs[token0][token1] = pair;
        pairs[token1][token0] = pair;
        allPairs.push(pair);

        emit PairCreated(token0, token1, pair, allPairs.length);
    }
}
