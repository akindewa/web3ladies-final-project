<!-- 

A non-fungible token (NFT) is a unique digital identifier that is recorded on a blockchain and is used to certify ownership and authenticity. It cannot be copied, substituted, or subdivided.

## Goal 
I want an NFT collection where each token has its own name, description, and image. Only I (the owner) can create/mint new NFTs. -->


# Design Overview

The main goal of this contract is to implement an ERC-721 compliant NFT collection where each token carries unique metadata specifically 
- a name
- description, 
- and image URL. 

To maintain control over the collection, only the contract owner will be authorized to mint new tokens. 

## Metadata Strategy