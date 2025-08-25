// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract ClassElection {
    // Candidate structure
    struct Candidate {
        string name;        // Candidate's name
        uint256 Id;         // Candidate's ID (array index)
        uint256 voteCount;  // Number of votes received
    }

    address public admin;       // Contract owner
    uint256 public totalVotes;  // Total number of votes cast

    constructor() {
        admin = msg.sender;     // Set deployer as admin
    }

    // Modifier to restrict functions to only the admin
    modifier onlyOwner() {
        require(msg.sender == admin, "You are not the owner");
        _;
    }

    Candidate[] public Candidates;           // List of all candidates
    mapping (address => bool) Voted;         // Track if an address has voted

    // Add a new candidate (only admin)
    function AddCandidates(string memory _name) public onlyOwner {
        Candidate memory newCandidate = Candidate({
            name: _name,
            Id: Candidates.length,
            voteCount: 0  // Start with zero votes
        });
        Candidates.push(newCandidate);
    }

    // Cast a vote for a candidate
    function Voting(address _addr, uint256 _Id) public {
        require(!Voted[msg.sender], "You have already voted"); 
        require(Voted[_addr] == false, "You have already voted"); // prevents double voting
        Voted[_addr] = true;
        Candidates[_Id].voteCount++;
        totalVotes++;
    }

    // Get vote count for a candidate (only admin)
    function VoteCount(uint _Id) public view onlyOwner returns(uint256) {
        require(_Id < Candidates.length, "Invalid candidate ID");
        return Candidates[_Id].voteCount;
    }

    // Find the winner (candidate with most votes)
    function CallWinner() public view returns(string memory Winnername, uint256 Winnervotes) {
        uint256 maxvotes = 0;
        uint256 winnerId = 0;

        for (uint i = 0; i < Candidates.length; i++) {
            if (Candidates[i].voteCount > maxvotes) {
                maxvotes = Candidates[i].voteCount;
                winnerId = i;
            }
        }

        // If no votes yet, return "No winner"
        if (totalVotes == 0) {
            return ("No winner", 0);
        }

        return (Candidates[winnerId].name, Candidates[winnerId].voteCount);
    }
}
