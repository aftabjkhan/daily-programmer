#include<stdio.h>
#include<stdlib.h>
#include<string.h>

// Aftab Khan, 2013

// Max number of digits of int specifying line count, including null terminator
const int MAX_DIGIT_COUNT = 3;
// Max string size (char count)
const int MAX_STRING_SIZE = 256;

int main(int argc, char **argv){
	
	char lineCount[MAX_DIGIT_COUNT];
	fgets(lineCount, MAX_DIGIT_COUNT, stdin);
	unsigned int maxLines = atoi(lineCount);
	
	char **textLines = malloc(sizeof(char *) * maxLines);
	unsigned int maxStringLength = 0;

	for (unsigned int i = 0; i < maxLines; i++){
		// Allocate space (zeroed) for string upto max size
		textLines[i] = (char *) calloc(MAX_STRING_SIZE, sizeof(char));
		fgets(textLines[i], MAX_STRING_SIZE, stdin);
		unsigned int length = strlen(textLines[i]);
		if (length > maxStringLength) maxStringLength = length;
	}

	for (unsigned int c = 0; c < maxStringLength - 1; c++){
		for (unsigned int l = 0; l < maxLines; l++){
			char currentChar = textLines[l][c];
			// Interpret 0 or newline (\n) characters as spaces
			if (currentChar == 0 || currentChar == '\n'){
				putc(' ', stdout);
			} else {
				putc(currentChar, stdout);
			}
		}
		printf("\n");
	}
	
}
