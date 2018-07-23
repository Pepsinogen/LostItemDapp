# Quickstart
Quick start for dApps project

# Set up project
```
git clone https://github.com/ookimaki/ethereum_dapps_quickstart.git
cd ethereum_dapps_quickstart
npm install
```

# Replace mnemonic & infura_access_token file

   ## mnemonic
Replace mnemonic file "Put your mnemonic here" to your mnemonic

   ## infura_access_token
Replace infura_access_token file "Put your infura access token here" to your infura access token here

# Migrate
   - Ropsten
```
truffle migrate --network ropsten
```

   - Rinkeby
```
truffle migrate --network rinkeby
```

   - Mainnet
```
truffle migrate --network live
```

   - Use truffle.cmd instead of truffle for Windows OS
```
truffle.cmd migrate
```
