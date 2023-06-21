const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

const provider = new ethers.providers.JsonRpcProvider("HTTP://127.0.0.1:7545");

// describe("Vault", function () {
//   async function start() {
//     const contract_address = "0x5552f14cBb82b914d194fd2A8c973409c0883d07";
//     console.log("Private Data :", contract_address);
//     const slot = 0; // add the storage slot of contract you want to access
//     provider.getStorageAt().then((contract_address, slot) => {
//       console.log("Private Data :", data);
//     });
//   }
// });
describe("Vault", function () {
  it("should return the correct value of myStorageVariable", async function () {
    // deploy the contract
    const Vault = await ethers.getContractFactory("Vault");
    const vault = await Vault.deploy(
      "0x66697273745f70617373776f7264000000000000"
    );
    await vault.deployed();

    const slot = 0;
    const data = await provider.getStorageAt(vault.address, slot);
    console.log("Private Data :", data);
    assert.equal(data, 123);
  });
});

// read the value of myStorageVariable
//const myStorageVariable = await vault.myStorageVariable();

// describe("Lock", function () {
//   // We define a fixture to reuse the same setup in every test.
//   // We use loadFixture to run this setup once, snapshot that state,
//   // and reset Hardhat Network to that snapshot in every test.
//   async function deployOneYearLockFixture() {

//     // Contracts are deployed using the first signer/account by default
//     const [owner, otherAccount] = await ethers.getSigners();

//     const Lock = await ethers.getContractFactory("Lock");
//     const lock = await Lock.deploy(unlockTime, { value: lockedAmount });

//     return { lock, unlockTime, lockedAmount, owner, otherAccount };
//   }

//   describe("Deployment", function () {
//     it("Should set the right unlockTime", async function () {
//       const { lock, unlockTime } = await loadFixture(deployOneYearLockFixture);

//       expect(await lock.unlockTime()).to.equal(unlockTime);
//   });
// });

// });
