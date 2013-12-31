#include<stdio.h>
#include<stdlib.h>
#include<string.h>

// Max number of digits of int specifying line count, including null terminator
const int MAX_DIGIT_COUNT = 3;
// Max string size
const int MAX_STRING_SIZE = 256;

int main(int argc, char **argv){
	
	char lineCount[MAX_DIGIT_COUNT];
	fgets(lineCount, MAX_DIGIT_COUNT, stdin);
	unsigned int maxLines = atoi(lineCount);

	char stringBuffer[MAX_STRING_SIZE];
	char **textLines = malloc(sizeof(char *) * maxLines);

	for (unsigned int i = 0; i < maxLines; i++){
		fgets(stringBuffer, MAX_STRING_SIZE, stdin);
		textLines[i] = malloc(sizeof(char *) * strlen(stringBuffer));
		strcpy(textLines[i], stringBuffer);
	}

}
