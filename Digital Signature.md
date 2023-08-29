#tech  #security

---
# [How do you create a digital signature?](https://www.techtarget.com/searchsecurity/definition/digital-signature)

🥢 To create a digital signature, signing software -- such as an email program -- is used to provide a one-way hash of the electronic data to be signed.


☠️ If the decrypted hash matches a second computed hash of the same data, it proves that the data hasn't changed since it was signed. But, if the two hashes don't match, the data has either been tampered with in some way and is compromised or the signature was created with a private key that doesn't correspond to the public key presented by the signer. This signals an issue with authentication.

![[Pasted image 20230829214426.png]]