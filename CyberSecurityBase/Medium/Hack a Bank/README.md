## Hack a Bank

### The Problem:

> The marketplace in CyberBank (https://cyber-bank.testmycode.io/) has information for sale that your 'friend' requires. 
> Sadly, you lack the necessary funds to acquire this information. 
> Use your hacking skills to obtain more currency and obtain the information.

### The Solution:

1.	Open _**OWASP-ZAP**_ and attack this site (i.e. https://cyber-bank.testmycode.io).
2.	Include the site in a new context with form-based authentication with your credentials.
3.	Spider the website with the created context.
4.	Right Click on **"POST:convert(amount%5B%5D,authenticity_token,commit,conversion,utf8)"** > then choose **"Resend"**.
5.	Edit **conversion** to be **"euros_to_cyber"** and **amount%5B%5D** to be **"0.9"** (without quotes).
6.	Send the request and check if the conversion completed successfully.
7.	Repeat step 4 > highlight the value of **amount%5B%5D** (i.e. **"0.9"**) > Right click > then choose **"Fuzz"**
8.	Choose **"payload"** > **"Add"** > Choose the type of **"Strings"**.
9. 	After doing the math, we need to send 1000 request roughly. So paste about 1000 line of "0.9" (without quotes) > **"Ok"** > **"Start Fuzzer"**.
10.	After converting the sufficient cyber-money (with the benefits due to the float deffect), Right click on **"POST:marketplace(authenticity_token)"** > then choose **"Resend"** > choose **"Send"**
11.	Inspect the response which contains the flag.

### The flag:
`itsnotsafeoutherehackersarebehindeverycorner`

