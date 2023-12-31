int factorial(int n) {

	if(n == 1) {
		return n;
	} else {
		return factorial(--n);
	}

}

int main() {

	return factorial(5);
}
