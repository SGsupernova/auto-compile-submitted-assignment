#include <stdio.h>

int main() {
	printf("1");
	FILE *fp = fopen("doesnotexist", "r");


	return 0;
}
