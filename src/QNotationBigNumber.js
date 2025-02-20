//  Get sqrtPriceX96 from token reserves
//  In scripts that use Javascript, we are limited by the size of numbers with a max of 9007199254740991. Since crypto 
//  handles everything in lowest decimal format, We have to use a version of BigNumber, allowing Javascript to handle 
//  numbers that are larger than the max.
//  Here we use a Pure BigNumber script from EthersJS along with BigNumber itself
//  you will also see us use JSBI is a pure-JavaScript implementation of the official ECMAScript BigInt proposal

import { BigNumber } from 'ethers'; // ← used to convert bn object to Ethers BigNumber standard 
import bn from 'bignumber.js'      //  ← here we use BigNumber pure to give us more control of precision
                                  //     and give access to sqrt function

//bn.config allows us to extend precision of the math in the BigNumber script
bn.config({ EXPONENTIAL_AT: 999999, DECIMAL_PLACES: 40 }) 
function encodePriceSqrt(reserve1, reserve0){
  return BigNumber.from(
    new bn(reserve1.toString()).div(reserve0.toString()).sqrt()
      .multipliedBy(new bn(2).pow(96))
      .integerValue(3)
      .toString()
  )
}

//Dont know how to run this code