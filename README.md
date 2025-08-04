# RC-4-File-String-Crypter:

RC4 is a stream cipher and variable-length key algorithm. This algorithm encrypts one byte at a time (or larger units at a time). A key input is a pseudorandom bit generator that produces a stream 8-bit number that is unpredictable without knowledge of the input key, The output of the generator is called key-stream, and is combined one byte at a time with the plaintext stream cipher using X-OR operation.



![RC-4 File   String Crypter](https://github.com/user-attachments/assets/8b2e58b0-2e01-4aa3-bd1e-5f1f0385471a)



Example:

RC4 Encryption
>10011000 ? 01010000 = 11001000

RC4 Decryption
>11001000 ? 01010000 = 10011000

Key-Generation Algorithm
A variable-length key from 1 to 256 bytes is used to initialize a 256-byte state vector S, with elements S[0] to S[255]. For encryption and decryption, a byte k is generated from S by selecting one of the 255 entries in a systematic fashion, then the entries in S are permuted again.

Key-Scheduling Algorithm
Initialization:

The entries of S are set equal to the values from 0 to 255 in ascending order, and a temporary vector T, is created. If the length of the key k is 256 bytes, then k is assigned to T. Otherwise, for a key with length (k-len) bytes, the first k-len elements of T as copied from K, and then K is repeated as many times as necessary to fill T. The idea is illustrated as follows:

```
// Initialize S with values from 0 to 255
 for i = 0 to 255 do
 S[i] = i;
 T[i] = K[i mod keylen];
```

We use T to produce the initial permutation of S. Starting with S[0] to S[255], and for each S[i] algorithm swap it with another byte in S according to a scheme dictated by T[i], but S will still contain values from 0 to 255 : 

```
// C++
int j = 0;
for (int i = 0; i <= 255; i++) {
    j = (j + S[i] + T[i]) % 256;
    swap(S[i], S[j]); // Swap S[i] and S[j]
}
```

```
// Java
j = 0;
for
    i = 0 to 255 do
    {
        j = (j + S[i] + T[i])mod 256;
        Swap(S[i], S[j]);
    }
```

```
// Python
j = 0
for i in range(256):
    j = (j + S[i] + T[i]) % 256
    S[i], S[j] = S[j], S[i]  # Swap S[i] and S[j]
```

```
// C#
for (int i = 0; i < 256; i++) {
j = (j + S[i] + T[i]) % 256;
int temp = S[i];
S[i] = S[j];
S[j] = temp;
}
```

```
let j = 0;
for (let i = 0; i <= 255; i++) {
    j = (j + S[i] + T[i]) % 256;
    [S[i], S[j]] = [S[j], S[i]]; // Swap S[i] and S[j]
}
```

Pseudo Random Generation Algorithm (Stream Generation)
Once the vector S is initialized, the input key will not be used. In this step, for each S[i] algorithm swap it with another byte in S according to a scheme dictated by the current configuration of S. After reaching S[255] the process continues, starting from S[0] again 

```
// JavaScript
i, j = 0;
while (true) {
    i = (i + 1) mod 256;
    j = (j + S[i]) mod 256;
    swap(S[i], S[j]);
    t = (S[i] + S[j]) mod 256;
    k = S[t];
}
```

News: In September 2015, Microsoft announced the end of using RC4 in Microsoft edge and internet explorer 11. This video gives a clear example of RC4 algorithm.

### Features of the RC4 Encryption Algorithm
Symmetric key algorithm: RC4 is a symmetric key encryption algorithm, which means that the same key is used for encryption and decryption.
Stream cipher algorithm: RC4 is a stream cipher algorithm, which means that it encrypts and decrypts data one byte at a time. It generates a key stream of pseudorandom bits that are XORed with the plaintext to produce the ciphertext.
Variable key size: RC4 supports variable key sizes, from 40 bits to 2048 bits, making it flexible for different security requirements.
Fast and efficient: RC4 is a fast and efficient encryption algorithm that is suitable for low-power devices and applications that require high-speed data transmission.
Widely used: RC4 has been widely used in various applications, including wireless networks, secure sockets layer (SSL), virtual private networks (VPN), and file encryption.
Vulnerabilities: RC4 has several vulnerabilities, including a bias in the first few bytes of the keystream, which can be exploited to recover the key. As a result, RC4 is no longer recommended for use in new applications.

### Advantages
Fast and efficient: RC4 is a very fast and efficient encryption algorithm, which makes it suitable for use in applications where speed and efficiency are critical.
Simple to implement: RC4 is a relatively simple algorithm to implement, which means that it can be easily implemented in software or hardware.
Variable key size: RC4 supports variable key sizes, which makes it flexible and adaptable for different security requirements.
Widely used: RC4 has been widely used in various applications, including wireless networks, secure sockets layer (SSL), virtual private networks (VPN), and file encryption.

### Disadvantages
Vulnerabilities: RC4 has several known vulnerabilities that make it unsuitable for new applications. For example, there is a bias in the first few bytes of the keystream, which can be exploited to recover the key.
Security weaknesses: RC4 has some inherent weaknesses in its design, which make it less secure than other encryption algorithms, such as AES or ChaCha20.
Limited key length: The maximum key length for RC4 is 2048 bits, which may not be sufficient for some applications that require stronger encryption.
Not recommended for new applications: Due to its vulnerabilities and weaknesses, RC4 is no longer recommended for use in new applications. Other more secure stream cipher algorithms, such as AES-CTR or ChaCha20, should be used instead.
