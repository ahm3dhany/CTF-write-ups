## Hidden Message   

### The Problem:

> A cyber Criminal is hiding information in the below file . capture the flag ? submit Flag in MD5 Format (https://s3-eu-west-1.amazonaws.com/talentchallenges/Forensics/hidden_message.jpg)

### The Solution:

- `strings hidden_message.jpg | grep -E '\w{32}'` 


### The flag: 
`b1a1f2855d2428930e0c9c4ce10500d5`


