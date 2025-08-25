# 🎓 Class Election Smart Contract

A Solidity-based smart contract that enables secure and transparent elections on the Ethereum blockchain.
This contract allows an admin to create an election, add candidates, and lets registered voters cast their votes. The system ensures fairness by preventing double voting and making results publicly verifiable.
---

## 📸 Project Preview
<img width="1440" height="900" alt="image" src="https://github.com/user-attachments/assets/2b8bcdef-36e2-4a42-b8a6-9cfc7a9d1190" />


---

## 🚀 Features
- ✅ Register students with **name** and **class ID**  
- ✅ Prevent duplicate registrations  
- ✅ Store immutable records on-chain  
- ✅ View registered student details  

---

## 🛠️ Tech Stack
- **Solidity** (Smart Contract Development)  
- **Remix IDE** (Deployment & Testing)  
- **Ethereum Blockchain** (EVM compatible networks)  

---

## 📂 Project Structure
```
├── contracts
│ └── ClassSelection.sol # Main smart contract
├── README.md # Project documentation
```


---

## 📜 Contract Functions

### `function AddCandidates(string memory _name)`
Registers a new student by storing their name and class ID.  

### `Candidates(Uint256 _Id)`
Fetches the details of a registered student.  

---

## ⚡ Deployment
1. Open [Remix IDE](https://remix.ethereum.org/)  
2. Create a new file `ClassSelection.sol` and paste the code  
3. Compile the contract with Solidity ^0.8.0  
4. Deploy using Remix VM / Injected Web3  

---

## 🔑 Usage Example
```solidity
// Register a student
registerStudent("Alice", 101);

// Get student details
getStudent(0x123...);
