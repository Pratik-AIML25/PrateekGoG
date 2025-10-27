const hre = require("hardhat");

async function main() {
  const initialSupply = 1000000; // 1 million tokens
  const Project = await hre.ethers.getContractFactory("Project");
  const project = await Project.deploy(initialSupply);

  await project.waitForDeployment();

  console.log("✅ Cryptera Network deployed to:", await project.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("❌ Deployment failed:", error);
    process.exit(1);
  });
