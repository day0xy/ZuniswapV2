// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.10;

import "./interfaces/IZuniswapV2Factory.sol";
import "./interfaces/IZuniswapV2Pair.sol";
import "./ZuniswapV2Library.sol";

contract ZuniswapV2Router {
    error ExcessiveInputAmount();
    error InsufficientAAmount();
    error InsufficientBAmount();
    error InsufficientOutputAmount();
    error SafeTransferFailed();

    IZuniswapV2Factory public immutable factory;

    constructor(address _factory) {
        factory = IZuniswapV2Factory(_factory);
    }

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to
    ) public returns(uint256 amountA,uint256 amountB,uint256 liquidity){}
}
