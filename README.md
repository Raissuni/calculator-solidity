🧮 Calculator Smart Contract

📝 Overview

The Calculator Smart Contract is a Solidity-based smart contract designed to perform basic arithmetic operations on the Ethereum blockchain. It follows clean architecture principles by separating pure calculation logic from user-facing functions, using modifiers for validation, and emitting events for transparent transaction logging.

This contract supports addition, subtraction (with both uint256 and int256), multiplication with persistent state, and division of signed integers. It is ideal for beginners learning Solidity or developers exploring smart contract structure, event handling, and modifiers.

🚀 Features
Feature	Description
Basic Arithmetic	Supports addition, subtraction (unsigned and signed), multiplication, and division.
Logic Separation	Internal pure functions isolate the calculation logic.
Input Validation	Includes a modifier (checkNumber) to validate inputs before executing certain operations.
Event Logging	Emits events for every operation to provide full transparency on-chain.
Persistent State	Maintains a variable (resultado) that can be updated through multiplication operations.
📜 Smart Contract Details
⚙️ Modifiers
Modifier	Description
checkNumber(uint num1_)	Ensures that num1_ equals 10 before executing the operation. If not, the transaction reverts. Used in multiplier2.
📡 Events

Each arithmetic operation emits an event with the inputs and computed result, allowing easy tracking in transaction logs.

Event	Description
Addition	Triggered when adding two numbers.
Subtraction	Triggered when subtracting two unsigned integers.
Subtraction2	Triggered when subtracting signed integers using int256.
Split	Triggered when dividing two signed integers.
💻 Contract Functions

The contract is divided into public functions (user interface) and internal pure functions (core logic).

🔹 External Functions (User Interface)
Function	Visibility	Description
addition(uint num1, uint num2)	public	Returns the sum of two values and emits the Addition event.
subtraction(uint num1, uint num2)	public	Performs a subtraction of unsigned integers using internal logic.
subtraction2(int num1, int num2)	public	Performs subtraction using signed integers and emits Subtraction2.
multiplier(uint num1)	public	Multiplies the state variable resultado by num1.
multiplier2(uint num1)	public	Same as multiplier, but requires num1 to equal 10 (enforced by checkNumber).
split(int num1, int num2)	public	Divides two signed integers and emits Split.
resultado()	public view	Reads the current stored value of resultado.
🔹 Internal Functions (Pure Logic)

These functions contain the mathematical logic without modifying contract state.

Function	Visibility	Description
subtraction_logic(uint num1, uint num2)	internal pure	Pure subtraction logic for unsigned integers.
subtraction_logic2(int num1, int num2)	internal pure	Pure subtraction logic for signed integers.
🛠️ How to Use
🔧 Prerequisites

Environment: Remix IDE (recommended)

Compiler: Solidity 0.8.24

Optional: Hardhat or Foundry for local deployment and testing

🚀 Deployment Steps

Open Remix IDE.

Create a new file named Calculadora.sol.

Paste the contract code.

Compile using Solidity 0.8.24.

Deploy the contract under the Deploy & Run Transactions panel.

Select the desired environment (Remix VM, Injected Provider, etc.).

🖱️ Interacting with the Contract (Example)

Example execution sequence:

Initial value of resultado is 10.

Call multiplier(2) → resultado becomes 20.

Call addition(5, 3) → returns 8 (this does not update resultado).

Call multiplier2(10) → valid (resultado becomes 200).

Calling multiplier2(8) → ❌ will revert due to the checkNumber modifier.

Call split(20, 5) → returns 4.

📦 Event Logging Example

Calling:

subtraction(15, 5)


will emit:

Subtraction(number1: 15, number2: 5, resultado: 10)


Events can be viewed inside Remix or on Etherscan when deployed to a public network.

📄 License

This project is released under the GPL-3.0 License.
