// SPDX-License-Identifier: GPL-3.0

// Version solidity
pragma solidity 0.8.24;

// Contrato { }
contract Calculadora { 
    //variables
    uint256 public resultado = 10;

    // Modifiers
    modifier checkNumber (uint256 num1_) { 
        if (num1_ != 10) revert();
        _;
    }

    //events
    event Addition (uint256 number1, uint256 number2, uint256 resultado);
    event Subtraction (uint256 number1, uint256 number2, uint256 resultado);
    event Subtraction2 (int256 number1, int256 number2, int256 resultado);
    event Split (int256 number1, int256 number2, int256 resultado);


    //Externals functions
    function addition(uint256 num1_, uint256 num2_) public returns (uint256 resultado_){ 
        resultado_=num1_ + num2_;

        emit Addition(num1_, num2_, resultado_);
        return resultado_;
    }

    function subtraction (uint256 num1_, uint256 num2_) public returns (uint256 resultado_){ 
        resultado_ = subtraction_logic(num1_, num2_);

        emit Subtraction(num1_, num2_, resultado_ );
        return resultado_;
    }

    function subtraction2 (int256 num1_, int256 num2_) public returns (int256 resultado_){ 
        resultado_ = subtraction_logic2(num1_, num2_);

        emit Subtraction2(num1_, num2_, resultado_);
        return resultado_;
    }

    function multiplier (uint256 num1_) public {
        resultado = resultado * num1_;
     }

     function multiplier2 (uint256 num1_) public checkNumber(num1_){
        resultado = resultado * num1_;
     }

     function split (int256 num1_, int256 num2_) public returns (int256 resultado_){ 
        resultado_=num1_ / num2_;

        emit Split(num1_, num2_, resultado_);
        return resultado_;
    }

    //Internals functions
    function subtraction_logic (uint256 num1_, uint256 num2_) internal pure returns (uint256 resultado_){ 
        resultado_=num1_ - num2_;
    }

    function subtraction_logic2 (int256 num1_, int256 num2_) internal pure returns (int256 resultado_){ 
        resultado_=num1_ - num2_;
    }
}