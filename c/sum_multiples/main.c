#include <stdio.h>

int mult_sum(int a, int b, int N) {
  // Finds the sum of all multiples of a and b < N

  int sum = 0;

  for(int i = 0; i < N; i++) {
    if(i % a == 0 || i % b == 0) {
      sum = sum + i;
    }
  }
  return sum;
}

void fizz_buzz(int a, int b, int N) {
  // Prints out FizzBuzz for all multiples of a and b < N

  int c = a * b;

  for(int i = 1; i < N; i++) {
    if(i % c == 0) {
      printf("FizzBuzz\n");
    } else if (i % a == 0) {
      printf("Fizz\n");
    } else if (i % b == 0) {
      printf("Buzz\n");
    } else {
      printf("%i\n", i);
    }
  }
}

int main() {
  int a = 3;
  int b = 5;
  int N;
  char response;

  printf("Enter a starting value: \n");
  scanf("%i", &N);

  printf("(F)izzBuzz or (S)um Multiples? F/S \n");
  scanf(" %c", &response);

  if(response == 'F') {
    fizz_buzz(a, b, N); 
  } else if (response == 'S') {
    int answer = mult_sum(a, b, N);
    printf("Answer is:  %i", answer);
  } else {
    printf("Invalid response");
  }
  return 0;
}

