#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

int main (int argc, char* argv[]) {

	//int key = 1;
	char* cipherText = "PloreFrphevglOnfrSyntN";
	
	for (int key = 1; key < 26; key++) {
		for (int i = 0, n = strlen(cipherText); i < n; i++) {
		        
			if (islower(cipherText[i])) {
				int before = cipherText[i] - 97;
				int after = (before + key) % 26;
				after = after + 97;
				printf("%c", after);     
			} else if (isupper(cipherText[i])) {
				int _before = cipherText[i] - 65;
				int _after = (_before + key) % 26;
				_after = _after + 65;
				printf("%c", _after); 
			} else {
				printf("%c", cipherText[i]);
			}

		}
		printf("\n");
	}
        return 0;

}
