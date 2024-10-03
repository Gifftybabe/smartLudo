import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const LudoModule = buildModule("LudoModule", (m) => {

  const ludo = m.contract("MyLudoGame");

  return { ludo };
});

export default LudoModule;