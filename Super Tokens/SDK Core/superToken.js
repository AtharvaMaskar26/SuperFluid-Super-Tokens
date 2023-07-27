import { Framework } from "@superfluid-finance/sdk-core";
import { ethers } from "ethers";


const provider = new ethers.providers.AlchemyProvider(
  "maticmum",
  "<API-KEY>"
);


const sf = await Framework.create({
  chainId: 80001,
  provider
});

const fDAIx = await sf.loadSuperToken("0x5D8B4C2554aeB7e86F387B4d6c00Ac33499Ed01f");

const getBalancefDAIx = async() => {
    const balance = await fDAIx.balanceOf({
        account: "0x2Ae018789D7f82FedfbfE221C1A8eD58E99511E8", 
        providerOrSigner: provider
    })

    return balance;
}

const getName = async() => {
    const name = await fDAIx.name({
        providerOrSigner: provider 
    })
    return name
}

const getAllowance = async() => {
    const allowance = await fDAIx.allowance({
        account: "0x2Ae018789D7f82FedfbfE221C1A8eD58E99511E8", 
        providerOrSigner: provider
    })

    return allowance
}

const getSymbol = async() => {
    const symbol = await fDAIx.symbol({
        providerOrSigner: provider
    })

    return symbol
}

const totalSupply = async() => {
    const supply = await fDAIx.totalSupply({
        providerOrSigner: provider
    })
    return supply
}

// Write Operations
const signer = sf.createSigner({ privateKey: "<PRIVATE-KEY>", provider });


const approveToken = () => {
    const approveOperation = fDAIx.approve({
        receiver: "0x6eba7Bd536557de0D0038905d7C0a4E0dCdd7ab1",
        amount: "1000000"
    });

    return approveOperation
}

const upgradeToken = async() => {
    const upgradeOperation = fDAIx.upgrade({ amount: "101351352417681378684864" });
    const txnResponse = await upgradeOperation.exec(signer);
    const txnReceipt = await txnResponse.wait();
}

const degradeToken = async() => {
    const degradeOperation = fDAIx.downgrade({amount: "777706"})
    const txnResponse = await degradeOperation.exec(signer);
    const txnReceipt = await txnResponse.wait();
}


approveToken();
console.log(await getBalancefDAIx())
await degradeToken();
console.log(await getBalancefDAIx())


