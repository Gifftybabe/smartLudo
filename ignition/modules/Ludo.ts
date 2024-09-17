const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("SmartLudoModule", (m) => {


  const Ludo = m.contract("SmartLudo");

  return { Ludo };
});