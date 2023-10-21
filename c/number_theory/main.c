#include <stdio.h>
#include <math.h>

// Basic number theory functions

int is_prime(int n) {
  if (n < 2) {
    return 0;
  } else if (n == 2) {
    return 1;
  } else if (n % 2 == 0) {
    return 0;
  } else {
    int p = floor(sqrt(n));
    for (int i = 3; i <= p; i+=2) {
      if (n % i == 0) {
	return 0;
      }
    }
    return 1;
  }
  return 0;
}

int count_primes(int n) {
  int count = 0;

  for (int i = 1; i < n; i++) {
    count = count + is_prime(i);
  }

  return count;
}

int main() {
  int N;

  printf("Enter a number: \n");
  scanf("%i", &N);

  printf("Is %i prime? %i \n", N, is_prime(N));
  printf("Number of primes less than %i: %i", N, count_primes(N));
}
