int actionIncrement(int input) {

	return ++input;

};

int actionDecrement(int input) {

	return --input;

};

void actionDecide(int input) {

	if(input % 2 == 0) {

		actionIncrement(input);

	} else {

		actionDecrement(input);

	};

};

int main() {

	actionDecide(10);

}
