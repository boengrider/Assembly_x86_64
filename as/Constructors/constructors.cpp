class Person {
    public:
    int age;

    public:
    //Default ctor
    Person() {
        age = 1000;
    }
    //1st non-default ctor
    Person(int a) {
        age = a;
    }
    //2nd non-default ctor
    Person(int a, int b) {
        age = a * b;
    }

    //3rd non-default ctor
    Person(int a, int b, int c, int d, int e, int f) {
        age = a + b + c + d + e + f;
    }
};

int main() {

    Person JonDoe = Person(25, 50, 75, 100, 125, 150);
}